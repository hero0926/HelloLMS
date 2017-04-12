package com.ja.id.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ja.id.domain.MemberVO;
import com.ja.id.dto.LoginDTO;
import com.ja.id.service.MemberService;
import com.ja.id.util.Email;
import com.ja.id.util.EmailSender;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value = "/member")
@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberservice;
	
	 @Autowired
	   private EmailSender emailSender;
	   @Autowired
	   private Email email;


	/**
	 * 김설화
	 */	
	
	@RequestMapping(value = "/register1")
	public String prereg(Locale locale, Model model, @RequestParam Map map) {
		logger.info("회원가입 약관 폼", locale);
		
		return "member/register1";
	}
	
	@RequestMapping(value = "/register2", method=RequestMethod.GET)
	public String register(Locale locale, Model model, @RequestParam Map map) {
		logger.info("회원가입 하기", locale);
		
		return "member/register2";
	}
	
	@Transactional(readOnly = false)
	@RequestMapping(value = "/register2", method=RequestMethod.POST)
	public String registered(Locale locale, MemberVO vo) {
		logger.info("회원가입 되기", locale);
		
		memberservice.insertMember(vo);
		
		return "redirect:loginPost";
	}
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {
		
	}
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPOST(LoginDTO dto, HttpSession session, Model model, @RequestParam Map map) throws Exception {
		//dto.setMxoffice((int)session.getAttribute("UOFFICE"));
		MemberVO vo = memberservice.login(dto);
		
		if(vo==null){
			return "member/login";
		}else{
		
		session.setAttribute("USEQ", vo.getMxseq());
		session.setAttribute("UID", vo.getMxid());
		session.setAttribute("UNAME", vo.getMxname());
		session.setAttribute("UDIV", vo.getMxdiv());
		session.setAttribute("UOFFICE", vo.getMxoffice());
		session.setAttribute("UMAIL", vo.getMxmail());
		
		map.put("deviceType", session.getAttribute("deviceType"));
		map.put("USEQ", session.getAttribute("USEQ"));
		System.out.println("loginPost--------------------------"+map);
		memberservice.loginHis(map);
		
		model.addAttribute("memberVO", vo);
		
		return "home";
		}
		
	}
	
	@RequestMapping(value = "/logout")
	public String logOUT(HttpSession session) throws Exception {
		
		session.removeAttribute("USEQ");
		session.removeAttribute("UID");
		session.removeAttribute("UNAME");
		session.removeAttribute("UDIV");
		session.removeAttribute("UOFFICE");
		
		return "redirect:/";
	}
	
	@RequestMapping(value ="/update", method = RequestMethod.GET)
	public String updatemember(HttpSession session) throws Exception{
		return "member/update";
	}
	
	@Transactional(readOnly = false)
	@RequestMapping(value ="/update", method = RequestMethod.POST)
	public String updatemember2(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		memberservice.update(vo);
		//session.invalidate();
		return "redirect:/";
	}
	
	@Transactional(readOnly = false)
	@RequestMapping(value ="/delete", method = RequestMethod.GET)
	public String deletemember(HttpSession session) throws Exception{
		String mxid = (String) session.getAttribute("UID");
		memberservice.deleteMember(mxid);
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value ="/id")
	public String findid(HttpServletRequest req,  ModelMap model,
			String mxname, String mxmail){
				
		String mxid = memberservice.id(mxname, mxmail);
		
		model.addAttribute("mxid", mxid);
		
		return "member/login";
		
	}
	
	@RequestMapping(value = "/chkDupId.do")
	 public void checkId(HttpServletRequest req, HttpServletResponse res,
	   ModelMap model) throws Exception {
		
	  PrintWriter out = res.getWriter();
	  try {
	   String paramId = (req.getParameter("mxid") == null) ? "" : String
	     .valueOf(req.getParameter("mxid"));

	   MemberVO vo = new MemberVO();
	   vo.setMxid(paramId.trim());
	   int chkPoint = memberservice.chkDupId(vo);

	   out.print(chkPoint);
	   out.flush();
	   out.close();
	  } catch (Exception e) {
	   e.printStackTrace();
	   out.print("1");
	  }
	 }
	
	@Transactional(readOnly = false)
	@RequestMapping(value ="/pw")
	public ModelAndView findpw(HttpServletRequest req, @RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception{
		
		ModelAndView mav;		
		
		String mxid = (String) paramMap.get("mxid");
		String mxname = (String) paramMap.get("mxname");
		String mxmail = (String) paramMap.get("mxmail2");		

		int Chk = memberservice.pw(mxid, mxname, mxmail);
		
		if(Chk!=0){ //아이디, 이름, 메일이 동일할때
			String pw = temporaryPassword(10);
			String mailtext = "안녕하세요, "+ mxname +"님! 새로 발급한 비밀번호는 "+pw+"입니다.";
			
			memberservice.pwupdate(pw, mxid);
			
			email.setContent(mailtext);
			email.setReceiver(mxmail);
			email.setSubject(mxname+"님 비밀번호 찾기 메일입니다.");
			
			emailSender.SendEmail(email);

			req.setAttribute("msg", "메일을 확인해보세요!");
			
			return mav = new ModelAndView("member/login");
			
		}else{ //아닐때
			req.setAttribute("msg", "그런 사람이 없습니다...");
			return mav = new ModelAndView("member/login");
		}
		
	}
	
	
	//임시비밀번호 발급하기(10자리!)
	public static String temporaryPassword(int size) {

		StringBuffer buffer = new StringBuffer();

		Random random = new Random();

		String chars[] = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9".
				split(",");				

		for (int i = 0; i < size; i++) {

		buffer.append(chars[random.nextInt(chars.length)]);

		}

		return buffer.toString();

		}
	
	@RequestMapping(value ="/contact")
	public ModelAndView contact(HttpServletRequest req, @RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception{
		
		ModelAndView mav;		
		
		String name = (String) paramMap.get("name");
		String mail = (String) paramMap.get("mail");
		String message = (String) paramMap.get("message");					
			System.out.println("mail:"+mail);
			email.setContent(message);
			email.setReceiver("gd3heroisme@gmail.com");
			email.setSubject(name+"님 께서 문의사항을 보내셨습니다!");
			
			emailSender.SendEmail(email);
			
			return mav = new ModelAndView("redirect:/");
	
		
	}

	

	
}
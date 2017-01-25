package com.ja.id.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ja.id.domain.MemberVO;
import com.ja.id.dto.LoginDTO;
import com.ja.id.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value = "/member")
@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberservice;
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
	public String loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {
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
		session.invalidate();
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
	

	
}
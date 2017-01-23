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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value = "/register2")
	public String register(Locale locale, Model model, @RequestParam Map map) {
		logger.info("회원가입 하기", locale);		
		return "member/register2";
	}
	
	@Transactional(readOnly = false)
	@RequestMapping(value = "/registered")
	public String registered(Locale locale, MemberVO vo) {
		logger.info("회원가입 되기", locale);		
		memberservice.insertMember(vo);		
		return "home";
	}
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {		
	}
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {
		
		MemberVO vo = memberservice.login(dto);
		
		if(vo==null){
			//로그인 실패
			session.setAttribute("LOGIN", null);
			session.setAttribute("USEQ", null);
			return "member/login";
		}else{
			//로그인 성공
			session.setAttribute("LOGIN", "success");
		session.setAttribute("USEQ", vo.getMxseq());
		session.setAttribute("UID", vo.getMxid());
		session.setAttribute("UNAME", vo.getMxname());
		session.setAttribute("UDIV", vo.getMxdiv());
		session.setAttribute("UOFFICE", vo.getMxoffice());
		
		
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
		//session.invalidate();
		return "home";
	}
	
	@RequestMapping(value = "/id")
	public void idfind(Locale locale, MemberVO vo) {
		logger.info("아이디 찾기", locale);	
	}
	
}
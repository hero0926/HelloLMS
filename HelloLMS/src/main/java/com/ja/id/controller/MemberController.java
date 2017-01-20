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
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {
		
	}
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {
		
		MemberVO vo = memberservice.login(dto);
		
		if(vo==null){
			return "member/login";
		}
		
		session.setAttribute("mxid", vo.getMxid());
		session.setAttribute("mxname", vo.getMxname());
		model.addAttribute("memberVO", vo);
		
		return "home";
		
	}
	
	@RequestMapping(value = "/logout")
	public String logOUT(HttpSession session) throws Exception {
		
		session.removeAttribute("mxid");
		//session.invalidate();
		return "home";
	}
	
}
package com.ja.id.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ja.id.service.CodeService;
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
	
	@RequestMapping(value = "/register1", method = RequestMethod.POST)
	public String prereg(Locale locale, Model model, @RequestParam Map map) {
		logger.info("회원가입 약관 폼", locale);
		
		return "member/register1";
	}
	
	@RequestMapping(value = "/register2", method = RequestMethod.POST)
	public String register(Locale locale, Model model, @RequestParam Map map) {
		logger.info("회원가입 하기", locale);
		
		return "member/register2";
	}

	
}
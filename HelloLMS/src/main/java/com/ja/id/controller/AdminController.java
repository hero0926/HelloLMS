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

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value = "/admin")
@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private CodeService codeService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = {RequestMethod.POST, RequestMethod.GET})
	public String home(Locale locale, Model model, HttpSession session, @RequestParam Map map) {
		logger.info("controller admin main.", locale);

		if(null!=session.getAttribute("UID")){
			map.put("level", "top");
			List<HashMap> list1 = codeService.selectCode(map);
			model.addAttribute("list1", list1);
			
			if(null!=map.get("cxgubun")){
				map.put("level", "sub");
				List<HashMap> list2 = codeService.selectCode(map);
				model.addAttribute("list2", list2);
			}
			session.setAttribute("adMenu", "1");
			return "etc/ad_codeList";
		} else {
			return "member/ad_login";
		}
	}
	
	@RequestMapping(value = "/login", method = {RequestMethod.POST, RequestMethod.GET})
	public String login(Locale locale, @RequestParam Map map, HttpSession session) {
		logger.info("Welcome login! The client locale is {}.", locale);
		String id = (String) map.get("id");
		String pass = (String) map.get("password");

		if(null!=id&&id.equals("admin")&&null!=pass&&pass.equals("1234")){
			session.setAttribute("UID", "admin");
			session.setAttribute("UNAME", "관리자");
			return "redirect:/admin/";
		} else {
			return "member/ad_login";
		}
	}

	@RequestMapping(value = "/insertCode", method = RequestMethod.POST)
	public String insertCode(Locale locale, Model model, @RequestParam Map map) {
		logger.info("controller start insert.", locale);
		
		int count = 0;
		System.out.println(map);

		try {
			System.out.println(codeService);
			count = codeService.insertCode(map);
			System.out.println("2");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("success_flag", "N");
		}
		if (0 < count) {
			model.addAttribute("success_flag", "Y");
		} else {
			model.addAttribute("success_flag", "N");
		}
		model.addAttribute("forward_url", "/admin/");
		
		return "common/common_alert";
	}
	
}

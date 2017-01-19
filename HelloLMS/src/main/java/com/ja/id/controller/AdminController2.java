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

import com.ja.id.service.AdminService;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value = "/admin/lecture")
@Controller
public class AdminController2 {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController2.class);
	
	@Autowired
	private AdminService adminService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/lectureList", method = {RequestMethod.POST, RequestMethod.GET})
	public String courseList(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		session.setAttribute("USEQ", "2"); //로그인 부분 완성 하면 이 부분 뺄것
		session.setAttribute("UID", "test");
		session.setAttribute("UNAME", "강사");
		session.setAttribute("UDIV", "T");
		
		session.setAttribute("Menu", "1");
		
		/*map.put("USEQ", session.getAttribute("USEQ"));
		List<HashMap> lectureList;
		lectureList = adminService.getLectureList(map);
		
		model.addAttribute("list", lectureList);*/
		
		return "lecture/ad_lectureList";
	}
	
}

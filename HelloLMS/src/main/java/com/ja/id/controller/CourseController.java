package com.ja.id.controller;

import java.text.DateFormat;
import java.util.Date;
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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ja.id.service.CourseService;

import net.sf.cglib.core.Local;

/**
 * Handles requests for the application home page.
 */

@Controller
public class CourseController {

	@Autowired
	private CourseService courseservice;

	private static final Logger logger = LoggerFactory.getLogger(CourseController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/course/main", method = {RequestMethod.POST,RequestMethod.GET})
	public String getAllCourse(@RequestParam Map map , Locale locale, Model model, HttpSession session) {
		logger.info("媛뺤쥖 硫붿씤", locale);
		model.addAttribute("course", courseservice.getAllcourse(map));
		

		return "/course/main";
	}

	@RequestMapping(value = "/intro", method =RequestMethod.POST)
	public String intro(Model model,  HttpSession session){
		
		 return "/intro";
	}
	
	@RequestMapping(value = "/course/apply" , method={RequestMethod.POST,RequestMethod.GET})
	public String getAllapply(Model model, HttpSession session, Locale locale ,Map map ){
	
		logger.info("신청", locale); 
		model.addAttribute("apply", map.get(courseservice.getAllapply(map)));  
		
		
		return "/course/apply"; 
	}

}

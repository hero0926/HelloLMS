package com.ja.id.controller;

import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ja.id.domain.SearchCriteria;
import com.ja.id.service.CourseSelectService;
import com.ja.id.service.CourseService;

@Controller
@RequestMapping("/scourse/*")
public class SearchBoardController {
	
	 private static final Logger logger = LoggerFactory.getLogger(SearchBoardController.class);
	 
	 @Inject
	 private CourseSelectService service;
	 
	 //전체 강좌 리스트
	 @RequestMapping(value = "/list", method = RequestMethod.GET)
	  public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model, @RequestParam Map map) throws Exception {

	    logger.info(cri.toString());	    

	    // model.addAttribute("list", service.listCriteria(cri));
	    model.addAttribute("list", service.SelectSearchCourse(map));	    
	 }	 


}

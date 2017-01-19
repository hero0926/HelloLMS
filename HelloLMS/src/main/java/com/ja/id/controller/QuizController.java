package com.ja.id.controller;

import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ja.id.service.QuizService;

@RequestMapping(value = "/member")
@Controller
public class QuizController {
	
	private static final Logger Logger = LoggerFactory.getLogger(QuizController.class);
	
	@Autowired
	private QuizService quizService;
	
	@RequestMapping(value = "/quiz")
	public String quiz(Locale locale, @RequestParam Map map){
		Logger.info("quiz", locale);
		
		return "member/quiz";
		
	}
	
	@RequestMapping(value="/quizQuestion")
	public String quizQuestion(Locale locale, @RequestParam Map map){
		Logger.info("ƒ˚¡Ó«Æ±‚", locale);
		
		return "member/quizQuestion";
		
	}
	
	

}

package com.ja.id.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.id.service.QuizService;

@RequestMapping(value = "/quiz")
@Controller
public class QuizController {
	
	private static final Logger Logger = LoggerFactory.getLogger(QuizController.class);
	
	@Autowired
	private QuizService quizService;
	
	
	

}

package com.ja.id.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ja.id.service.QuizService;

//@RequestMapping(value = "/*")
@Controller
public class QuizController {
	
	private static final Logger logger = LoggerFactory.getLogger(QuizController.class);
	
	@Autowired
	private QuizService quizService;
	
/*	@RequestMapping(value = "/quiz")
	public String quiz(Locale locale, @RequestParam Map map){
		Logger.info("quiz", locale);
		
		return "quiz/quiz";
		
	}*/
	
	@RequestMapping(value = "/quiz", method = {RequestMethod.POST, RequestMethod.GET})
	public String quiz(Locale locale, Model model, @RequestParam Map map) {
		logger.info("controller quiz.", locale);
		model.addAttribute("lxseq", map.get("lxseq"));
		return "quiz/quiz";
	}
	
	@RequestMapping(value="/quizQuestion")
	public String quizQuestion(Locale locale, Model model, HttpSession session, @RequestParam Map map){
		logger.info("quizQuestion", locale);
		map.put("mxseq", session.getAttribute("USEQ"));
		List<HashMap> quizList = quizService.selectQuiz(map);
		model.addAttribute("quizList", quizList);

		return "quiz/quizQuestion";
		
	}

	@RequestMapping(value="/quizAjax")
	@ResponseBody
	public String quizAnswer(Locale locale, Model model, HttpSession session, @RequestParam Map map){
		logger.info("quizAnswer", locale);
		map.put("mxseq", session.getAttribute("USEQ"));
		int result = 0;
		if(map.get("qaxseq")==null||((String)map.get("qaxseq")).trim().length()<1){
			result = quizService.insertQxanswer(map);
		} else {
			result = quizService.updateQxanswer(map);
		}

		return "ok";
		
	}

}

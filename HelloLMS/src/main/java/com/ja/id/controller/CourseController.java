package com.ja.id.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.request;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.runner.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
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
	// 신청가능한 강좌 목록
	@RequestMapping(value = "/course/viewcourse", method = { RequestMethod.POST, RequestMethod.GET })
	public String getAllCourse(@RequestParam Map map, Locale locale, Model model, HttpSession session) {
		logger.info("getAllCourse", locale);
		map.put("USEQ", session.getAttribute("USEQ"));
		map.put("coxoffice", session.getAttribute("UOFFICE"));

		model.addAttribute("course", courseservice.getAllcourse(map));

		session.setAttribute("Menu", "2");

		// System.out.println("========================");
		// System.out.println(map.size());
		// System.out.println("========================");

		return "/course/viewcourse";
	}

	// 수강 신청
	@RequestMapping(value = "/course/apply", method = { RequestMethod.POST, RequestMethod.GET })
	public String selectapply(Model model, HttpSession session, Locale locale, @RequestParam Map map) throws Exception {
		System.out.println(map);
		map.put("USEQ", session.getAttribute("USEQ"));

		logger.info("selectapply", locale);

		/* List<HashMap> List = courseservice.applycheck(map); */

		/*
		 * String mxseq = (String) List.get(0).get("mxseq"); String coxseq =
		 * (String) List.get(0).get("coxseq");
		 */
		/*
		 * JsonObject jObj = new JsonObject();
		 * 
		 * if (0 == courseservice.selectapply(map)) { jObj.addProperty("IsDup",
		 * "N"); return new Gson().toJson(jObj); } else {
		 * jObj.addProperty("IsDup", "Y"); return new Gson().toJson(jObj); }
		 */

		int count = 0;

		try {
			count = courseservice.insertApply(map);
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
		model.addAttribute("forward_url", "/course/viewcourse");

		return "common/common_alert";

	}

	// 진행중인 강좌
	@RequestMapping(value = "/course/applycourse", method = { RequestMethod.POST, RequestMethod.GET })
	public String applycourse(@RequestParam Map map, Locale locale, Model model, HttpSession session) {
		logger.info("applycourse", locale);
		map.put("USEQ", session.getAttribute("USEQ"));
		map.put("coxoffice", session.getAttribute("UOFFICE"));
		
		session.setAttribute("Menu", "2");

		List<HashMap> list = courseservice.applycourse(map);

		model.addAttribute("courseA", list);

		return "/course/applycourse";

	}

	// 수강 취소
	@RequestMapping(value = "/course/applyDelte", method = { RequestMethod.POST, RequestMethod.GET })
	public String applyDelte(Model model, Locale locale, @RequestParam Map map) throws Exception {

		logger.info("applyDelte", locale);

		int count = 0;

		try {
			count = courseservice.applyDelte(map);
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
		model.addAttribute("forward_url", "/course/viewcourse");

		return "common/common_alert";
	}
	//강의목록 
	@RequestMapping(value = "/course/LectureList", method = { RequestMethod.POST, RequestMethod.GET })
	public String lectureList(@RequestParam Map map, Locale locale, Model model, HttpSession session) {
		logger.info("LectureList", locale);
		map.put("USEQ", session.getAttribute("USEQ"));

		List<HashMap> list = courseservice.lectureList(map);

		model.addAttribute("LectureList", list);
		if(list!=null){
			model.addAttribute("lecture", list.get(0));
		}

		System.out.println(list.get(0).get("coxseq"));
		
		return "/course/LectureList";
	}
	
}

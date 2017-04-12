package com.ja.id.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.request;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.ja.id.service.CourseService;
import com.ja.id.service.OpenCourseService;

import net.sf.cglib.core.Local;

/**
 * Handles requests for the application home page.
 */

@Controller
public class OpenCourseController {

	@Autowired
	private OpenCourseService oepnCourseService;
	
	@Value("${file.download.lecture}")
	private String fileDownloadPath;

	private static final Logger logger = LoggerFactory.getLogger(OpenCourseController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/course/openCourse", method = { RequestMethod.POST, RequestMethod.GET })
	public String openCourse(Model model, Locale locale, @RequestParam Map map) throws Exception {
		
		List<HashMap> openCourseList;
		openCourseList = oepnCourseService.openCourseList(map);
		model.addAttribute("list", openCourseList);
		model.addAttribute("size", openCourseList.size());
		System.out.println("openCourse-------------"+model);
		
		return "course/openCourse";
		
	}
	
	@RequestMapping(value = "/course/openLecture", method = { RequestMethod.POST, RequestMethod.GET })
	public String openLecture(Model model, Locale locale, @RequestParam Map map) throws Exception {
		
		List<HashMap> openLectureList;
		openLectureList = oepnCourseService.openLectureList(map);
		model.addAttribute("list", openLectureList);
		if(openLectureList.size()!=0){
			model.addAttribute("coxname", openLectureList.get(0).get("coxname"));
		}
		
		return "lecture/openLecture";

	}
	
	@RequestMapping(value = "/course/lecture", method = {RequestMethod.POST, RequestMethod.GET})
	public String lecture(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		System.out.println("/course/lecture-----------------------------"+map);
		List<HashMap> lecturelist;
		lecturelist = oepnCourseService.getLecture(map);
		model.addAttribute("list", lecturelist);
		//model.addAttribute("lxtype", map.get("lxtype"));
		model.addAttribute("lecture", map);
		
		return "mylecture/lecture";
		
	}
	
	@RequestMapping("/course/download")
    public ModelAndView download(@RequestParam("fileName")String fileName){
         
        String fullPath = fileDownloadPath + fileName;
        System.out.println("fileDownloadPath------------"+fileDownloadPath);
        System.out.println("fullPath------------"+fullPath);
         
        File file = new File(fullPath);
         
        return new ModelAndView("download", "downloadFile", file);
    }
	
}

package com.ja.id.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

import javax.activation.CommandMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.ja.id.service.MyLectureService;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value = "/mypage/mylecture")
@Controller
public class MyLectureController {
	
	private static final Logger logger = LoggerFactory.getLogger(MyLectureController.class);
	
	@Autowired
	private MyLectureService mylectureService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/myApplyCourse", method = {RequestMethod.POST, RequestMethod.GET})
	public String myApplyCourse(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		if(null!=session.getAttribute("UID")){
		session.setAttribute("Menu", "1");
		
		map.put("USEQ", session.getAttribute("USEQ"));
		
		List<HashMap> applycourselist;
		applycourselist = mylectureService.getAllApplyCourse(map);
		model.addAttribute("list", applycourselist);
		model.addAttribute("mxseq", session.getAttribute("USEQ"));
		
		return "mylecture/myApplyCourse";
		} else {
			return "member/loginPost";
		}
	}
	
	@RequestMapping(value = "/myApplyCourseDelete", method = {RequestMethod.POST, RequestMethod.GET})
	public String myApplyCourseDelete(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		if(null!=session.getAttribute("UID")){
/*		mylectureService.applyCourseDelete(map);
		
		map.put("USEQ", session.getAttribute("USEQ"));
		
		List<HashMap> applycourselist;
		applycourselist = mylectureService.getAllApplyCourse(map);
		model.addAttribute("list", applycourselist);
		model.addAttribute("mxseq", session.getAttribute("USEQ"));
		
		return "mylecture/myApplyCourse";*/
		
		int count = 0;

		try {
			count = mylectureService.applyCourseDelete(map);
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
		model.addAttribute("forward_url", "/mypage/mylecture/myApplyCourse");
		
		return "common/common_alert";
		} else {
			return "member/loginPost";
		}
	}
	
	@RequestMapping(value = "/myCourse", method = {RequestMethod.POST, RequestMethod.GET})
	public String myCourse(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		if(null!=session.getAttribute("UID")){
		map.put("USEQ", session.getAttribute("USEQ"));
		
		List<HashMap> courselist;
		courselist = mylectureService.getAllCourse(map);
		model.addAttribute("list", courselist);
		session.setAttribute("Menu", "1");
		
		return "mylecture/myCourse";
		} else {
			return "member/loginPost";
		}
	}
	
	@RequestMapping(value = "/testpopup", method = {RequestMethod.POST, RequestMethod.GET})
	public String testpopup(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		if(null!=session.getAttribute("UID")){
			map.put("USEQ", session.getAttribute("USEQ"));
			
			List<HashMap> testpaperList = mylectureService.selectTestpaper(map);
			model.addAttribute("testpaperList", testpaperList);
			model.addAttribute("coxname", testpaperList.get(0).get("coxname"));
			
			return "mylecture/testpopup";
		} else {
			return "member/loginPost";
		}
	}
	
	@RequestMapping(value = "/testpool", method = {RequestMethod.POST, RequestMethod.GET})
	public String testpool(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		
		map.put("USEQ", session.getAttribute("USEQ"));
		
		List<HashMap> testpoolList;
		testpoolList = mylectureService.testpoolList(map);
		model.addAttribute("testpoolList", testpoolList);
		System.out.println("testpool--------------"+model);
		
		return "mylecture/testpopup2";
	}
	
	@RequestMapping(value = "/ajaxTest", method = {RequestMethod.POST, RequestMethod.GET})
	public String ajaxTest(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		System.out.println("ajaxTest-------------------"+map);
		
		return "mylecture/testpopup2";
	}
	
	@RequestMapping(value = "/historypopup", method = {RequestMethod.POST, RequestMethod.GET})
	public String historypopup(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		if(null!=session.getAttribute("UID")){
		map.put("USEQ", session.getAttribute("USEQ"));
		
		List<HashMap> historyList;
		historyList = mylectureService.getHistory(map);
		
		model.addAttribute("historyList", historyList);
		
		return "mylecture/historypopup";
		} else {
			return "member/loginPost";
		}
	}
	
	@RequestMapping(value = "/quizpopup", method = {RequestMethod.POST, RequestMethod.GET})
	public String quizpopup(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		if(null!=session.getAttribute("UID")){
			map.put("USEQ", session.getAttribute("USEQ"));
			
			return "mylecture/quizpopup";
		} else {
			return "member/loginPost";
		}
	}
	
	@RequestMapping(value = "/myLecture", method = {RequestMethod.POST, RequestMethod.GET})
	public String myLecture(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		if(null!=session.getAttribute("UID")){
		map.put("USEQ", session.getAttribute("USEQ"));
		
		List<HashMap> lecturelist;
		lecturelist = mylectureService.getLecture(map);
		model.addAttribute("list", lecturelist);
		
		return "mylecture/myLecture";
		} else {
			return "member/loginPost";
		}
	}
	
	@RequestMapping(value = "/lecture", method = {RequestMethod.POST, RequestMethod.GET})
	public String lecture(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		if(null!=session.getAttribute("UID")){
		map.put("USEQ", session.getAttribute("USEQ"));
		List<HashMap> lecturelist;
		lecturelist = mylectureService.getLecture(map);
		model.addAttribute("list", lecturelist);
		//model.addAttribute("lxtype", map.get("lxtype"));
		model.addAttribute("lecture", map);
		
		return "mylecture/lecture";
		} else {
			return "member/loginPost";
		}
	}
	
	@RequestMapping(value = "/lexstudy", method = {RequestMethod.POST, RequestMethod.GET}, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String lexstudy(Locale locale, Model model, HttpSession session, @RequestParam Map map, HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(null!=session.getAttribute("UID")){
		map.put("USEQ", session.getAttribute("USEQ"));
		List<HashMap> lecturelist;
		lecturelist = mylectureService.islexstudy(map);
		if(lecturelist.size()==0){
			mylectureService.lexstudyinsert(map);
		}else{
			mylectureService.lexstudyupdate(map);
		}
		mylectureService.lexstudyloginsert(map);
		return "";
		} else {
			return "member/loginPost";
		}
	}
	
}

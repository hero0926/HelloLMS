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
		
		session.setAttribute("USEQ", "1"); //로그인 부분 완성 하면 이 부분 뺄것
		session.setAttribute("UID", "test");
		session.setAttribute("UNAME", "홍길동");
		session.setAttribute("UDIV", "S");
		
		session.setAttribute("Menu", "1");
		
		map.put("USEQ", session.getAttribute("USEQ"));
		
		List<HashMap> applycourselist;
		applycourselist = mylectureService.getAllApplyCourse(map);
		model.addAttribute("list", applycourselist);
		
		return "mylecture/myApplyCourse";
	}
	
	@RequestMapping(value = "/myCourse", method = {RequestMethod.POST, RequestMethod.GET})
	public String myCourse(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		
		map.put("USEQ", session.getAttribute("USEQ"));
		
		List<HashMap> courselist;
		courselist = mylectureService.getAllCourse(map);
		model.addAttribute("list", courselist);
		session.setAttribute("Menu", "1");
		
		/*map.put("coxseq", courselist.get(0).get("coxseq"));

		/*List<HashMap> lecturelist2 = mylectureService.getAllCnt(map);
		int allCnt = Integer.parseInt(lecturelist2.get(0).get("cnt").toString());
		List<HashMap> lecturelist3 = mylectureService.getCnt(map);
		int cnt = Integer.parseInt(lecturelist3.get(0).get("cnt").toString());
		
		double prog = ((double)cnt/allCnt)*100;
		model.addAttribute("prog", prog);*/
		
		return "mylecture/myCourse";
	}
	
	@RequestMapping(value = "/testpopup", method = {RequestMethod.POST, RequestMethod.GET})
	public String testpopup(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		
		map.put("USEQ", session.getAttribute("USEQ"));
		
		return "mylecture/testpopup";
	}
	
	@RequestMapping(value = "/historypopup", method = {RequestMethod.POST, RequestMethod.GET})
	public String historypopup(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		
		map.put("USEQ", session.getAttribute("USEQ"));
		
		return "mylecture/historypopup";
	}
	
	@RequestMapping(value = "/quizpopup", method = {RequestMethod.POST, RequestMethod.GET})
	public String quizpopup(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		
		map.put("USEQ", session.getAttribute("USEQ"));
		
		return "mylecture/quizpopup";
	}
	
	@RequestMapping(value = "/myLecture", method = {RequestMethod.POST, RequestMethod.GET})
	public String myLecture(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		
		map.put("USEQ", session.getAttribute("USEQ"));
		
		List<HashMap> lecturelist;
		lecturelist = mylectureService.getLecture(map);
		model.addAttribute("list", lecturelist);
		
		return "mylecture/myLecture";
	}
	
	@RequestMapping(value = "/lecture", method = {RequestMethod.POST, RequestMethod.GET})
	public String lecture(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		
		
		String lxlink = (String)map.get("lxlink");
		model.addAttribute("lxlink", lxlink);
		
		map.put("USEQ", session.getAttribute("USEQ"));
		
		List<HashMap> lecturelist;
		lecturelist = mylectureService.getLecture(map);
		model.addAttribute("list", lecturelist);
		
		return "mylecture/lecture";
	}
	
	@RequestMapping(value = "/lexstudy", method = {RequestMethod.POST, RequestMethod.GET}, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String lexstudy(Locale locale, Model model, HttpSession session, @RequestParam Map map, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Gson gson = new Gson();
		String g = gson.toJson(map);
		
		map.put("USEQ", session.getAttribute("USEQ"));
		
		List<HashMap> lecturelist;
		lecturelist = mylectureService.islexstudy(map);
		if(lecturelist.size()==0){
			mylectureService.lexstudyinsert(map);
			mylectureService.lexstudyloginsert(map);
		}else{
			mylectureService.lexstudyupdate(map);
			mylectureService.lexstudyloginsert(map);
		}
		
		return "";
	}
	
}

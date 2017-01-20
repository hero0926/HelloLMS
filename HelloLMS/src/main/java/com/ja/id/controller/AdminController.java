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

import com.ja.id.service.AdminService;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value = "/admin")
@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService adminService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = {RequestMethod.POST, RequestMethod.GET})
	public String home(Locale locale, Model model, HttpSession session, @RequestParam Map map) {
		logger.info("controller admin main.", locale);
		
		if(null!=session.getAttribute("UID")){
			map.put("level", "top");
			List<HashMap> list1 = adminService.selectCode(map);
			model.addAttribute("list1", list1);
			
			if(null!=map.get("cxgubun")){
				map.put("level", "sub");
				List<HashMap> list2 = adminService.selectCode(map);
				model.addAttribute("list2", list2);
			}
			session.setAttribute("adMenu", "1");
			return "etc/ad_codeList";
		} else {
			return "member/ad_login";
		}
	}
	
	@RequestMapping(value = "/login", method = {RequestMethod.POST, RequestMethod.GET})
	public String login(Locale locale, @RequestParam Map map, HttpSession session) {
		logger.info("Welcome login! The client locale is {}.", locale);
		String id = (String) map.get("id");
		String pass = (String) map.get("password");

		if(null!=id&&id.equals("admin")&&null!=pass&&pass.equals("1234")){
			session.setAttribute("USEQ", "1"); //로그인 부분 완성 하면 이 부분 뺄것
			session.setAttribute("UID", "admin");
			session.setAttribute("UNAME", "관리자");
			session.setAttribute("UDIV", "A");

			return "redirect:/admin/";
		} else {
			return "member/ad_login";
		}  
	}

	@RequestMapping(value = "/insertCode", method = RequestMethod.POST)
	public String insertCode(Locale locale, Model model, @RequestParam Map map) {
		logger.info("controller start insert.", locale);
		
		int count = 0;

		try {
			count = adminService.insertCode(map);
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
		model.addAttribute("forward_url", "/admin/");
		
		return "common/common_alert";
	}

	
	@RequestMapping(value = "/deleteCode", method = RequestMethod.POST)
	public String deleteCode(Locale locale, Model model, @RequestParam Map map) {
		logger.info("controller delete code.", locale);
		
		int count = 0;

		try {
			count = adminService.deleteCode(map);
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
		model.addAttribute("forward_url", "/admin/");
		
		return "common/common_alert";
	}
	
	@RequestMapping(value = "/courseList", method = {RequestMethod.POST, RequestMethod.GET})
	public String courseList(Locale locale, Model model, HttpSession session, @RequestParam Map map) {
		logger.info("controller courseList.", locale);
		
		map.put("level", "sub");
		map.put("cxgubun", "002");
		List<HashMap> bizList = adminService.selectCode(map);
		model.addAttribute("bizList", bizList);
		
		String coxoffice = (String)map.get("coxoffice");
		if(null==coxoffice){
			coxoffice = String.valueOf((int)bizList.get(0).get("cxseq"));
			
			map.put("coxoffice", coxoffice);
		}
		List<HashMap> courseList = adminService.selectCourse(map);
		model.addAttribute("courseList", courseList);
		model.addAttribute("coxoffice", coxoffice);
		
		session.setAttribute("adMenu", "3");
		return "course/ad_courseList";
	}
	
	@RequestMapping(value = "/courseWriteForm", method = {RequestMethod.POST, RequestMethod.GET})
	public String courseWriteForm(Locale locale, Model model, @RequestParam Map map) {
		logger.info("controller courseWriteForm.", locale);
		map.put("level", "sub");
		map.put("cxgubun", "001");
		List<HashMap> cateList = adminService.selectCode(map);
		model.addAttribute("cateList", cateList);

		String coxoffice = (String)map.get("coxoffice");
		
		map.put("level", "sub");
		map.put("cxgubun", "002");
		map.put("cxseq", coxoffice);
		model.addAttribute("coxofficenm", adminService.selectCode(map).get(0).get("cxname"));
		List<HashMap> tutorList = adminService.selectTutor(map);
		model.addAttribute("tutorList", tutorList);
		
		String coxseq = (String)map.get("coxseq");
		if(null!=coxseq){
			List<HashMap> courseList = adminService.selectCourse(map);
			model.addAttribute("course", courseList.get(0));
		}
		model.addAttribute("coxoffice", coxoffice);
		
		return "course/ad_courseWrite";
	}
	
	@RequestMapping(value = "/courseWrite", method = RequestMethod.POST)
	public String courseWrite(Locale locale, Model model, @RequestParam Map map, HttpSession session) {
		logger.info("controller start courseWrite.", locale);
		
		int count = 0;
		String coxoffice = (String)map.get("coxoffice");
		String coxseq = (String)map.get("coxseq");
		if (coxseq==null) coxseq= "";
		//model.addAttribute("coxoffice", coxoffice);
		try {
			map.put("mxseq", session.getAttribute("USEQ"));
			map.put("coxstart", ((String)map.get("coxstart")).replace("-", ""));
			map.put("coxend", ((String)map.get("coxend")).replace("-", ""));
			map.put("coxreqstart", ((String)map.get("coxreqstart")).replace("-", ""));
			map.put("coxreqend", ((String)map.get("coxreqend")).replace("-", ""));
			if (coxseq.length()>0){
				count = adminService.updateCourse(map);
			} else {
				count = adminService.insertCourse(map);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("success_flag", "N");
			model.addAttribute("forward_url", "/admin/courseWriteForm?coxoffice="+coxoffice+"&coxseq="+coxseq);
		}
		if (0 < count) {
			model.addAttribute("success_flag", "Y");
			model.addAttribute("forward_url", "/admin/courseList?coxoffice="+coxoffice);
		} else {
			model.addAttribute("success_flag", "N");
			model.addAttribute("forward_url", "/admin/courseWriteForm?coxoffice="+coxoffice+"&coxseq="+coxseq);
		}
		
		return "common/common_alert";
	}
	
	
	@RequestMapping(value = "/courseDelete", method = RequestMethod.POST)
	public String deleteCourse(Locale locale, Model model, @RequestParam Map map) {
		logger.info("controller delete course.", locale);
		
		int count = 0;
		String coxoffice = (String)map.get("coxoffice");
		try {
			count = adminService.deleteCourse(map);
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
		model.addAttribute("forward_url", "/admin/courseList?coxoffice="+coxoffice);
		
		return "common/common_alert";
	}
	
	@RequestMapping(value = "/testpoolList", method = {RequestMethod.POST, RequestMethod.GET})
	public String testpoolList(Locale locale, Model model, HttpSession session, @RequestParam Map map) {
		logger.info("controller testpoolList.", locale);
		
		List<HashMap> courseList = adminService.selectCourse(map);
		model.addAttribute("courseList", courseList);
		
		List<HashMap> testpoolList = adminService.selectTestpool(map);
		model.addAttribute("testpoolList", testpoolList);
		
		
		
		session.setAttribute("adMenu", "4");
		return "exam/ad_testpoolList";
	}
	
	@RequestMapping(value = "/testpoolWriteForm", method = {RequestMethod.POST, RequestMethod.GET})
	public String testpoolWriteForm(Locale locale, Model model, @RequestParam Map map) {
		logger.info("controller testpoolWriteForm.", locale);

		String coxseq = (String)map.get("coxseq");
		model.addAttribute("coxseq", coxseq);
		
		
		String txseq = (String)map.get("txseq");
		if(null!=txseq){
			List<HashMap> testpoolList = adminService.selectTestpool(map);
			model.addAttribute("testpool", testpoolList.get(0));
		}
		
		return "course/ad_testpoolWrite";
	}
}

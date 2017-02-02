package com.ja.id.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ja.id.service.Admin2Service;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value = {"/admin/lecture", "/admin/course"})
@Controller
public class AdminController2 {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController2.class);
	
	@Value("${file.upload.lecture}")
	private String fileUploadPath;
	
	@Autowired
	private Admin2Service adminService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/lectureList", method = {RequestMethod.POST, RequestMethod.GET})
	public String lectureList(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		/*session.setAttribute("USEQ", "2"); //로그인 부분 완성 하면 이 부분 뺄것
		session.setAttribute("UID", "test");
		session.setAttribute("UNAME", "강사");
		session.setAttribute("UDIV", "T");*/
		
		session.setAttribute("Menu", "1");
		
		map.put("USEQ", session.getAttribute("USEQ"));
		List<HashMap> lectureList;
		lectureList = adminService.getLectureList(map);
		
		model.addAttribute("list", lectureList);
		model.addAttribute("coxseq", map.get("coxseq"));
		
		return "lecture/ad_lectureList";
	}
	
	@RequestMapping(value = "/fileUpload", method = {RequestMethod.POST, RequestMethod.GET})
	public String fileUpload(Locale locale, Model model, HttpSession session, @RequestParam Map map, @RequestParam(value = "lxfile") List<MultipartFile> files, String uploadpath) throws Exception {
		String fileName = "";
		for (int i = 0; i < files.size(); i++) {
			MultipartFile file = (MultipartFile) files.get(i);
			//System.out.println(file.isEmpty() + "==============="+i);
			if (!file.isEmpty()){
				File newFile = new File(fileUploadPath/* + sub*/ + file.getOriginalFilename());
				file.transferTo(newFile);
				fileName += file.getOriginalFilename() + "|";
				model.addAttribute("originalFileName", fileName);
			}
			map.put("fileName", file.getOriginalFilename());
			adminService.updateFile(map);
		}
		
		map.put("USEQ", session.getAttribute("USEQ"));
		List<HashMap> lectureList;
		lectureList = adminService.getLectureList(map);
		
		model.addAttribute("list", lectureList);
		model.addAttribute("coxseq", map.get("coxseq"));
		
		return "lecture/ad_lectureList";
	}
	
	@RequestMapping(value = "/lectureDel", method = {RequestMethod.POST, RequestMethod.GET})
	public String lectureDel(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		adminService.lectureDel(map);
		
		map.put("USEQ", session.getAttribute("USEQ"));
		List<HashMap> lectureList;
		lectureList = adminService.getLectureList(map);
		
		model.addAttribute("list", lectureList);
		model.addAttribute("coxseq", map.get("coxseq"));
		
		return "lecture/ad_lectureList";
	}
	
	@RequestMapping(value = "/lectureInsertPage", method = {RequestMethod.POST, RequestMethod.GET})
	public String lectureInsertPage(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		
		model.addAttribute("coxseq", map.get("coxseq"));
		map.put("USEQ", session.getAttribute("USEQ"));
		
		List<HashMap> lectureList;
		lectureList = adminService.getLectureList(map);
		
		model.addAttribute("list", lectureList);
		
		List<HashMap> cateList = adminService.selectCode(map);
		model.addAttribute("cateList", cateList);
		
		System.out.println("lectureInsertPage-----------------------"+model);
		
		return "lecture/ad_lectureInsert";
	}
	
	@RequestMapping(value = "/lectureInsert", method = {RequestMethod.POST, RequestMethod.GET})
	public String lectureInsert(Locale locale, Model model, HttpSession session, @RequestParam Map map, @RequestParam(value = "lxfile") List<MultipartFile> files, String uploadpath) throws Exception {
		
		model.addAttribute("coxseq", map.get("coxseq"));
		String fileName = "";
		for (int i = 0; i < files.size(); i++) {
			MultipartFile file = (MultipartFile) files.get(i);
			//System.out.println(file.isEmpty() + "==============="+i);
			if (!file.isEmpty()){
				File newFile = new File(fileUploadPath/* + sub*/ + file.getOriginalFilename());
				file.transferTo(newFile);
				fileName += file.getOriginalFilename() + "|";
				model.addAttribute("originalFileName", fileName);
			}
			map.put("USEQ", session.getAttribute("USEQ"));
			map.put("fileName", file.getOriginalFilename());
			
			adminService.insertLecture(map);
		}
		
		List<HashMap> lectureList;
		lectureList = adminService.getLectureList(map);
		
		model.addAttribute("list", lectureList);
		
		return "lecture/ad_lectureList";
	}
	
	@RequestMapping(value = "/lectureModPage", method = {RequestMethod.POST, RequestMethod.GET})
	public String lectureModPage(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		model.addAttribute("coxseq", map.get("coxseq"));
		model.addAttribute("lxseq", map.get("lxseq"));
		map.put("USEQ", session.getAttribute("USEQ"));
		
		List<HashMap> list;
		list = adminService.modLecture(map);
		
		model.addAttribute("lxnum", list.get(0).get("lxnum"));
		model.addAttribute("lxname", list.get(0).get("lxname"));
		model.addAttribute("lxlink", list.get(0).get("lxlink"));
		model.addAttribute("lxfile", list.get(0).get("lxfile"));
		model.addAttribute("coxname", list.get(0).get("coxname"));
		model.addAttribute("lxtype", list.get(0).get("lxtype"));
		
		List<HashMap> cateList = adminService.selectCode(map);
		model.addAttribute("cateList", cateList);
		
		return "lecture/ad_lectureInsert";
	}
	
	@RequestMapping(value = "/lectureMod", method = {RequestMethod.POST, RequestMethod.GET})
	public String lectureMod(Locale locale, Model model, HttpSession session, @RequestParam Map map, @RequestParam(value = "lxfile") List<MultipartFile> files, String uploadpath) throws Exception {
		
		model.addAttribute("coxseq", map.get("coxseq"));
		String fileName = "";
		for (int i = 0; i < files.size(); i++) {
			MultipartFile file = (MultipartFile) files.get(i);
			//System.out.println(file.isEmpty() + "==============="+i);
			if (!file.isEmpty()){
				File newFile = new File(fileUploadPath/* + sub*/ + file.getOriginalFilename());
				file.transferTo(newFile);
				fileName += file.getOriginalFilename() + "|";
				model.addAttribute("originalFileName", fileName);
			}
			map.put("USEQ", session.getAttribute("USEQ"));
			map.put("lxfile", file.getOriginalFilename());
			
			
			if(!map.get("lxname").equals(null)||!map.get("lxlink").equals(null)||!map.get("lxfile").equals(null)){
				System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa---"+map);
				adminService.lectureMod(map);
			}
			
		}
		
		List<HashMap> lectureList;
		lectureList = adminService.getLectureList(map);
		
		model.addAttribute("list", lectureList);
		
		return "lecture/ad_lectureList";
	}
	
	@RequestMapping(value = "/QuizUpdate", method = {RequestMethod.POST, RequestMethod.GET})
	public String QuizUpdate(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		
		return "lecture/ad_lectureQuizUpdate";
	}
	
	@RequestMapping(value = "/applyList", method = {RequestMethod.POST, RequestMethod.GET})
	public String applyList(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		List<HashMap> applyList;
		applyList = adminService.getApplyList(map);
		
		model.addAttribute("list", applyList);
		model.addAttribute("coxname", applyList.get(0).get("coxname"));
		model.addAttribute("coxseq", map.get("coxseq"));
		
		return "course/ad_courseApplyMemberList";
	}
	
	@RequestMapping(value = "/applyStatusMod", method = {RequestMethod.POST, RequestMethod.GET})
	public String applyStatusMod(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		adminService.statusUpdate(map);
		
		List<HashMap> applyList;
		applyList = adminService.getApplyList(map);
		
		model.addAttribute("list", applyList);
		model.addAttribute("coxname", applyList.get(0).get("coxname"));
		model.addAttribute("coxseq", map.get("coxseq"));
		
		return "course/ad_courseApplyMemberList";
	}
	
	@RequestMapping(value = "/historyPopup", method = {RequestMethod.POST, RequestMethod.GET})
	public String historyPopup(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		
		
		return "lecture/ad_historyPopup";
	}
	
}

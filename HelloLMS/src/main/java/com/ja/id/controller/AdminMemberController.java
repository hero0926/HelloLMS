package com.ja.id.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.multipart.MultipartFile;

import com.ja.id.service.AdminMemberService;

@RequestMapping(value = "/admin")
@Controller
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService acs;
	
	@Value("${file.upload.tutor}")
	private String fileUploadPath;
	
	@RequestMapping(value="/member")
	public String home(Locale locale, Model model, HttpSession session, @RequestParam Map map){
		
		List<HashMap> list = acs.selectMember(map);
		model.addAttribute("list", list);
		session.setAttribute("adMenu", "2");
		return "member/ad_memlist";
		
	}

	@RequestMapping(value="/deleteMember")
	public String deleteMember(Locale locale, Model model, @RequestParam Map map) {
		
		int count = 0;
		try {
			count = acs.deleteMember(map);
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
		model.addAttribute("forward_url", "/admin/member");
		
		return "common/common_alert";
	}	
	
	
	//회원 구분 바꾸기
	@RequestMapping(value = "/updateMemberT")
	public String updateMemberT(Model model, @RequestParam Map map){
		
		model.addAttribute("forward_url", "/admin/member");
		List m = acs.updateM(map);
		model.addAttribute("m", (Map)m.get(0));
		System.out.println(m);
		
		return "member/ad_updateMemberT2";
		
	}
	
	@RequestMapping(value = "/deleteT")
	public String deleteT(Model model, HttpSession session, @RequestParam Map map){
		
		System.out.println("deleteT----------------"+map);
		
		try {
			acs.deleteT(map);
			acs.updateMemberS(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<HashMap> list = acs.selectMember(map);
		model.addAttribute("list", list);
		session.setAttribute("adMenu", "2");
		return "member/ad_memlist";
		
	}
	
/*	//강사 업데이트
	@RequestMapping(value="/memberup")
	@ResponseBody
	public String homeup(Locale locale, Model model, @RequestParam Map map){
		
		int result = acs.updateMemberT(map);
		
		//System.out.println(map);
		//System.out.println("=================================================");
		
		return String.valueOf(result);
		
	}*/
	
	@RequestMapping(value = "/memberup", method = {RequestMethod.POST, RequestMethod.GET})
	public String fileUpload(Locale locale, Model model, HttpSession session, @RequestParam Map map, @RequestParam(value = "tuxpicture") List<MultipartFile> files, String uploadpath) throws Exception {
		acs.updateMemberT(map);
		
		System.out.println("memberup-----------------------------"+map);
		
		String fileName = "";
		for (int i = 0; i < files.size(); i++) {
			MultipartFile file = (MultipartFile) files.get(i);
			if (!file.isEmpty()){
				File newFile = new File(fileUploadPath+file.getOriginalFilename());
				file.transferTo(newFile);
				fileName += file.getOriginalFilename() + "|";
				model.addAttribute("originalFileName", fileName);
			}
			map.put("tuxpicture", file.getOriginalFilename());
		}
		
		acs.insertMemberT(map);
		
		List<HashMap> list = acs.selectMember(map);
		model.addAttribute("list", list);
		session.setAttribute("adMenu", "2");
		return "member/ad_memlist";
	}
	
	@RequestMapping(value = "/loginHistory", method = {RequestMethod.POST, RequestMethod.GET})
	public String loginHistory(Model model, HttpSession session, @RequestParam Map map) throws Exception{
		List<HashMap> list = acs.loginHistory(map);
		model.addAttribute("list", list);
		
		session.setAttribute("adMenu", "2");
		return "member/ad_loginHistoryPopup";
	}

}

package com.ja.id.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ja.id.service.AdminMemberService;
import com.ja.id.service.UploadService;
import com.ja.id.service.UploadServiceImpl;

@RequestMapping(value = "/admin")
@Controller
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService acs;
	
	
	@RequestMapping(value="/member")
	public String home(Locale locale, Model model, HttpSession session, @RequestParam Map map){
		
		List<HashMap> list = acs.selectMember(map);
		model.addAttribute("list", list);
		
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
		List<HashMap> m = acs.updateM(map);
		model.addAttribute("m", m);
		System.out.println(m);
		
		return "member/ad_updateMemberT";
		
	}
	
	
	@RequestMapping(value="/memberup")
	public String homeup(Locale locale, Model model, @RequestParam Map map){
		

				
		acs.updateMemberT(map);
		System.out.println(map);
		
		
		
		System.out.println("=================================================");
		
		return "redirect:/admin/member";
		
	}
	
	

}

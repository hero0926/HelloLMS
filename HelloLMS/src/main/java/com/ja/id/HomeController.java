package com.ja.id;


import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ja.id.service.AdminService;

/**
 * Handles requests for the application home page.
 * js
* 김설화업로드
 * kj
 * 김설화업로드2 3 3 3 웅 앵 dh js
 * 
 * JS + JS333333
 * JS * JS
 */
 


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private AdminService adminService;

	/**
	 * Simply selects the home view to render by returning its name.
	 * 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, HttpSession session, HttpServletRequest request, @RequestParam Map map) {
		logger.info("Welcome home! The client locale is {}.", locale);
		session.setAttribute("Menu", "1");
		
		
		String uri = (String)request.getServerName();
		if(uri.equals("localhost")){
			session.setAttribute("UOFFICE", 8);
			
		} else {
			map.put("cxname", uri.substring(0, uri.indexOf(".")));
			map.put("cxgubun", "002");
			map.put("level", "sub");
			List<HashMap> list = adminService.selectCode(map);
			//
			if (list!=null){
				session.setAttribute("UOFFICE", list.get(0).get("cxseq"));
			} else {
				session.setAttribute("UOFFICE", 8);
			}
		}
		//System.out.println("session UOFFICE : "+session.getAttribute("UOFFICE"));
		return "home";
	}
	
}

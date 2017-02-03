package com.ja.id;


import java.io.FileInputStream;
import java.io.InputStream;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ja.id.service.AdminService;
import com.ja.id.service.UploadService;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Value("${file.upload.path}")
	private String fileUploadPath;
	
	@Autowired
	private AdminService adminService;
	private UploadService us;

	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws UnknownHostException 
	 * 
	 *//*
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
		public String home(Locale locale, HttpSession session, HttpServletRequest request, Model model, @RequestParam Map map) throws UnknownHostException {
			
			System.out.println("------------map------------"+map);
			List<HashMap> b = us.selectad(map);
			model.addAttribute("b", b);				
			
			logger.info("Welcome home! The client locale is {}.", locale);
			session.setAttribute("Menu", "1");
			
			String uri = request.getServerName();
			
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
			
			return "home";
		}	
		*/

		

	
}

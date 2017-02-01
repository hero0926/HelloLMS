package com.ja.id.util;

import java.io.File;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * Handles requests for the application upload page.

 */
 


@Controller
public class UploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	@Value("${file.upload.path}")
	private String fileUploadPath;
	
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String upload(Locale locale, Model model, @RequestParam(value = "file") List<MultipartFile> files, String uploadpath)
			throws Exception {
		

		String sub = uploadpath; //sub에 etc,board,main 등을 넣어서 업로드 폴더를 구분한다.
		if (sub==null) {
			sub = "";
		} else {
			sub += "\\";
		}
		//String uploadPath ="C:\\workspace_spring\\TeamLMS\\src\\main\\webapp\\resources\\upload\\";
		String fileName = "";
		for (int i = 0; i < files.size(); i++) {
			MultipartFile file = (MultipartFile) files.get(i);
			if (!file.isEmpty()){
				File newFile = new File(fileUploadPath+ file.getOriginalFilename());
				file.transferTo(newFile);
				fileName += file.getOriginalFilename() + "|";
				model.addAttribute("originalFileName", fileName);
			}
		}

		return "upload";

	}

	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
	public String uploadForm(Locale locale) {
		logger.info("Welcome uploadForm! The upload locale is {}.", locale);
		
		//System.out.println("session UOFFICE : "+session.getAttribute("UOFFICE"));
		return "upload";
	}
	
}

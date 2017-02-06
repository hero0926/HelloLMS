package com.ja.id.util;


import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
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
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ja.id.service.AdminService;
import com.ja.id.service.UploadService;

/**
 * Handles requests for the application upload page.

 */


@Controller
public class UploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	@Value("${file.upload.path}")
	private String fileUploadPath;
	
	@Autowired
	private UploadService us;
	
	
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
	
	
	//김설화
	
	@RequestMapping(value = "/admin/adupload", method = RequestMethod.POST)
	public String adupload(Locale locale, Model model,  @RequestParam Map map, @RequestParam(value = "file") List<MultipartFile> files, String uploadpath, HttpServletRequest req)
			throws Exception {	

		String sub = uploadpath; //sub에 etc,board,main 등을 넣어서 업로드 폴더를 구분한다.
		if (sub=="main") {
			sub = "";
		} else {
			sub += "\\";
		}
		//String uploadPath ="C:\\workspace_spring\\TeamLMS\\src\\main\\webapp\\resources\\upload\\";
				
		String modelfile = "";
		
		for (int i = 0; i < files.size(); i++) {
			MultipartFile file = (MultipartFile) files.get(i);
			if (!file.isEmpty()){
				String fileName = file.getOriginalFilename();/*
				int pos = fileName.lastIndexOf( "." );
				String ext = fileName.substring(pos);
				
					fileName = String.valueOf(i+1)+ext;*/
					File newFile = new File(fileUploadPath+fileName);
					modelfile += fileName + ":";

				file.transferTo(newFile);
				
			}			
			req.setAttribute("msg", "업로드되었습니다!");			
		}
		
		String[] banner = modelfile.split(":");		
		String b1 = banner[0];
		String b2 = banner[1];
		String b3 = banner[2];
		
		map.put("adxname1", b1);
		map.put("adxname2", b2);
		map.put("adxname3", b3);
		
		us.updatead(map);
		
		
		return "adupload";

	}
	
	@RequestMapping(value = "/admin/aduploadForm", method = RequestMethod.GET)
	public String aduploadForm(Locale locale, @RequestParam Map map) {			
		
		return "adupload";
	}
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, HttpSession session, HttpServletRequest request, Model model, @RequestParam Map map) throws UnknownHostException {
		
		//배너 불러오기
		List<HashMap> b = us.selectad(map);
		model.addAttribute("b", b);
		
		//최신강의 불러오기
		List<HashMap> c = us.selectcourse(map);
		model.addAttribute("c", c);
		
		return "home";
	}	
	

	
	//사진을 보여주는 메서드
	
	@ResponseBody
	@RequestMapping(value = "/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName, HttpServletRequest req) throws Exception{
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		
		try {
			
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			
			String file = fileUploadPath+fileName;
			
			in = new FileInputStream(file);
			
			
			if(mType!=null){
				
				headers.setContentType(mType);
				
			}
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			
		}finally{
			in.close();
		}
		
		return entity;		
		
	}
	
	
	
}

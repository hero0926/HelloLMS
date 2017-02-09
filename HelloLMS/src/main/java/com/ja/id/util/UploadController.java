package com.ja.id.util;


import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.UnknownHostException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	
	//슬라이드배너 업로드하는 메서드
	@RequestMapping(value = "/admin/adupload", method = RequestMethod.POST)
	public String adupload(Locale locale, Model model,  @RequestParam Map map, @RequestParam(value = "file") List<MultipartFile> files, HttpServletRequest req)
			throws Exception {	
		
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
	
	//사진을 보여주는 메서드
	
	@ResponseBody
	@RequestMapping(value = "/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName, HttpServletRequest req) throws Exception{
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String file;
		
		try {
			
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			
			file = fileUploadPath+fileName;
			
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
	
	//팝업 업로드용 메서드
	
	@RequestMapping(value="/admin/popuploadForm", method = RequestMethod.GET)
	public String popuploadForm(Locale locale, @RequestParam Map map) {		
		return "popupload";
	}
	
	@RequestMapping(value="/admin/popupload", method = RequestMethod.POST)
	public String popupload(Locale locale, @RequestParam Map map, HttpServletRequest request) throws Exception {	
		//날짜 계산 후 차이 구하기
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");	
		
		Date d1 = df.parse((String) map.get("pxfrom"));
		Date d2 = df.parse((String) map.get("pxto"));	
		
		long diff = d2.getTime() - d1.getTime();
		long diffDays = diff / (24 * 60 * 60 * 1000);		
		
		map.put("pxday", diffDays);
		
		//날짜 변환하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");		
		Date d3 = df.parse((String) map.get("pxfrom"));
		Date d4 = df.parse((String) map.get("pxto"));
		
		String pxfrom = sdf.format(d3);
		String pxto = sdf.format(d4);
		
		map.put("pxfrom", pxfrom);
		map.put("pxto", pxto);
		
		//파일 올리기		
		
		String modelfile = "";
		
		MultipartHttpServletRequest m = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = m.getFileNames();
		MultipartFile mf = null;
		
		while(iterator.hasNext()){
			
			mf = m.getFile(iterator.next());
			if(mf.isEmpty()==false){
				modelfile = mf.getOriginalFilename();
				File newFile = new File(fileUploadPath+modelfile);
				mf.transferTo(newFile);	
			}				
		}				
		
		map.put("pxfile", modelfile);		
		
		us.updatepopup(map);

		return "popupload";
	}
	
	
	
}

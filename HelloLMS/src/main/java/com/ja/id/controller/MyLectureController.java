package com.ja.id.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import javax.activation.CommandMap;
import javax.mail.search.IntegerComparisonTerm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.ja.id.service.MyLectureService;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value = "/mypage/mylecture")
@Controller
public class MyLectureController implements ApplicationContextAware{
	
	private static final Logger logger = LoggerFactory.getLogger(MyLectureController.class);
	
	private WebApplicationContext context = null;
	
	@Value("${file.download.lecture}")
	private String fileDownloadPath;
	
	@Autowired
	private MyLectureService mylectureService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/myApplyCourse", method = {RequestMethod.POST, RequestMethod.GET})
	public String myApplyCourse(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		if(null!=session.getAttribute("UID")){
		session.setAttribute("Menu", "1");
		
		map.put("USEQ", session.getAttribute("USEQ"));
		
		List<HashMap> applycourselist;
		applycourselist = mylectureService.getAllApplyCourse(map);
		model.addAttribute("list", applycourselist);
		model.addAttribute("mxseq", session.getAttribute("USEQ"));
		
		return "mylecture/myApplyCourse";
		} else {
			return "member/loginPost";
		}
	}
	
	@RequestMapping(value = "/myApplyCourseDelete", method = {RequestMethod.POST, RequestMethod.GET})
	public String myApplyCourseDelete(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		if(null!=session.getAttribute("UID")){
/*		mylectureService.applyCourseDelete(map);
		
		map.put("USEQ", session.getAttribute("USEQ"));
		
		List<HashMap> applycourselist;
		applycourselist = mylectureService.getAllApplyCourse(map);
		model.addAttribute("list", applycourselist);
		model.addAttribute("mxseq", session.getAttribute("USEQ"));
		
		return "mylecture/myApplyCourse";*/
		
		int count = 0;

		try {
			count = mylectureService.applyCourseDelete(map);
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
		model.addAttribute("forward_url", "/mypage/mylecture/myApplyCourse");
		
		return "common/common_alert";
		} else {
			return "member/loginPost";
		}
	}
	
	@RequestMapping(value = "/myCourse", method = {RequestMethod.POST, RequestMethod.GET})
	public String myCourse(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		if(null!=session.getAttribute("UID")){
		map.put("USEQ", session.getAttribute("USEQ"));
		
		List<HashMap> courselist;
		courselist = mylectureService.getAllCourse(map);
		model.addAttribute("list", courselist);
		session.setAttribute("Menu", "1");
		
		return "mylecture/myCourse";
		} else {
			return "member/loginPost";
		}
	}
	
	@RequestMapping(value = "/testpopup", method = {RequestMethod.POST, RequestMethod.GET})
	public String testpopup(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		if(null!=session.getAttribute("UID")){
			map.put("USEQ", session.getAttribute("USEQ"));
			List<HashMap> testpaperList = mylectureService.selectTestpaper(map);
			model.addAttribute("testpaperList", testpaperList);
			if(testpaperList!=null&&testpaperList.size()>0){
				model.addAttribute("coxname", testpaperList.get(0).get("coxname"));
			}
			return "mylecture/testpopup";
		} else {
			return "member/loginPost";
		}
	}
	
	@RequestMapping(value = "/testpool", method = {RequestMethod.POST, RequestMethod.GET})
	public String testpool(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		
		map.put("USEQ", session.getAttribute("USEQ"));
		
		//testresult 를 select해서 있으면 건너뛰고, 시간이 남아 있는지 확인하고, 지금 시험칠수 있는지도 확인 하고
		if(mylectureService.selectTestresult(map).size()==0){
			mylectureService.insertTestresult(map);
		}
		
		
		//없으면 testresult 에 한건 insert
		List<HashMap> testpoolList;
		testpoolList = mylectureService.testpoolList(map);
		
		model.addAttribute("testpoolList", testpoolList);
		model.addAttribute("tpxseq", map.get("tpxseq"));
		model.addAttribute("taxSize", testpoolList.size());
		model.addAttribute("tpxduring", testpoolList.get(0).get("tpxduring"));
		model.addAttribute("trxrest", testpoolList.get(0).get("trxrest"));
		
		if(testpoolList!=null&&testpoolList.size()>0){
			String sTaxorder = (String)map.get("taxorder");
			if (sTaxorder==null) {sTaxorder = "1";}
			int taxorder = Integer.parseInt(sTaxorder);
			model.addAttribute("testpool", testpoolList.get(taxorder-1));
		}
		
		return "mylecture/testpopup2";
	}
	
	@RequestMapping(value = "/updateRest", method = {RequestMethod.POST, RequestMethod.GET})
	public String updateRest(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		
		System.out.println("updateRest---------------------------"+map);
		map.put("USEQ", session.getAttribute("USEQ"));
		mylectureService.updateRest(map);
		
		List<HashMap> testresult = mylectureService.selectTestresult(map);
		String trxrest = testresult.get(0).get("trxrest").toString();
		System.out.println("trxrest----------------"+trxrest);
		
		return trxrest;
	}
	
	@RequestMapping(value = "/changeOrder", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String ajaxTest(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		String jsonString = null;
		try {
			map.put("USEQ", session.getAttribute("USEQ"));
			List<HashMap> testpoolList;
			testpoolList = mylectureService.testpoolList(map);
			Map testpool = testpoolList.get(0);
			
			Gson gson = new Gson();
			jsonString = gson.toJson(testpool);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			jsonString="error";
		}
		
		return jsonString;
	}
	
	@RequestMapping(value = "/updateAnswer", method = {RequestMethod.POST, RequestMethod.GET})
	public String test(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		System.out.println("updateAnswer---------------------------------"+map);
		map.put("USEQ", session.getAttribute("USEQ"));
		String returnUrl="";
		String addParam="";
		
		mylectureService.updateAnswer(map);
		if(map.get("mode")!=null){
			String mode = (String)map.get("mode");
			
			if (mode.equals("submit")){
				mylectureService.submitTest(map);
				model.addAttribute("success_flag", "Y");
				
				return "mylecture/testpopup3";
			} else if (mode.equals("older")){
				addParam ="taxorder="+String.valueOf(Integer.parseInt((String)map.get("taxorder"))-1); 
			} else if (mode.equals("next")){
				addParam ="taxorder="+String.valueOf(Integer.parseInt((String)map.get("taxorder"))+1);
			} else if (mode.equals("pass")){
				addParam ="taxorder="+(String)map.get("passorder");
			}
			
		}
		return "redirect:/mypage/mylecture/testpool?tpxseq="+map.get("tpxseq")+"&"+addParam;
	}
	
	@RequestMapping(value = "/historypopup", method = {RequestMethod.POST, RequestMethod.GET})
	public String historypopup(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		if(null!=session.getAttribute("UID")){
			map.put("USEQ", session.getAttribute("USEQ"));
			
			List<HashMap> historyList;
			historyList = mylectureService.getHistory(map);
			
			model.addAttribute("historyList", historyList);
			
			return "mylecture/historypopup";
		} else {
			return "member/loginPost";
		}
	}
	
	@RequestMapping(value = "/quizpopup", method = {RequestMethod.POST, RequestMethod.GET})
	public String quizpopup(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		if(null!=session.getAttribute("UID")){
			map.put("USEQ", session.getAttribute("USEQ"));
			
			return "mylecture/quizpopup";
		} else {
			return "member/loginPost";
		}
	}
	
	@RequestMapping(value = "/myLecture", method = {RequestMethod.POST, RequestMethod.GET})
	public String myLecture(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		if(null!=session.getAttribute("UID")){
			map.put("USEQ", session.getAttribute("USEQ"));
			
			List<HashMap> lecturelist;
			lecturelist = mylectureService.getLecture(map);
			model.addAttribute("list", lecturelist);
			
			return "mylecture/myLecture";
		} else {
			return "member/loginPost";
		}
	}
	
	@RequestMapping(value = "/lecture", method = {RequestMethod.POST, RequestMethod.GET})
	public String lecture(Locale locale, Model model, HttpSession session, @RequestParam Map map) throws Exception {
		if(null!=session.getAttribute("UID")){
		map.put("USEQ", session.getAttribute("USEQ"));
		List<HashMap> lecturelist;
		lecturelist = mylectureService.getLecture(map);
		model.addAttribute("list", lecturelist);
		//model.addAttribute("lxtype", map.get("lxtype"));
		model.addAttribute("lecture", map);
		
		return "mylecture/lecture";
		} else {
			return "member/loginPost";
		}
	}
	
	@RequestMapping(value = "/lexstudy", method = {RequestMethod.POST, RequestMethod.GET}, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String lexstudy(Locale locale, Model model, HttpSession session, @RequestParam Map map, HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(null!=session.getAttribute("UID")){
		map.put("USEQ", session.getAttribute("USEQ"));
		List<HashMap> lecturelist;
		lecturelist = mylectureService.islexstudy(map);
		if(lecturelist.size()==0){
			mylectureService.lexstudyinsert(map);
		}else{
			mylectureService.lexstudyupdate(map);
		}
		mylectureService.lexstudyloginsert(map);
		return "";
		} else {
			return "member/loginPost";
		}
	}
    
    @RequestMapping("/download")
    public ModelAndView download(@RequestParam("fileName")String fileName){
         
        String fullPath = fileDownloadPath + fileName;
        System.out.println("fileDownloadPath------------"+fileDownloadPath);
        System.out.println("fullPath------------"+fullPath);
         
        File file = new File(fullPath);
         
        return new ModelAndView("download", "downloadFile", file);
    }
 
    @Override
    public void setApplicationContext(ApplicationContext arg0)
            throws BeansException {
        // TODO Auto-generated method stub
         
        this.context = (WebApplicationContext)arg0;
         
    }
	
}

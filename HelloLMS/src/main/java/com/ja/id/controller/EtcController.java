package com.ja.id.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartFile;

import com.ja.id.domain.PageVO;
import com.ja.id.service.AdminService;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value = "/etc")
@Controller
public class EtcController {
	
	private static final Logger logger = LoggerFactory.getLogger(EtcController.class);
	
	@Autowired
	private PageVO pageVo;
	
	@Autowired
	private AdminService adminService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = {RequestMethod.POST, RequestMethod.GET})
	public String home(Locale locale, Model model, HttpSession session, @RequestParam Map map) {
		logger.info("controller selectGraph.", locale);
		map.put("mxseq", session.getAttribute("USEQ"));
		List<HashMap> graphList = adminService.selectGraph(map);
		model.addAttribute("graphList", graphList);
		if(graphList!=null&&graphList.size()>0){
			model.addAttribute("graphTitle", graphList.get(0));
		}
		List<HashMap> gradeList = adminService.selectGrade(map);
		model.addAttribute("gradeList", gradeList);
		List<HashMap> progressList = adminService.selectProgress(map);
		model.addAttribute("progressList", progressList);
		
		return "mylecture/myPage";
	}
	
	@RequestMapping(value = "/faqList", method = {RequestMethod.POST, RequestMethod.GET})
	public String selectFAQ(Locale locale, Model model, HttpSession session, @RequestParam Map map) {
		logger.info("controller faqList.", locale);
		map.put("bfxoffice", session.getAttribute("UOFFICE"));
		int totalCount = adminService.getTotalFaq(map);
		
		pageVo.setTotalCount(totalCount);

		if(totalCount>0){
			int curPage = 1;
			int perPage = pageVo.getPerPage();
			if(null!=map.get("curPage")){
				curPage = Integer.parseInt((String)map.get("curPage"));
			}
			pageVo.setCurPage(curPage);
			int flimit = (curPage-1)*perPage;
			map.put("flimit", (curPage-1)*perPage);
			map.put("tlimi", perPage);
			System.out.println("tlimi======="+perPage);
			
			pageVo.setFlimit(flimit);
			pageVo.setNavi(totalCount);
			model.addAttribute("pageVo", pageVo);
			
			List<HashMap> faqList = adminService.selectBoardFaq(map);
			model.addAttribute("faqList", faqList);
		}
		session.setAttribute("Menu", "3");
		return "etc/board_faq";
	}
	
}

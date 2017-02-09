package com.ja.id.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.ja.id.service.BoardService;

@RequestMapping(value = "/board")
@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/notice", method = RequestMethod.GET)
	public String notice(Locale locale, Model model, @RequestParam Map map) {
		model.addAttribute("notice", boardService.getAllNotice(map));
		
		return "/board/notice";
	}
	
	@RequestMapping(value="/notice/write", method = RequestMethod.GET)
	public String write(Locale locale, Model model) {
		return "/board/write";
	}
	
	@RequestMapping(value="/notice/writeNotice", method = {RequestMethod.GET, RequestMethod.POST})
	public String writeNotice(Locale locale, HttpServletRequest req, HttpSession session, Model model, @RequestParam Map map) {
		try {
			int result = boardService.writeNotice(map, req);
			model.addAttribute("notice", boardService.readNotice(map));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/board/read";
	}
	
	@RequestMapping(value = "/notice/readNotice", method = {RequestMethod.GET,
			RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String readNotice(HttpServletRequest req, Model model, @RequestParam Map map) {
		try {
			int result = boardService.updateCnt(map);
			model.addAttribute("notice", boardService.readNotice(map));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/board/read";

	}
	
	@RequestMapping(value = "/notice/editUi", method = {RequestMethod.GET, RequestMethod.POST}, produces = "text/plain;charset=UTF-8")
	public String editUi(HttpServletRequest req, Model model, @RequestParam Map map) {
		model.addAttribute("notice", boardService.readNotice(map));
		return "/board/editUi";
	}
	
	@RequestMapping(value = "/notice/editNotice", method = {RequestMethod.GET, RequestMethod.POST}, produces = "text/plain;charset=UTF-8")
	public String editNotice(HttpServletRequest req, Model model, @RequestParam Map map) {
		try {
			int result = boardService.editNotice(map);
			model.addAttribute("notice", boardService.readNotice(map));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/board/read";
	}
	
	@RequestMapping(value="/notice/deleteNotice", method = { RequestMethod.GET, RequestMethod.POST})
	public String delete(Locale locale, Model model, @RequestParam Map map) {
		int result = 0;

		try {
			result = boardService.deleteNotice(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("success_flag", "N");
		}
		if (0 < result) {
			model.addAttribute("success_flag", "Y");
		} else {
			model.addAttribute("success_flag", "N");
		}
		model.addAttribute("notice", boardService.readNotice(map));
		model.addAttribute("forward_url", "/board/notice?bxngrid="+map.get("bxngrid"));	
		
		return "common/common_alert";

	}
	
	
	@RequestMapping(value="/notice/searchNotice", method = RequestMethod.GET)
	public String search(Locale locale, Model model, @RequestParam Map map) {
		model.addAttribute("search", boardService.searchNotice(map));
		
		return "/board/notice";
	}
	
	@RequestMapping(value="/faq", method = RequestMethod.GET)
	public String faq(Locale locale, Model model, @RequestParam Map map) {
		model.addAttribute("faq", boardService.getAllNotice(map));
		
		return "/faq";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/qna", method = RequestMethod.GET)
	public String qna(Locale locale, Model model, @RequestParam Map map) {
		model.addAttribute("rep", boardService.repCheck(map));
		return "/board/qna";
	}
	
	@RequestMapping(value="/qna/write", method = RequestMethod.GET)
	public String write2(Locale locale, Model model) {
		return "/board/writeQna";
	}
	
	@RequestMapping(value="/qna/writeQna", method = {RequestMethod.GET, RequestMethod.POST})
	public String writeQna(Locale locale, HttpSession session, Model model, @RequestParam Map map) {
		try {
			int result = boardService.writeQna(map);
			model.addAttribute("qna", boardService.readQna(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/board/readQna";
	}
	
	@RequestMapping(value = "/qna/readQna", method = {RequestMethod.GET,
			RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String readQna(HttpServletRequest req, Model model, @RequestParam Map map) {
		try {
			model.addAttribute("qna", boardService.readQna(map));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/board/readQna";

	}
	
	@RequestMapping(value="/qna/writeQnarep", method = {RequestMethod.GET, RequestMethod.POST})
	public String writeQnarep(Locale locale, HttpSession session, Model model, @RequestParam Map map) {
		try {
			int result = boardService.writeQnarep(map);
			model.addAttribute("qna", boardService.readQna(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/board/readQna";
	}
	
	@RequestMapping(value = "/tutor", method = {RequestMethod.GET,
			RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String tutor(Locale locale, HttpServletRequest req, Model model, @RequestParam Map map) {
		try {
			model.addAttribute("tutor", boardService.tutor(map));
			model.addAttribute("comment", boardService.readComment(map));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/board/tutor";

	}
	
	@RequestMapping(value="/writeComment", method = {RequestMethod.GET, RequestMethod.POST}, produces = "text/plain;charset=UTF-8")
	public String writeComment(Locale locale, HttpSession session, Model model, @RequestParam Map map) {

		
		int result = 0;

		try {
			result = boardService.writeComment(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("success_flag", "N");
		}
		if (0 < result) {
			model.addAttribute("success_flag", "Y");
		} else {
			model.addAttribute("success_flag", "N");
		}
		model.addAttribute("forward_url", "/board/tutor?mxseq="+map.get("mxseq"));
		
		return "common/common_alert";
		/*
		try {
			System.out.println("----------------!!!!!!!!!!!!!--------------");
			if (map.get("tucxcomment") != null && !"".equals((String) map.get("tucxcomment"))) {
			System.out.println("----------------!!!!!!!!!!!!!--------------");
				int 
			}
			
			model.addAttribute("comment", boardService.readComment(map));
			model.addAttribute("tutor", boardService.tutor(map));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/board/tutor";*/
	}

	/*@RequestMapping(value = "/readComment", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String readRep(Locale locale, Model model, @RequestParam Map map) {
		model.addAttribute("comment", boardService.readComment(map));
		return "/board/read2";
	}*/
	
	@RequestMapping(value = "/like", method = RequestMethod.GET)
	public String like(Locale locale, Model model, @RequestParam Map map) {
		
		int result = boardService.selectJoayo(map);
		model.addAttribute("joayoCnt", result);

		return "board/tutor";
	}

	@RequestMapping(value = "/joayo", method = RequestMethod.POST)
	@ResponseBody
	public String joayo(Locale locale, Model model, @RequestParam Map map) {
		
		String jsonString = null;
		try {
			int result = boardService.updateJoayo(map);
			Gson gson = new Gson();
			JsonObject obj = new JsonObject();
			obj.addProperty("cnt", result);

			jsonString = gson.toJson(obj);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return jsonString;
	}

}

package com.ja.id.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String writeNotice(Locale locale, HttpSession session, Model model, @RequestParam Map map) {
		try {
			int result = boardService.writeNotice(map);
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
	
	@RequestMapping(value="/notice/deleteNotice", method = RequestMethod.GET)
	public String delete(Locale locale, Model model, @RequestParam Map map) {
		try {
			int result = boardService.deleteNotice(map);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("notice", boardService.getAllNotice(map));
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
		return "/board/qnawrite";
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

}

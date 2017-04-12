package com.ja.id.controller;

import java.io.File;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.ja.id.service.BoardService;
import com.mysql.jdbc.StringUtils;

@RequestMapping(value = "/board")
@Controller
public class BoardController implements ApplicationContextAware {

	private WebApplicationContext context = null;

	@Value("${file.download.board}")
	private String fileDownloadPath;

	@Value("${file.upload.board}")
	private String fileUploadPath;

	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(Locale locale, Model model, @RequestParam Map map, HttpSession session) {

		map.put("bxngrid", session.getAttribute("UOFFICE"));

		model.addAttribute("notice", boardService.getAllNotice(map));

		return "/board/notice";
	}

	@RequestMapping(value = "/pastNotice", method = RequestMethod.GET)
	public String pastNotice(Locale locale, Model model, @RequestParam Map map, HttpServletRequest req,
			HttpSession session) {

		map.put("bxngrid", session.getAttribute("UOFFICE"));

		// cPage = 지금 보는 페이지
		int cPage = 1;
		if (map.get("cPage") != null) {
			cPage = Integer.parseInt((String) map.get("cPage"));
		}

		// pDataCnt = 화면에서 보여주는 글의 갯수
		int pDataCnt = 10;

		map.put("start", ((cPage - 1) * pDataCnt + 10));
		map.put("pDataCnt", pDataCnt);
		model.addAttribute("notice", boardService.getAllNotice(map));
		model.addAttribute("cPage", cPage);

		int pPageCnt = 10;
		int total = boardService.getAllNoticeCnt(map);
		int tPage = (total - 10) / pDataCnt;
		int nPage = 0;
		if (cPage <= 10) {
			cPage = 0;
			nPage = cPage + 11;
		} else if (cPage % 10 == 0) {
			nPage = cPage + 1;
		} else {
			nPage = cPage / 10 * 10 + 11;
		}
		int prePage = 0;
		if (cPage <= 10) {
			prePage = 1;
		} else if (cPage % 10 == 0) {
			prePage = cPage - 9;
		} else {
			prePage = cPage / 10 * 10 - 9;
		}

		int rPage = (total - 10) % pDataCnt;
		if (rPage != 0) {
			tPage++;
		}

		int sPage = (((cPage - 1) / pPageCnt) * pPageCnt) + 1;

		// sPage = 시작페이지
		model.addAttribute("sPage", sPage);
		model.addAttribute("pPageCnt", pPageCnt);
		model.addAttribute("tPage", tPage);
		model.addAttribute("nPage", nPage);
		model.addAttribute("prePage", prePage);
		model.addAttribute("total", total);

		map.put("pPageCnt", pPageCnt);
		// model.addAttribute("notice", boardService.getAllNotice(map));

		return "/board/pastNotice";
	}

	@RequestMapping(value = "/notice/write", method = RequestMethod.GET)
	public String write(Locale locale, Model model) {
		return "/board/write";
	}

	@RequestMapping(value = "/notice/writeNotice", method = { RequestMethod.GET, RequestMethod.POST })
	public String writeNotice(Locale locale, HttpServletRequest req, HttpSession session, Model model,
			@RequestParam Map map, @RequestParam(value = "file") List<MultipartFile> files) {
		map.put("bxngrid", session.getAttribute("UOFFICE"));
		int result = 0;
		try {
			String newFileName = "";
			String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());
			for (int i = 0; i < files.size(); i++) {
				MultipartFile file = (MultipartFile) files.get(i);
				// System.out.println(file.isEmpty() + "==============="+i);
				if (!file.isEmpty()) {
					newFileName = now + file.getOriginalFilename();
					File newFile = new File(fileUploadPath/* + sub */ + newFileName);
					file.transferTo(newFile);
					model.addAttribute("originalFileName", file);
					map.put("bxnfile" + (i + 1), file.getOriginalFilename());
					map.put("bxnconvertfile" + (i + 1), newFileName);
				}
			}
			result = boardService.writeNotice(map, req);

			model.addAttribute("notice", boardService.readNotice(map));

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("success_flag", "N");
		}
		if (0 < result) {
			model.addAttribute("success_flag", "Y");
		} else {
			model.addAttribute("success_flag", "N");
		}
		model.addAttribute("forward_url", "/board/notice/readNotice?bxnseq=" + map.get("bxnseq"));

		return "common/common_alert";
	}

	@RequestMapping(value = "/notice/readNotice", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String readNotice(HttpServletRequest req, HttpServletResponse res, Model model, @RequestParam Map map) {
		try {
			String bxnseq = req.getParameter("bxnseq");
			// 저장된 쿠키 불러오기
			Cookie cookies[] = req.getCookies();
			if (req.getCookies() != null) {
				for (int i = 0; i < cookies.length; i++) {
					Cookie obj = cookies[i];
					map.put(obj.getName(), obj.getValue());
				}
			}

			// 저장된 쿠키중에 read_count 만 불러오기
			System.out.println(map);
			String readCount = (String) map.get("read_count");
			// 저장될 새로운 쿠키값 생성
			String newReadCount = "|" + bxnseq;

			// 저장된 쿠키에 새로운 쿠키값이 존재하는 지 검사
			if (StringUtils.indexOfIgnoreCase(readCount, newReadCount) == -1) {
				// 없을 경우 쿠키 생성
				Cookie cookie = new Cookie("read_count", readCount + newReadCount);

				res.addCookie(cookie);
				boardService.updateCnt(map); // 업데이트 실행
			}
			/* int result = boardService.updateCnt(map); */
			model.addAttribute("notice", boardService.readNotice(map));
			List<HashMap> noticeList = boardService.listinread(map);
			List nextList = noticeList.stream().filter(
					m -> Integer.parseInt(m.get("bxnseq").toString()) > Integer.parseInt(map.get("bxnseq").toString()))
					.collect(Collectors.toList());
			if (0 == nextList.size()) {
				noticeList.add(0, new HashMap());
			}
			

			model.addAttribute("lin", noticeList);
			map.put("currNo", map.get("bxnseq"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/board/read";

	}

	@RequestMapping("/download")
	public ModelAndView download(@RequestParam("fileName") String fileName, @RequestParam Map map) {

		String fullPath = fileDownloadPath + fileName;
		System.out.println("fileDownloadPath------------" + fileDownloadPath);
		System.out.println("fullPath------------" + fullPath);

		File file = new File(fullPath);
		ModelAndView mav = new ModelAndView("download2", "downloadFile", file);
		// download2 : view (root-context에서 지정), downloadFile = 바인드값, file : 파일)
		mav.addObject("originalFileName", (String) map.get("originalFileName"));
		// original
		return mav;
	}

	@Override
	public void setApplicationContext(ApplicationContext arg0) throws BeansException {
		// TODO Auto-generated method stub

		this.context = (WebApplicationContext) arg0;

	}

	@RequestMapping(value = "/notice/editUi", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String editUi(HttpServletRequest req, Model model, @RequestParam Map map) {
		model.addAttribute("notice", boardService.readNotice(map));
		return "/board/editUi";
		
	}

	@RequestMapping(value = "/notice/editNotice", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String editNotice(Locale locale, HttpServletRequest req, HttpSession session, Model model,
			@RequestParam Map map, @RequestParam(value = "file") List<MultipartFile> files) {
		int result = 0;
		String newFileName = "";
		try {
			String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());
			for (int i = 0; i < files.size(); i++) {
				MultipartFile file = (MultipartFile) files.get(i);
				// System.out.println(file.isEmpty() + "==============="+i);
				if (!file.isEmpty()) {
					newFileName = now + file.getOriginalFilename();
					File newFile = new File(fileUploadPath/* + sub */ + newFileName);
					file.transferTo(newFile);
					model.addAttribute("originalFileName", file);
					map.put("bxnfile" + (i + 1), file.getOriginalFilename());
					map.put("bxnconvertfile" + (i + 1), newFileName);
				}
			}
			result = boardService.editNotice(map);
			model.addAttribute("notice", boardService.readNotice(map));
		} catch (Exception e) {
			model.addAttribute("success_flag", "N");
		}
		if (0 < result) {
			model.addAttribute("success_flag", "Y");
		} else {
			model.addAttribute("success_flag", "N");
		}
		model.addAttribute("forward_url", "/board/notice/readNotice?bxnseq=" + map.get("bxnseq"));

		return "common/common_alert";
		
	}
	
	@RequestMapping(value = "/notice/delNoticeFile", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String delNoticeFile(Locale locale, Model model, @RequestParam Map map) {
		String path = fileUploadPath+map.get("bxnconvertfile").toString();
		String jsonString = null;
		try {
			
			int result = boardService.delNoticeFile(map);
			Gson gson = new Gson();
			JsonObject obj = new JsonObject();
			obj.addProperty("result", result);

			jsonString = gson.toJson(obj);
			
			
			if (map.get("no") != null) {
				File file = new File(path);
				System.out.println(file);
				if(file.exists() == true){
					file.delete();
				}
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return jsonString;
	}
	
	@RequestMapping(value = "/notice/deleteNotice", method = { RequestMethod.GET, RequestMethod.POST })
	public String delete(Locale locale, Model model, @RequestParam Map map, HttpSession session) {
		map.put("bxngrid", session.getAttribute("UOFFICE"));
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
		model.addAttribute("forward_url", "/board/notice?bxngrid=" + map.get("bxngrid"));

		return "common/common_alert";

	}

	@RequestMapping(value = "/notice/searchNotice", method = RequestMethod.GET)
	public String search(Locale locale, Model model, @RequestParam Map map, HttpSession session) {
		map.put("bxngrid", session.getAttribute("UOFFICE"));
		model.addAttribute("notice", boardService.searchNotice(map));
		/* model.addAttribute("notice", boardService.getAllNotice(map)); */

		return "/board/searchNotice";
	}

	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faq(Locale locale, Model model, @RequestParam Map map) {
		model.addAttribute("faq", boardService.getAllNotice(map));

		return "/board/faq";
	}

	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String qna(Locale locale, Model model, @RequestParam Map map, HttpSession session) {
		map.put("bxqgrid", session.getAttribute("UOFFICE"));
		map.put("mxseq", session.getAttribute("USEQ"));

		/*
		 * System.out.println("=============================");
		 * System.out.println(session.getAttribute("USEQ"));
		 * System.out.println("=============================");
		 */
		model.addAttribute("rep", boardService.repCheck(map));
		return "/board/qna";
	}

	@RequestMapping(value = "/ad_qna", method = RequestMethod.GET)
	public String ad_qna(Locale locale, Model model, @RequestParam Map map, HttpSession session) {
		map.put("bxqgrid", session.getAttribute("UOFFICE"));
		map.put("mxseq", session.getAttribute("USEQ"));

		// cPage = 지금 보는 페이지
		int cPage = 1;
		if (map.get("cPage") != null) {
			cPage = Integer.parseInt((String) map.get("cPage"));
		}

		// pDataCnt = 화면에서 보여주는 글의 갯수
		int pDataCnt = 10;

		map.put("start", ((cPage - 1) * pDataCnt));
		map.put("pDataCnt", pDataCnt);
		model.addAttribute("rep", boardService.ad_repCheck(map));
		model.addAttribute("cPage", cPage);

		int pPageCnt = 10;
		int total = boardService.repCheckCnt(map);
		int tPage = (total) / pDataCnt;
		int nPage = 0;
		if (cPage <= 10) {
			cPage = 0;
			nPage = cPage + 11;
		} else if (cPage % 10 == 0) {
			nPage = cPage + 1;
		} else {
			nPage = cPage / 10 * 10 + 11;
		}
		int prePage = 0;
		if (cPage <= 10) {
			prePage = 1;
		} else if (cPage % 10 == 0) {
			prePage = cPage - 9;
		} else {
			prePage = cPage / 10 * 10 - 9;
		}

		int rPage = (total) % pDataCnt;
		if (rPage != 0) {
			tPage++;
		}

		int sPage = (((cPage - 1) / pPageCnt) * pPageCnt) + 1;

		// sPage = 시작페이지
		model.addAttribute("sPage", sPage);
		model.addAttribute("pPageCnt", pPageCnt);
		model.addAttribute("tPage", tPage);
		model.addAttribute("nPage", nPage);
		model.addAttribute("prePage", prePage);
		model.addAttribute("total", total);

		map.put("pPageCnt", pPageCnt);
		// model.addAttribute("notice", boardService.getAllNotice(map));

		return "/board/ad_qna";
	}

	@RequestMapping(value = "/qna/searchQna", method = RequestMethod.GET)
	public String searchQna(Locale locale, Model model, @RequestParam Map map, HttpSession session) {
		map.put("bxqgrid", session.getAttribute("UOFFICE"));
		model.addAttribute("rep", boardService.searchQna(map));
		/* model.addAttribute("notice", boardService.getAllNotice(map)); */

		return "/board/searchQna";
	}

	@RequestMapping(value = "/qna/write", method = RequestMethod.GET)
	public String write2(Locale locale, Model model) {
		return "/board/writeQna";
	}

	@RequestMapping(value = "/qna/writeQna", method = { RequestMethod.GET, RequestMethod.POST })
	public String writeQna(Locale locale, HttpSession session, Model model, @RequestParam Map map,
			@RequestParam(value = "file") List<MultipartFile> files) {
		map.put("mxseq", session.getAttribute("USEQ"));
		map.put("bxqgrid", session.getAttribute("UOFFICE"));
		int result = 0;
		try {
			String newFileName = "";
			String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());
			for (int i = 0; i < files.size(); i++) {
				MultipartFile file = (MultipartFile) files.get(i);
				// System.out.println(file.isEmpty() + "==============="+i);
				if (!file.isEmpty()) {
					newFileName += now + file.getOriginalFilename();
					File newFile = new File(fileUploadPath/* + sub */ + newFileName);
					file.transferTo(newFile);
					model.addAttribute("originalFileName", file);
					map.put("bxqfile" + (i + 1), file.getOriginalFilename());
					map.put("bxqconvertfile" + (i + 1), newFileName);
				}
			}
			result = boardService.writeQna(map);
			model.addAttribute("qna", boardService.readQna(map));
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("success_flag", "N");
		}
		if (0 < result) {
			model.addAttribute("success_flag", "Y");
		} else {
			model.addAttribute("success_flag", "N");
		}
		model.addAttribute("forward_url", "/board/qna/readQna?bxqseq=" + map.get("bxqseq"));

		return "common/common_alert";
	}

	@RequestMapping(value = "/qna/readQna", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String readQna(HttpSession session, HttpServletRequest req, Model model, @RequestParam Map map) {
		map.put("mxseq", session.getAttribute("USEQ"));
		map.put("bxngrid", session.getAttribute("UOFFICE"));
		map.put("udiv", session.getAttribute("UDIV"));
		try {
			model.addAttribute("qna", boardService.readQna(map));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/board/readQna";
	}

	@RequestMapping(value = "/qna/deleteQna", method = { RequestMethod.GET, RequestMethod.POST })
	public String deleteQna(Locale locale, Model model, @RequestParam Map map, HttpSession session) {
		map.put("bxqgrid", session.getAttribute("UOFFICE"));
		map.put("mxseq", session.getAttribute("USEQ"));
		int result = 0;

		try {
			result = boardService.deleteQna(map);
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
		model.addAttribute("forward_url", "/board/ad_qna?bxnqrid=" + map.get("bxqgrid"));

		return "common/common_alert";
	}

	@RequestMapping(value = "/qna/editQnaUi", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String editQnaUi(HttpServletRequest req, Model model, @RequestParam Map map) {
		model.addAttribute("qna", boardService.readQna(map));
		return "/board/editQnaUi";
	}

	@RequestMapping(value = "/qna/editQna", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String editQna(HttpServletRequest req, Model model, @RequestParam Map map) {
		try {
			int result = boardService.editQna(map);
			model.addAttribute("qna", boardService.readQna(map));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/board/readQna";
	}

	@RequestMapping(value = "/qna/writeQnarep", method = { RequestMethod.GET, RequestMethod.POST })
	public String writeQnarep(Locale locale, HttpSession session, Model model, @RequestParam Map map) {
		int result = 0;
		try {
			result = boardService.writeQnarep(map);
			model.addAttribute("qna", boardService.readQna(map));
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("success_flag", "N");
		}
		if (0 < result) {
			model.addAttribute("success_flag", "Y");
		} else {
			model.addAttribute("success_flag", "N");
		}
		model.addAttribute("forward_url", "/board/qna/readQna?bxqseq=" + map.get("bxqseq"));

		return "common/common_alert";
	}

	@RequestMapping(value = "/tutor", method = { RequestMethod.GET,
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

	@RequestMapping(value = "/writeComment", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
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
		model.addAttribute("forward_url", "/board/tutor?mxseq=" + map.get("mxseq"));

		return "common/common_alert";
		/*
		 * try {
		 * System.out.println("----------------!!!!!!!!!!!!!--------------"); if
		 * (map.get("tucxcomment") != null && !"".equals((String)
		 * map.get("tucxcomment"))) {
		 * System.out.println("----------------!!!!!!!!!!!!!--------------");
		 * int }
		 * 
		 * model.addAttribute("comment", boardService.readComment(map));
		 * model.addAttribute("tutor", boardService.tutor(map));
		 * 
		 * } catch (Exception e) { e.printStackTrace(); } return "/board/tutor";
		 */
	}

	/*
	 * @RequestMapping(value = "/readComment", method = RequestMethod.POST,
	 * produces = "text/plain;charset=UTF-8") public String readRep(Locale
	 * locale, Model model, @RequestParam Map map) {
	 * model.addAttribute("comment", boardService.readComment(map)); return
	 * "/board/read2"; }
	 */

	@RequestMapping(value = "/deleteComment", method = { RequestMethod.GET, RequestMethod.POST })
	public String deleteComment(Locale locale, Model model, @RequestParam Map map,
			@RequestParam(value = "chks") List chks, HttpSession session) {
		map.put("bxqgrid", session.getAttribute("UOFFICE"));
		map.put("mxseq", map.get("mxseq"));
		int result = 0;

		try {
			String str = (String) map.get("chks");
			String[] array = str.split(",");
			for (int i = 0; i < array.length; i++) {
				map.put("tucxseq", array[i]);
				result = boardService.deleteComment(map);
			}
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
		model.addAttribute("forward_url", "/board/tutor?mxseq=" + map.get("mxseq"));
		model.addAttribute("mxseq", map.get("mxseq"));

		return "common/common_alert";
	}

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

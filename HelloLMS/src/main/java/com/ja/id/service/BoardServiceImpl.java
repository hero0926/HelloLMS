package com.ja.id.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ja.id.dao.BoardDAO;

@Component
@Transactional(readOnly = true)
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	int result = 0;
	
	Logger log = Logger.getLogger(this.getClass());
	

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int writeNotice(Map map, HttpServletRequest req) throws Exception {
		//map.put("mxoffice", map.get("mxoffice"));
		result = boardDAO.writeNotice(map);
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)req;
	    Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	    MultipartFile multipartFile = null;
	    while(iterator.hasNext()){
	        multipartFile = multipartHttpServletRequest.getFile(iterator.next());
	        if(multipartFile.isEmpty() == false){
	            log.debug("------------- file start -------------");
	            log.debug("name : "+multipartFile.getName());
	            log.debug("filename : "+multipartFile.getOriginalFilename());
	            log.debug("size : "+multipartFile.getSize());
	            log.debug("-------------- file end --------------\n");
	        }
	    }
	
		if (result == 1) {

		} else {
			throw new Exception();
		}
		map.put("bxnseq", map.get("bxnseq"));
		return result;
		
	}

	@Override
	public List<HashMap> getAllNotice(Map map) {
		//map.put("bxngrid", map.get("bxngrid"));
		return boardDAO.getAllNotice(map);
	}

	@Override
	public Map readNotice(Map map) {
		return boardDAO.readNotice(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int updateCnt(Map map) throws Exception {
		result = boardDAO.updateCnt(map);
		return result;
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int editNotice(Map map) throws Exception {
		result = boardDAO.editNotice(map);
		if (result == 1) {

		} else {
			throw new Exception();
		}
		return result;
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int deleteNotice(Map map) {
		return boardDAO.deleteNotice(map);
	}
	
	@Override
	public List<HashMap> searchNotice(Map map) {
		//map.put("bxngrid", map.get("bxngrid"));
		return boardDAO.searchNotice(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int writeQna(Map map) throws Exception {
		result = boardDAO.writeQna(map);

		if (result == 1) {

		} else {
			throw new Exception();
		}
		map.put("bxqseq", map.get("bxqseq"));
		return result;
	}
	
	@Override
	public List<HashMap> getAllQna(Map map) {
		//map.put("bxngrid", map.get("bxngrid"));
		return boardDAO.getAllQna(map);
	}

	@Override
	public Map readQna(Map map) {
		return boardDAO.readQna(map);
	}
	
	@Override
	public List<HashMap> repCheck(Map map) {
		//map.put("bxqno", map.get("bxqno"));
		return boardDAO.repCheck(map);
	}
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int writeQnarep(Map map) throws Exception {
		result = boardDAO.writeQnarep(map);

		if (result == 1) {

		} else {
			throw new Exception();
		}
		map.put("bxqseq", map.get("bxqseq"));
		return result;
	}
	
	@Override
	public Map tutor(Map map) {
		return boardDAO.tutor(map);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int updateJoayo(Map map) throws Exception  {
		result = boardDAO.updateJoayo(map);
		if (result == 1) {
			result = boardDAO.selectJoayo(map);
		}else {
			throw new Exception();
		}
		return result;
	}

	@Override
	public int selectJoayo(Map map) {
		map.put("mxseq", map.get("mxseq"));
		return boardDAO.selectJoayo(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int writeComment(Map map) {
		result = boardDAO.writeComment(map);
		map.put("r_seq", map.get("seq"));
		if (1 == result) {
			
			// success!
		} else {
			try {
				throw new Exception();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return result;
	}

	@Override
	public List<HashMap> readComment(Map map) {
		//map.put("bxngrid", map.get("bxngrid"));
		return boardDAO.readComment(map);
	}

}

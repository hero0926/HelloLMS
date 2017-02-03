package com.ja.id.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ja.id.dao.BoardDAO;

@Component
@Transactional(readOnly = true)
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	int result = 0;

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int writeNotice(Map map) throws Exception {
		//map.put("mxoffice", map.get("mxoffice"));
		result = boardDAO.writeNotice(map);

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

}

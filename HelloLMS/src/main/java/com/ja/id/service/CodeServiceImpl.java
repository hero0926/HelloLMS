package com.ja.id.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ja.id.dao.CodeDAO;

@Component
@Transactional(readOnly = true)
public class CodeServiceImpl implements CodeService{
	
	@Autowired
	CodeDAO codeDAO;
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int insertCode(Map map) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("service");
		return codeDAO.insertCode(map);
	}

	@Override
	public List<HashMap> selectCode(Map map) {
		// TODO Auto-generated method stub
		return codeDAO.selectCode(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int deleteCode(Map map) {
		// TODO Auto-generated method stub
		return codeDAO.deleteCode(map);
	}

}

package com.ja.id.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.ja.id.dao.UploadDAO;

@Component
@Transactional(readOnly = false)
public class UploadServiceImpl implements UploadService {	
	
	@Autowired
	UploadDAO dao;

	@Override
	public void updatead(Map map) throws Exception {
		// TODO Auto-generated method stub
		
		dao.updatead(map);

	}

	@Override
	public List<HashMap> selectad(Map map) {
		// TODO Auto-generated method stub
		System.out.println("어디까지된겨?? - 서비스단");
		return dao.selectad(map);
	}

}

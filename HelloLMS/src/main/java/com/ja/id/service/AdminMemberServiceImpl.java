package com.ja.id.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.ja.id.dao.AdminMemberDAO;

@Component
@Transactional(readOnly = false)
public class AdminMemberServiceImpl implements AdminMemberService {
	
	@Autowired
	AdminMemberDAO dao;

	@Override
	public List<HashMap> selectMember(Map map) {
		// TODO Auto-generated method stub
		return dao.selectMember(map);
	}

	@Override
	public int deleteMember(Map map) {
		// TODO Auto-generated method stub
		return dao.deleteMember(map);
	}
	
	
	@Override
	public int updateMemberT(Map map) {
		// TODO Auto-generated method stub
		return dao.updateMemberT(map);
	}

	@Override
	public List<HashMap> updateM(Map map) {
		// TODO Auto-generated method stub
		return dao.updateM(map);
	}


}

package com.ja.id.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ja.id.dao.AdminMemberDAO;

@Component
@Transactional(readOnly = true)
public class AdminMemberServiceImpl implements AdminMemberService {
	
	@Autowired
	AdminMemberDAO dao;

	@Override
	public List<HashMap> selectMember(Map map) {
		// TODO Auto-generated method stub
		return dao.selectMember(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int deleteMember(Map map) {
		// TODO Auto-generated method stub
		return dao.deleteMember(map);
	}
	
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int updateMemberT(Map map) {
		// TODO Auto-generated method stub
		return dao.updateMemberT(map);
	}

	@Override
	public List<HashMap> updateM(Map map) {
		// TODO Auto-generated method stub
		return dao.updateM(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int insertMemberT(Map map) throws Exception {
		// TODO Auto-generated method stub
		return dao.insertMemberT(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int deleteT(Map map) {
		// TODO Auto-generated method stub
		return dao.deleteT(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int updateMemberS(Map map) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateMemberS(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List<HashMap> loginHistory(Map map) throws Exception {
		// TODO Auto-generated method stub
		return dao.loginHistory(map);
	}



}

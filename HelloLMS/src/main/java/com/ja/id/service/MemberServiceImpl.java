package com.ja.id.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ja.id.dao.MemberDAO;

@Component
@Transactional(readOnly = true)
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDAO MemberDAO;
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int insertMember(Map map) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("ȸ������ �ϱ�");
		return MemberDAO.insertMember(map);
	}

}

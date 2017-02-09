package com.ja.id.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ja.id.mybatis.AdminMemberMapper;

@Repository
public class AdminMemberDAOImpl implements AdminMemberDAO {
	
	@Autowired
	private SqlSession ss;

	@Override
	public List<HashMap> selectMember(Map map) {
		// TODO Auto-generated method stub
		AdminMemberMapper mapper = ss.getMapper(AdminMemberMapper.class);
		
		return mapper.selectMember(map);
	}

	@Override
	public int deleteMember(Map map) {
		// TODO Auto-generated method stub
		AdminMemberMapper mapper = ss.getMapper(AdminMemberMapper.class);
		
		return mapper.deleteMember(map);
	}

	@Override
	public int updateMemberT(Map map) {
		// TODO Auto-generated method stub
		AdminMemberMapper mapper = ss.getMapper(AdminMemberMapper.class);
		return mapper.updateMemberT(map);		
	}

	@Override
	public List<HashMap> updateM(Map map) {
		// TODO Auto-generated method stub
		AdminMemberMapper mapper = ss.getMapper(AdminMemberMapper.class);
		return mapper.updateM(map);
	}

	

}

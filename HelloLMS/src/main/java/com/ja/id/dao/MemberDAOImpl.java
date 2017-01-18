package com.ja.id.dao;
import java.util.Map;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ja.id.mybatis.CodeMapper;
import com.ja.id.mybatis.MemberMapper;


@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertMember(Map map) {
		// TODO Auto-generated method stub
		
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			
		return mapper.insertMember(map);
		
	}

}

package com.ja.id.dao;
import java.util.Map;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ja.id.domain.MemberVO;
import com.ja.id.dto.LoginDTO;
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

	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.login(dto);
	}

}

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
	public void insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		mapper.insertMember(vo);
		
	}

	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.login(dto);
	}

	@Override
	public void update(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		

		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		mapper.updateMember(vo);
		
		
	}

	@Override
	public void deleteMember(String mxid) throws Exception {
		// TODO Auto-generated method stub
		
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		mapper.deleteMember(mxid);
		
	}

	@Override
	public String id(String mxname, String mxmail) {
		// TODO Auto-generated method stub		
		
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);		
		
		return mapper.id(mxname, mxmail);
	}

	@Override
	public int chkDupId(MemberVO vo) {
		// TODO Auto-generated method stub
		
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.chkDupId(vo);
	}

	@Override
	public int pw(String mxid, String mxname, String mxmail) {
		// TODO Auto-generated method stub
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.pw(mxid, mxname, mxmail);
	}

	

	@Override
	public void pwupdate(String pw, String mxid) {
		// TODO Auto-generated method stub
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		mapper.pwupdate(pw, mxid);
		
	}


}

package com.ja.id.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ja.id.mybatis.CodeMapper;

@Repository
public class CodeDAOImpl implements CodeDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertCode(Map map) {
		// TODO Auto-generated method stub
		CodeMapper mapper = sqlSession.getMapper(CodeMapper.class);
		return mapper.insertCode(map);
	}

	@Override
	public List<HashMap> selectCode(Map map) {
		// TODO Auto-generated method stub
		CodeMapper mapper = sqlSession.getMapper(CodeMapper.class);
		return mapper.selectCode(map);
	}

}

package com.ja.id.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ja.id.mybatis.QuizMapper;

@Repository
public class QuizDAOImpl implements QuizDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertQuiz(Map map) {
		// TODO Auto-generated method stub
		
		QuizMapper mapper = sqlSession.getMapper(QuizMapper.class);
		
		return mapper.insertQuiz(map);
	}

	@Override
	public List<HashMap> selectQuiz(Map map) {
		// TODO Auto-generated method stub
		QuizMapper mapper = sqlSession.getMapper(QuizMapper.class);
		return mapper.selectQuiz(map);
	}

	@Override
	public int deleteQuiz(Map map) {
		// TODO Auto-generated method stub
		QuizMapper mapper = sqlSession.getMapper(QuizMapper.class);
		return mapper.deleteQuiz(map);
	}

	@Override
	public int insertQxanswer(Map map) {
		// TODO Auto-generated method stub
		QuizMapper mapper = sqlSession.getMapper(QuizMapper.class);
		return mapper.insertQxanswer(map);
	}

	@Override
	public int updateQxanswer(Map map) {
		// TODO Auto-generated method stub
		QuizMapper mapper = sqlSession.getMapper(QuizMapper.class);
		return mapper.updateQxanswer(map);
	}
	
	

	
	
}

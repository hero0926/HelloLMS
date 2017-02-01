package com.ja.id.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ja.id.dao.QuizDAO;

@Component
@Transactional(readOnly = true)
public class QuizServiceImpl implements QuizService{
	
	@Autowired
	QuizDAO QuizDAO;

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int insertQuiz(Map map) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("�������ϱ�");
		return QuizDAO.insertQuiz(map);
	}

	@Override
	public List<HashMap> selectQuiz(Map map) {
		// TODO Auto-generated method stub
		return QuizDAO.selectQuiz(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int deleteQuiz(Map map) {
		// TODO Auto-generated method stub
		return QuizDAO.deleteQuiz(map);
	}
	
	

}

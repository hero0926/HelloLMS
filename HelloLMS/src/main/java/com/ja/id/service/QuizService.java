package com.ja.id.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface QuizService {
	
	public int insertQuiz(Map map) throws Exception;
	
	public List<HashMap> selectQuiz(Map map);
	
	public int deleteQuiz(Map map);
	

}

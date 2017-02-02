package com.ja.id.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface QuizDAO {
	
	public int insertQuiz(Map map);
	
	public List<HashMap> selectQuiz(Map map);
	
	public int deleteQuiz(Map map);

	public int insertQxanswer(Map map);

	public int updateQxanswer(Map map);

}

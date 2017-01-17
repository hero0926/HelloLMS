package com.ja.id.mybatis;

import java.util.Map;
import java.util.HashMap;
import java.util.List;

public interface QuizMapper {
	
	public int insertQuiz(Map map);
	
	public List<HashMap> selectQuiz(Map map);
	
	public int deleteQuiz(Map map);
	

}

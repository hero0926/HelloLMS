package com.ja.id.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public interface AdminService {

	public int insertCode(Map map) throws Exception;

	public List<HashMap> selectCode(Map map);

	public int deleteCode(Map map);

	public List<HashMap> selectCourse(Map map);

	public List<HashMap> selectTutor(Map map);

	public int insertCourse(Map map);

	public int updateCourse(Map map);

	public int deleteCourse(Map map) throws Exception;

	public List<HashMap> selectTestpool(Map map);

	public List<HashMap> selectLecture(Map map);

	public int updateTestpool(Map map);

	public int insertTestpool(Map map);

	public int deleteTestpool(Map map);

	public List<HashMap> selectQuiz(Map map);

	public int insertQuiz(Map map);

	public int deleteQuiz(Map map);

}

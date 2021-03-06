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

	public List<HashMap> selectTestpaper(Map map);

	public int updateTestpaper(Map map) throws Exception;

	public int insertTestpaper(Map map) throws Exception;

	public int deleteTestpaper(Map map) throws Exception;

	public List<HashMap> selectTestMonitor(Map map);

	public List<HashMap> selectTestApply(Map map);

	public List<HashMap> selectTestresult(Map map);
	
	public List<HashMap> popup(Map map);


	public int updateScore(Map map) throws Exception;

	public List<HashMap> selectResult(Map map);

	public List<HashMap> selectAnswer(Map map);

	public int addScore(Map map) throws Exception;

	public int updateScore3(Map map) throws Exception;

	public List<HashMap> selectGraph(Map map);

	public List<HashMap> selectGrade(Map map);

	public List<HashMap> selectProgress(Map map);

	public List<HashMap> selectBoardFaq(Map map);

	public int getTotalFaq(Map map);

}

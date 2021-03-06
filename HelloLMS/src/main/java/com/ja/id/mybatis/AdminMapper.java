package com.ja.id.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public interface AdminMapper {

	public int insertCode(Map map);

	public List<HashMap> selectCode(Map map);

	public int deleteCode(Map map);

	public List<HashMap> selectCourse(Map map);

	public List<HashMap> selectTutor(Map map);

	public int insertCourse(Map map);

	public int updateCourse(Map map);

	public int deleteCourse(Map map);

	public List<HashMap> selectTestpool(Map map);

	public List<HashMap> selectLecture(Map map);

	public int updateTestpool(Map map);

	public int insertTestpool(Map map);

	public int deleteTestpool(Map map);

	public List<HashMap> selectQuiz(Map map);

	public int insertQuiz(Map map);

	public int deleteQuiz(Map map);

	public List<HashMap> selectTestpaper(Map map);

	public int updateTestpaper(Map map);

	public int insertTestpaper(Map map);

	public int deleteTestpaper(Map map);

	public int insertTestanswer(Map map);

	public int selectCntTestresult(Map map);

	public int deleteAllTestanswer(Map map);

	public List<HashMap> selectTestMonitor(Map map);

	public List<HashMap> selectTestApply(Map map);

	public List<HashMap> selectTestresult(Map map);

	public List<HashMap> popup(Map map);
	
	public int updateScore1(Map map);

	public int updateScore2(Map map);

	public List<HashMap> selectResult(Map map);

	public List<HashMap> selectAnswer(Map map);

	public int addScore1(Map map);

	public int selectSumScore(Map map);

	public int addScore2(Map map);

	public int updateScore3(Map map);

	public int updateScore4(Map map);

	public List<HashMap> selectGraph(Map map);

	public List<HashMap> selectGrade(Map map);

	public List<HashMap> selectProgress(Map map);

	public int updateOrder(Map map);

	public List<HashMap> selectBoardFaq(Map map);

	public int getTotalFaq(Map map);

}

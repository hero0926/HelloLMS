package com.ja.id.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface AdminDAO {

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

}

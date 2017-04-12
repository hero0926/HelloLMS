package com.ja.id.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MyLectureDAO {

	public List<HashMap> getAllApplyCourse(Map map);

	public List<HashMap> getAllCourse(Map map);

	public List<HashMap> getLectue(Map map);

	public List<HashMap> islexstudy(Map map);

	public List<HashMap> lexstudy(Map map);

	public int lexstudyinsert(Map map);
	
	public int lexstudyupdate(Map map);
	
	public int lexstudyloginsert(Map map);

	public List<HashMap> getAllCnt(Map map);

	public List<HashMap> getCnt(Map map);

	public int applyCourseDelete(Map map);

	public List<HashMap> getHistory(Map map);

	public List<HashMap> selectTestpool(Map map);

	public List<HashMap> selectTestpaper(Map map);

	public List<HashMap> testpoolList(Map map);

	public int updateAnswer(Map map);

	public int submitTest(Map map);

	public List<HashMap> selectTestresult(Map map);

	public int insertTestresult(Map map);

	public int updateRest(Map map);
	
}

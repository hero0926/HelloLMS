package com.ja.id.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MyLectureService {

	public List<HashMap> getAllApplyCourse(Map map) throws Exception;

	public List<HashMap> getAllCourse(Map map) throws Exception;

	public List<HashMap> getLecture(Map map) throws Exception;

	public List<HashMap> lexstudy(Map map) throws Exception;

	public List<HashMap> islexstudy(Map map) throws Exception;

	public int lexstudyinsert(Map map) throws Exception;

	public int lexstudyloginsert(Map map) throws Exception;

	public int lexstudyupdate(Map map) throws Exception;

	public List<HashMap> getAllCnt(Map map) throws Exception;

	public List<HashMap> getCnt(Map map) throws Exception;

	public int applyCourseDelete(Map map) throws Exception;

	public List<HashMap> getHistory(Map map) throws Exception;

	public List<HashMap> selectTestpool(Map map) throws Exception;

	public List<HashMap> selectTestpaper(Map map) throws Exception;

	public List<HashMap> testpoolList(Map map) throws Exception;

	public int updateAnswer(Map map) throws Exception;

	public int submitTest(Map map) throws Exception;

	public List<HashMap> selectTestresult(Map map) throws Exception;

	public int insertTestresult(Map map) throws Exception;

	public int updateRest(Map map) throws Exception;
	
}

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
	
}

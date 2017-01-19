package com.ja.id.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MyLectureMapper {

	public List<HashMap> getAllApplyCourse(Map map);

	public List<HashMap> getAllCourse(Map map);

	public List<HashMap> getLectrue(Map map);

	public List<HashMap> islexstudy(Map map);

	public List<HashMap> lexstudy(Map map);

	public List<HashMap> loginsert(Map map);
	
	public List<HashMap> logupdate(Map map);

	public int lexstudyinsert(Map map);
	
	public int lexstudyupdate(Map map);
	
	public int lexstudyloginsert(Map map);

	public List<HashMap> getAllCnt(Map map);
	
	public List<HashMap> getCnt(Map map);

}

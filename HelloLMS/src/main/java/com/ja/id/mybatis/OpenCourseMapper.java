package com.ja.id.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface OpenCourseMapper {

	public List<HashMap> openCourseList(Map map);

	public List<HashMap> openLectureList(Map map);

	public List<HashMap> getLecture(Map map);
	
}

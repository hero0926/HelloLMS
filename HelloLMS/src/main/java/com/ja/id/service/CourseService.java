package com.ja.id.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface CourseService {

	public List<HashMap> getAllcourse(Map map);

	public List<HashMap> applycourse(Map map);

	public int insertApply(Map map);

	public int applyDelte(Map map);

	public List<HashMap> openCourseList(Map map) throws Exception;

	public List<HashMap> openLectureList(Map map) throws Exception;

	public List<HashMap> getLecture(Map map) throws Exception;

	public List<HashMap> lectureList(Map map);

}

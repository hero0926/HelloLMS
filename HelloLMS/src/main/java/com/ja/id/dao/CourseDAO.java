package com.ja.id.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface CourseDAO {

	public List<HashMap> getAllcourse(Map map);

	public List<HashMap> applycourse(Map map);

	public int insertApply(Map map);

	public int applyDelte(Map map);

	public List<HashMap> openCourseList(Map map);

	public List<HashMap> openLectureList(Map map);

	public List<HashMap> getLecture(Map map);

	public List<HashMap> lectureList(Map map);

}

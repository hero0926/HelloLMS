package com.ja.id.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface CourseDAO {

	public List<HashMap> getAllcourse(Map map);

	public List<HashMap> applycourse(Map map);

	int selectapply(Map map);

	public List<HashMap> applycheck(Map map);

	public int insertApply(Map map);

	public List<HashMap> openCourseList(Map map);

	public List<HashMap> openLectureList(Map map);

}

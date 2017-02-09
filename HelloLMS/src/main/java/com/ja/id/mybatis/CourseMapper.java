package com.ja.id.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface CourseMapper {

	public List<HashMap> getAllCourse(Map map);

	public List<HashMap> getAllapply(Map map);

	public int selectapply(Map map);

	public List<HashMap> applycourse(Map map);

	public List<HashMap> applycheck(Map map);

	public int insertApply(Map map);

	public List<HashMap> openCourseList(Map map);

	public List<HashMap> openLectureList(Map map);

	public List<HashMap> getLecture(Map map);

}

package com.ja.id.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface AdminMapper {

	public int insertCode(Map map);

	public List<HashMap> selectCode(Map map);

	public int deleteCode(Map map);

	public List<HashMap> selectCourse(Map map);

	public List<HashMap> selectTutor(Map map);

	public int insertCourse(Map map);

	public int updateCourse(Map map);

	public int deleteCourse(Map map);
}
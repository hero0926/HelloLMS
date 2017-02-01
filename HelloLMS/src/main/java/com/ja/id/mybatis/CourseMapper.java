package com.ja.id.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ja.id.domain.MemberVO;

public interface CourseMapper {

	public List<HashMap> getAllCourse(Map map);

	public List<HashMap> getAllapply(Map map);
	
	public void update(MemberVO vo) throws Exception;
	
	

}

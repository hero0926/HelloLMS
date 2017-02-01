package com.ja.id.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ja.id.mybatis.CourseMapper;

@Repository
public class CourseDAOImpl implements CourseDAO {

	@Autowired
	private SqlSession sqlSession;

	

	@Override
	public List<HashMap> getAllcourse(Map map) {
		
		CourseMapper mapper = sqlSession.getMapper(CourseMapper.class);
		
		return mapper.getAllCourse(map);
	}

	@Override
	public List<HashMap> getAllapply(Map map) {
		
		CourseMapper mapper = sqlSession.getMapper(CourseMapper.class);
		
		return mapper.getAllapply(map);
	}

	

}

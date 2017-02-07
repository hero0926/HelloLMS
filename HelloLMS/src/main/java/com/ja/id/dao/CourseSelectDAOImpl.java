package com.ja.id.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ja.id.mybatis.CourseSelectMapper;

@Repository
public class CourseSelectDAOImpl implements CourseSelectDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<HashMap> SelectSearchCourse(Map map) {
		// TODO Auto-generated method stub
		CourseSelectMapper mapper = sqlSession.getMapper(CourseSelectMapper.class);
		
		return mapper.SelectSearchCourse(map);
	}

}

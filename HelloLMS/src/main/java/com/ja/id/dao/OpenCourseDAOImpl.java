package com.ja.id.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ja.id.mybatis.CourseMapper;
import com.ja.id.mybatis.OpenCourseMapper;

@Repository
public class OpenCourseDAOImpl implements OpenCourseDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<HashMap> openCourseList(Map map) {
		// TODO Auto-generated method stub
		OpenCourseMapper mapper = sqlSession.getMapper(OpenCourseMapper.class);
		return mapper.openCourseList(map);
	}

	@Override
	public List<HashMap> openLectureList(Map map) {
		// TODO Auto-generated method stub
		OpenCourseMapper mapper = sqlSession.getMapper(OpenCourseMapper.class);
		return mapper.openLectureList(map);
	}

	@Override
	public List<HashMap> getLecture(Map map) {
		// TODO Auto-generated method stub
		OpenCourseMapper mapper = sqlSession.getMapper(OpenCourseMapper.class);
		return mapper.getLecture(map);
	}

}

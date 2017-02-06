package com.ja.id.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
	public int selectapply(Map map) {
		CourseMapper mapper = sqlSession.getMapper(CourseMapper.class);

		return mapper.selectapply(map);
	}

	@Override
	public List<HashMap> applycourse(Map map) {
		CourseMapper mapper = sqlSession.getMapper(CourseMapper.class);
		return mapper.applycourse(map);

	}

	@Override
	public List<HashMap> applycheck(Map map) {
		CourseMapper mapper = sqlSession.getMapper(CourseMapper.class);
		
		return mapper.applycheck(map);
	}

	@Override
	public int insertApply(Map map) {
		// TODO Auto-generated method stub
		CourseMapper mapper = sqlSession.getMapper(CourseMapper.class);
		
		return mapper.insertApply(map);
	}

	@Override
	public List<HashMap> openCourseList(Map map) {
		// TODO Auto-generated method stub
		CourseMapper mapper = sqlSession.getMapper(CourseMapper.class);
		return mapper.openCourseList(map);
	}

	@Override
	public List<HashMap> openLectureList(Map map) {
		// TODO Auto-generated method stub
		CourseMapper mapper = sqlSession.getMapper(CourseMapper.class);
		return mapper.openLectureList(map);
	}

}

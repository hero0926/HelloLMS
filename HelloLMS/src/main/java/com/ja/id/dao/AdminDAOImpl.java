package com.ja.id.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ja.id.mybatis.AdminMapper;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertCode(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.insertCode(map);
	}

	@Override
	public List<HashMap> selectCode(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectCode(map);
	}

	@Override
	public int deleteCode(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.deleteCode(map);
	}

	@Override
	public List<HashMap> selectCourse(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectCourse(map);
	}

	@Override
	public List<HashMap> selectTutor(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectTutor(map);
	}

	@Override
	public int insertCourse(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.insertCourse(map);
	}

	@Override
	public int updateCourse(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.updateCourse(map);
	}

	@Override
	public int deleteCourse(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.deleteCourse(map);
	}

	@Override
	public List<HashMap> selectTestpool(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectTestpool(map);
	}

}

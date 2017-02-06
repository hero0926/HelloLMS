package com.ja.id.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ja.id.mybatis.Admin2Mapper;

@Repository
public class Admin2DAOImpl implements Admin2DAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<HashMap> getLectureList(Map map) {
		// TODO Auto-generated method stub
		Admin2Mapper mapper = sqlSession.getMapper(Admin2Mapper.class);
		return mapper.getLectureList(map);
	}

	@Override
	public int updateFile(Map map) {
		// TODO Auto-generated method stub
		Admin2Mapper mapper = sqlSession.getMapper(Admin2Mapper.class);
		return mapper.updateFile(map);
	}

	@Override
	public int lectureDel(Map map) {
		// TODO Auto-generated method stub
		Admin2Mapper mapper = sqlSession.getMapper(Admin2Mapper.class);
		return mapper.lectureDel(map);
	}

	@Override
	public int insertLecture(Map map) {
		// TODO Auto-generated method stub
		Admin2Mapper mapper = sqlSession.getMapper(Admin2Mapper.class);
		return mapper.insertLecture(map);
	}

	@Override
	public List<HashMap> getApplyList(Map map) {
		// TODO Auto-generated method stub
		Admin2Mapper mapper = sqlSession.getMapper(Admin2Mapper.class);
		return mapper.getApplyList(map);
	}

	@Override
	public List<HashMap> modLecture(Map map) {
		// TODO Auto-generated method stub
		Admin2Mapper mapper = sqlSession.getMapper(Admin2Mapper.class);
		return mapper.modLecture(map);
	}

	@Override
	public List<HashMap> selectCode(Map map) {
		// TODO Auto-generated method stub
		Admin2Mapper mapper = sqlSession.getMapper(Admin2Mapper.class);
		return mapper.selectCode(map);
	}

	@Override
	public int lectureMod(Map map) {
		// TODO Auto-generated method stub
		Admin2Mapper mapper = sqlSession.getMapper(Admin2Mapper.class);
		return mapper.lectureMod(map);
	}

	@Override
	public int statusUpdate(Map map) {
		// TODO Auto-generated method stub
		Admin2Mapper mapper = sqlSession.getMapper(Admin2Mapper.class);
		return mapper.statusUpdate(map);
	}

	@Override
	public List<HashMap> getHistory(Map map) {
		// TODO Auto-generated method stub
		Admin2Mapper mapper = sqlSession.getMapper(Admin2Mapper.class);
		return mapper.getHistory(map);
	}

	@Override
	public int allApplyStatus(Map map) {
		// TODO Auto-generated method stub
		Admin2Mapper mapper = sqlSession.getMapper(Admin2Mapper.class);
		return mapper.allApplyStatus(map);
	}

}

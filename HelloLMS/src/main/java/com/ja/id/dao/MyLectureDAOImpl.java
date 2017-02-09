package com.ja.id.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ja.id.mybatis.MyLectureMapper;

@Repository
public class MyLectureDAOImpl implements MyLectureDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<HashMap> getAllApplyCourse(Map map) {
		// TODO Auto-generated method stub
		MyLectureMapper mapper = sqlSession.getMapper(MyLectureMapper.class);
		return mapper.getAllApplyCourse(map);
	}

	@Override
	public List<HashMap> getAllCourse(Map map) {
		// TODO Auto-generated method stub
		MyLectureMapper mapper = sqlSession.getMapper(MyLectureMapper.class);
		return mapper.getAllCourse(map);
	}

	@Override
	public List<HashMap> getLectue(Map map) {
		// TODO Auto-generated method stub
		MyLectureMapper mapper = sqlSession.getMapper(MyLectureMapper.class);
		return mapper.getLectrue(map);
	}

	@Override
	public List<HashMap> islexstudy(Map map) {
		// TODO Auto-generated method stub
		MyLectureMapper mapper = sqlSession.getMapper(MyLectureMapper.class);
		return mapper.islexstudy(map);
	}

	@Override
	public List<HashMap> lexstudy(Map map) {
		// TODO Auto-generated method stub
		MyLectureMapper mapper = sqlSession.getMapper(MyLectureMapper.class);
		return mapper.lexstudy(map);
	}

	@Override
	public int lexstudyinsert(Map map) {
		// TODO Auto-generated method stub
		MyLectureMapper mapper = sqlSession.getMapper(MyLectureMapper.class);
		return mapper.lexstudyinsert(map);
	}

	@Override
	public int lexstudyupdate(Map map) {
		// TODO Auto-generated method stub
		MyLectureMapper mapper = sqlSession.getMapper(MyLectureMapper.class);
		return mapper.lexstudyupdate(map);
	}

	@Override
	public int lexstudyloginsert(Map map) {
		// TODO Auto-generated method stub
		MyLectureMapper mapper = sqlSession.getMapper(MyLectureMapper.class);
		return mapper.lexstudyloginsert(map);
	}

	@Override
	public List<HashMap> getAllCnt(Map map) {
		// TODO Auto-generated method stub
		MyLectureMapper mapper = sqlSession.getMapper(MyLectureMapper.class);
		return mapper.getAllCnt(map);
	}

	@Override
	public List<HashMap> getCnt(Map map) {
		// TODO Auto-generated method stub
		MyLectureMapper mapper = sqlSession.getMapper(MyLectureMapper.class);
		return mapper.getCnt(map);
	}

	@Override
	public int applyCourseDelete(Map map) {
		// TODO Auto-generated method stub
		MyLectureMapper mapper = sqlSession.getMapper(MyLectureMapper.class);
		return mapper.applyCourseDelete(map);
	}

	@Override
	public List<HashMap> getHistory(Map map) {
		// TODO Auto-generated method stub
		MyLectureMapper mapper = sqlSession.getMapper(MyLectureMapper.class);
		return mapper.getHistory(map);
	}

	@Override
	public List<HashMap> selectTestpool(Map map) {
		// TODO Auto-generated method stub
		MyLectureMapper mapper = sqlSession.getMapper(MyLectureMapper.class);
		return mapper.selectTestpool(map);
	}

	@Override
	public List<HashMap> selectTestpaper(Map map) {
		// TODO Auto-generated method stub
		MyLectureMapper mapper = sqlSession.getMapper(MyLectureMapper.class);
		return mapper.selectTestpaper(map);
	}

	@Override
	public List<HashMap> testpoolList(Map map) {
		// TODO Auto-generated method stub
		MyLectureMapper mapper = sqlSession.getMapper(MyLectureMapper.class);
		return mapper.testpoolList(map);
	}

}

package com.ja.id.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ja.id.mybatis.UploadMapper;

@Repository
public class UploadDAOImpl implements UploadDAO {
	
	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public void updatead(Map map) throws Exception {
		// TODO Auto-generated method stub
		UploadMapper mapper = sqlSession.getMapper(UploadMapper.class);
		mapper.insertad(map);

	}


	@Override
	public List<HashMap> selectad(Map map) {
		// TODO Auto-generated method stub
		UploadMapper mapper = sqlSession.getMapper(UploadMapper.class);

		return mapper.selectad(map);
	}


	@Override
	public List<HashMap> selectcourse(Map map) {
		// TODO Auto-generated method stub
		UploadMapper mapper = sqlSession.getMapper(UploadMapper.class);
		return mapper.selectcourse(map);
	}


	@Override
	public void updatepopup(Map map) {
		// TODO Auto-generated method stub
		UploadMapper mapper = sqlSession.getMapper(UploadMapper.class);
		mapper.updatepopup(map);
	}


	@Override
	public List<HashMap> selectTutor(Map map) {
		// TODO Auto-generated method stub
		UploadMapper mapper = sqlSession.getMapper(UploadMapper.class);
		return mapper.selectTutor(map);
	}

}

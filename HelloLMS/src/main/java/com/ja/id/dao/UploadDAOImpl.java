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

		System.out.println("어디까지된겨?? - dao단");
		return mapper.selectad(map);
	}

}

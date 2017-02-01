package com.ja.id.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ja.id.dao.CourseDAO;


@Component
@Transactional(readOnly = true)

public class CourseServiceImpl implements CourseService{
	
	@Autowired
	CourseDAO courseDao;
	
	@Override
	public List<HashMap> getAllcourse(Map map){
		// TODO Auto-generated method stub
		
		return courseDao.getAllcourse(map);
	}

	@Override
	public List<HashMap> getAllapply(Map map) {
		// TODO Auto-generated method stub
		return courseDao.getAllapply(map);
	}

	
	

}

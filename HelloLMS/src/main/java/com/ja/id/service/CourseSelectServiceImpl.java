package com.ja.id.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.ja.id.dao.CourseSelectDAO;

@Component
@Transactional(readOnly = true)
public class CourseSelectServiceImpl implements CourseSelectService {
	
	@Autowired
	CourseSelectDAO csDAO;

	@Override
	public List<HashMap> SelectSearchCourse(Map map) {
		// TODO Auto-generated method stub
		return csDAO.SelectSearchCourse(map);
	}

}

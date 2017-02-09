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

public class CourseServiceImpl implements CourseService {

	@Autowired
	CourseDAO courseDao;

	@Override
	public List<HashMap> getAllcourse(Map map) {
		// TODO Auto-generated method stub

		return courseDao.getAllcourse(map);
	}

	@Override
	public List<HashMap> applycourse(Map map) {
		// TODO Auto-generated method stub
		return courseDao.applycourse(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int insertApply(Map map) {
		// TODO Auto-generated method stub
		return courseDao.insertApply(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int applyDelte(Map map) {
		// TODO Auto-generated method stub
		return courseDao.applyDelte(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List<HashMap> openCourseList(Map map) throws Exception {
		// TODO Auto-generated method stub
		return courseDao.openCourseList(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List<HashMap> openLectureList(Map map) throws Exception {
		// TODO Auto-generated method stub
		return courseDao.openLectureList(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List<HashMap> getLecture(Map map) throws Exception {
		// TODO Auto-generated method stub
		return courseDao.getLecture(map);
	}

	@Override
	public List<HashMap> lectureList(Map map) {
		// TODO Auto-generated method stub
		return courseDao.lectureList(map);
	}

}

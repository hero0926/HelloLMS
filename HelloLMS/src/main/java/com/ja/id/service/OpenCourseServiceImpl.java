package com.ja.id.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ja.id.dao.CourseDAO;
import com.ja.id.dao.OpenCourseDAO;

@Component
@Transactional(readOnly = true)

public class OpenCourseServiceImpl implements OpenCourseService {

	@Autowired
	OpenCourseDAO openCourseDao;

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List<HashMap> openCourseList(Map map) throws Exception {
		// TODO Auto-generated method stub
		return openCourseDao.openCourseList(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List<HashMap> openLectureList(Map map) throws Exception {
		// TODO Auto-generated method stub
		return openCourseDao.openLectureList(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List<HashMap> getLecture(Map map) throws Exception {
		// TODO Auto-generated method stub
		return openCourseDao.getLecture(map);
	}

}

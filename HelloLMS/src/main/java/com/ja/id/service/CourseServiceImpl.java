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
	@Transactional
	public int selectapply(Map map) {

		int result = courseDao.selectapply(map); 
		
		String mxseq1=(String) map.get("mxseq");
		String coxseq1=(String) map.get("coxseq");
		
		List<HashMap> List = courseDao.applycheck(map);
		String mxseq = (String) List.get(0).get("mxseq");
		String coxseq = (String) List.get(0).get("coxseq");
		
		
		
		
		if(mxseq==mxseq1){
			
			return result;
		}
		
		
		return result;

	}

	@Override
	public List<HashMap> applycourse(Map map) {
		// TODO Auto-generated method stub
		return courseDao.applycourse(map);
	}

	@Override
	public List<HashMap> applycheck(Map map) {
		// TODO Auto-generated method stub
		return courseDao.applycheck(map); 
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int insertApply(Map map) {
		// TODO Auto-generated method stub
		return courseDao.insertApply(map); 
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

}

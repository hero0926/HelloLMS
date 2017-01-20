package com.ja.id.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ja.id.dao.AdminDAO;

@Component
@Transactional(readOnly = true)
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminDAO adminDAO;
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int insertCode(Map map) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("service");
		return adminDAO.insertCode(map);
	}

	@Override
	public List<HashMap> selectCode(Map map) {
		// TODO Auto-generated method stub
		return adminDAO.selectCode(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int deleteCode(Map map) {
		// TODO Auto-generated method stub
		return adminDAO.deleteCode(map);
	}

	@Override
	public List<HashMap> selectCourse(Map map) {
		// TODO Auto-generated method stub
		return adminDAO.selectCourse(map);
	}

	@Override
	public List<HashMap> selectTutor(Map map) {
		// TODO Auto-generated method stub
		return adminDAO.selectTutor(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int insertCourse(Map map) {
		// TODO Auto-generated method stub
		return adminDAO.insertCourse(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int updateCourse(Map map) {
		// TODO Auto-generated method stub
		return adminDAO.updateCourse(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int deleteCourse(Map map) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		result = adminDAO.deleteCourse(map);

		if (1 == result) {

//			adminDAO.deleteLecture(map);
//			adminDAO.deleteQuiz(map);
//			adminDAO.deleteQxanswer(map);
//			adminDAO.deleteTestpool(map);
//			adminDAO.deleteTestpaper(map);
//			adminDAO.deleteTestanswer(map);
//			adminDAO.deleteTestresult(map);
//			adminDAO.deleteApply(map);
//			adminDAO.deleteLexstudy(map);
//			adminDAO.deleteLexStudylog(map);
			

		} else {
			throw new Exception();
		}
		
		return result;
	}

	@Override
	public List<HashMap> selectTestpool(Map map) {
		// TODO Auto-generated method stub
		return adminDAO.selectTestpool(map);
	}



}

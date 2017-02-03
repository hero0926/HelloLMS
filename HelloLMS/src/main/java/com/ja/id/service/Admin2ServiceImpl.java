package com.ja.id.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ja.id.dao.Admin2DAO;


@Component
@Transactional(readOnly = true)
public class Admin2ServiceImpl implements Admin2Service{
	
	@Autowired
	Admin2DAO adminDAO;
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List<HashMap> getLectureList(Map map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.getLectureList(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int updateFile(Map map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.updateFile(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int lectureDel(Map map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.lectureDel(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int insertLecture(Map map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.insertLecture(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List<HashMap> getApplyList(Map map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.getApplyList(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List<HashMap> modLecture(Map map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.modLecture(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List<HashMap> selectCode(Map map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.selectCode(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int lectureMod(Map map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.lectureMod(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int statusUpdate(Map map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.statusUpdate(map);
	}


}

package com.ja.id.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ja.id.dao.MyLectureDAO;

@Component
@Transactional(readOnly = true)
public class MyLectureServiceImpl implements MyLectureService{
	
	@Autowired
	MyLectureDAO mylectureDAO;

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List<HashMap> getAllApplyCourse(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mylectureDAO.getAllApplyCourse(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List<HashMap> getAllCourse(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mylectureDAO.getAllCourse(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List<HashMap> getLecture(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mylectureDAO.getLectue(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List<HashMap> islexstudy(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mylectureDAO.islexstudy(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List<HashMap> lexstudy(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mylectureDAO.lexstudy(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int lexstudyinsert(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mylectureDAO.lexstudyinsert(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int lexstudyloginsert(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mylectureDAO.lexstudyloginsert(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int lexstudyupdate(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mylectureDAO.lexstudyupdate(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List<HashMap> getAllCnt(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mylectureDAO.getAllCnt(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List<HashMap> getCnt(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mylectureDAO.getCnt(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int applyCourseDelete(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mylectureDAO.applyCourseDelete(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List<HashMap> getHistory(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mylectureDAO.getHistory(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List<HashMap> selectTestpaper(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mylectureDAO.selectTestpaper(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List<HashMap> selectTestpool(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mylectureDAO.selectTestpool(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List<HashMap> testpoolList(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mylectureDAO.testpoolList(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int updateAnswer(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mylectureDAO.updateAnswer(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int submitTest(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mylectureDAO.submitTest(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List<HashMap> selectTestresult(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mylectureDAO.selectTestresult(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int insertTestresult(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mylectureDAO.insertTestresult(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int updateRest(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mylectureDAO.updateRest(map);
	}
	
}

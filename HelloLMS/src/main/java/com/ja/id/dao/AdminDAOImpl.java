package com.ja.id.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ja.id.mybatis.AdminMapper;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertCode(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.insertCode(map);
	}

	@Override
	public List<HashMap> selectCode(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectCode(map);
	}

	@Override
	public int deleteCode(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.deleteCode(map);
	}

	@Override
	public List<HashMap> selectCourse(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectCourse(map);
	}

	@Override
	public List<HashMap> selectTutor(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectTutor(map);
	}

	@Override
	public int insertCourse(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.insertCourse(map);
	}

	@Override
	public int updateCourse(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.updateCourse(map);
	}

	@Override
	public int deleteCourse(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.deleteCourse(map);
	}

	@Override
	public List<HashMap> selectTestpool(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectTestpool(map);
	}

	@Override
	public List<HashMap> selectLecture(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectLecture(map);
	}

	@Override
	public int updateTestpool(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.updateTestpool(map);
	}

	@Override
	public int insertTestpool(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.insertTestpool(map);
	}

	@Override
	public int deleteTestpool(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.deleteTestpool(map);
	}

	@Override
	public List<HashMap> selectQuiz(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectQuiz(map);
	}

	@Override
	public int insertQuiz(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.insertQuiz(map);
	}

	@Override
	public int deleteQuiz(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.deleteQuiz(map);
	}

	@Override
	public List<HashMap> selectTestpaper(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectTestpaper(map);
	}

	@Override
	public int updateTestpaper(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.updateTestpaper(map);
	}

	@Override
	public int insertTestpaper(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.insertTestpaper(map);
	}

	@Override
	public int deleteTestpaper(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.deleteTestpaper(map);
	}

	@Override
	public int insertTestanswer(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.insertTestanswer(map);
	}

	@Override
	public int selectCntTestresult(Map map) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectCntTestresult(map);
	}

	@Override
	public int deleteAllTestanswer(Map map) {
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.deleteAllTestanswer(map);
	}

	@Override
	public List<HashMap> selectTestMonitor(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectTestMonitor(map);
	}

	@Override
	public List<HashMap> selectTestApply(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectTestApply(map);
	}

	@Override
	public List<HashMap> selectTestresult(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectTestresult(map);
	}

	@Override
	public List<HashMap> popup(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.popup(map);
	}
	

	@Override
	public int updateScore1(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.updateScore1(map);
	}

	@Override
	public int updateScore2(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.updateScore2(map);
	}

	@Override
	public List<HashMap> selectResult(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectResult(map);
	}

	@Override
	public List<HashMap> selectAnswer(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectAnswer(map);
	}

	@Override
	public int addScore1(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.addScore1(map);
	}

	@Override
	public int selectSumScore(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectSumScore(map);
	}

	@Override
	public int addScore2(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.addScore2(map);
	}

	@Override
	public int updateScore3(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.updateScore3(map);
	}

	@Override
	public int updateScore4(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.updateScore4(map);
	}

	@Override
	public List<HashMap> selectGraph(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectGraph(map);
	}

	@Override
	public List<HashMap> selectGrade(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectGrade(map);
	}

	@Override
	public List<HashMap> selectProgress(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectProgress(map);
	}

	@Override
	public int updateOrder(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.updateOrder(map);
	}

	@Override
	public List<HashMap> selectBoardFaq(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.selectBoardFaq(map);
	}

	@Override
	public int getTotalFaq(Map map) {
		// TODO Auto-generated method stub
		AdminMapper mapper = sqlSession.getMapper(AdminMapper.class);
		return mapper.getTotalFaq(map);
	}


}

package com.ja.id.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ja.id.mybatis.Admin2Mapper;
import com.ja.id.mybatis.BoardMapper;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<HashMap> getAllNotice(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.getAllNotice(map);
	}
	
	@Override
	public int getAllNoticeCnt(Map map) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		return mapper.getAllNoticeCnt(map);
	}
	
	@Override
	public int writeNotice(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.writeNotice(map);
	}
	
	@Override
	public int writeNoticeFile(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.writeNoticeFile(map);
	}

	@Override
	public Map readNotice(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.readNotice(map);
	}
	
	@Override
	public List<HashMap> listinread(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.listinread(map);
	}
	
	@Override
	public int updateCnt(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.updateCnt(map);
	}

	@Override
	public int editNotice(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.editNotice(map);
	}

	@Override
	public int deleteNotice(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.deleteNotice(map);
	}
	
	@Override
	public int delNoticeFile(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.delNoticeFile(map);
	}
	
	@Override
	public int updateNoticeFile(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.updateNoticeFile(map);
	}
	
	@Override
	public int deleteNoticeFile(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.deleteNoticeFile(map);
	}
	
	@Override
	public List<HashMap> searchNotice(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.searchNotice(map);
	}
	
	@Override
	public int updateFile(Map map) {
		// TODO Auto-generated method stub
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		return mapper.updateFile(map);
	}
	
	/*@Override
	public List<HashMap> getAllQna(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.getAllQna(map);
	}*/

	@Override
	public int writeQna(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.writeQna(map);
	}
	
	@Override
	public int writeQnaFile(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.writeQnaFile(map);
	}
	
	@Override
	public List<HashMap> repCheck(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.repCheck(map);
	}
	
	@Override
	public List<HashMap> ad_repCheck(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.ad_repCheck(map);
	}
	
	@Override
	public int repCheckCnt(Map map) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		return mapper.repCheckCnt(map);
	}

	@Override
	public List<HashMap> searchQna(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.searchQna(map);
	}
	
	@Override
	public Map readQna(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.readQna(map);
	}
	
	@Override
	public int deleteQna(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.deleteQna(map);
	}
	
	@Override
	public int deleteQnaFile(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.deleteQnaFile(map);
	}
	
	@Override
	public int editQna(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.editQna(map);
	}
	
	@Override
	public int writeQnarep(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.writeQnarep(map);
	}
	
	@Override
	public Map tutor(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.tutor(map);
	}
	
	@Override
	public int writeComment(Map map) {
		// TODO Auto-generated method stub
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.writeComment(map);
	}

	@Override
	public List<HashMap> readComment(Map map) {
		// TODO Auto-generated method stub
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
	    return mapper.readComment(map);
	}
	
	@Override
	public int deleteComment(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.deleteComment(map);
	}

	@Override
	public int updateJoayo(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.updateJoayo(map);
	}

	@Override
	public int selectJoayo(Map map) {
		BoardMapper mapper=sqlSession.getMapper(BoardMapper.class);
		return mapper.selectJoayo(map);
	}

}

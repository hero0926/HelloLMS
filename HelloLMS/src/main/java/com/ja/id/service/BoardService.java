package com.ja.id.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface BoardService {
	
	public int writeNotice(Map map, HttpServletRequest req) throws Exception;
	
	public Map readNotice(Map map);
	
	//List<HashMap> listNotice(Map map);
	
	public List<HashMap> listinread(Map map);

	public List<HashMap> getAllNotice(Map map);

	public int updateCnt(Map map) throws Exception;

	int editNotice(Map map) throws Exception;
	
	public int delNoticeFile(Map map) throws Exception;
	
	public int deleteNotice(Map map) throws Exception;
		
	public List<HashMap> searchNotice(Map map);
	
	public int writeQna(Map map) throws Exception;

	/*List<HashMap> getAllQna(Map map);*/
	
	List<HashMap> repCheck(Map map);
	
	List<HashMap> ad_repCheck(Map map);
	
	public int repCheckCnt(Map map);
	
	public List<HashMap> searchQna(Map map);
	
	public Map readQna(Map map);
	
	public int deleteQna(Map map) throws Exception;
	
	public int writeQnarep(Map map) throws Exception;
	
	public int editQna(Map map) throws Exception;
	
	public Map tutor(Map map);
	
	public int writeComment(Map map);
	
	public List<HashMap> readComment(Map map);
	
	public int deleteComment(Map map) throws Exception;

	public int updateJoayo(Map map) throws Exception;
	
	public int selectJoayo(Map map);

	public int getAllNoticeCnt(Map map);
}

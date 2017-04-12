package com.ja.id.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BoardMapper {
	
	public List<HashMap> getAllNotice(Map map);
	
	public int getAllNoticeCnt(Map map);
	
	public List<HashMap> searchNotice(Map map);
	
	public int writeNotice(Map map);
	
	public int writeNoticeFile(Map map);

	public Map readNotice(Map map);
	
	public int deleteNotice(Map map);
	
	public int updateCnt(Map map);
	
	public List<HashMap> listinread(Map map);

	public int editNotice(Map map);
	
	public int deleteNoticeFile(Map map);
	
	public int delNoticeFile(Map map);
	
	public int updateNoticeFile(Map map);
	
	/*public List<HashMap> getAllQna(Map map);*/
	
	public int writeQna(Map map);
	
	public int writeQnaFile(Map map);
	
	public List<HashMap> repCheck(Map map);
	
	public List<HashMap> ad_repCheck(Map map);
	
	public int repCheckCnt(Map map);
	
	public Map readQna(Map map);
	
	public int deleteQna(Map map);
	
	public int deleteQnaFile(Map map);
	
	public int editQna(Map map);
	
	public int writeQnarep(Map map);
	
	public List<HashMap> searchQna(Map map);
	
	public int updateFile(Map map);
	
	public Map tutor(Map map);
	
	public int writeComment(Map map);

	public List<HashMap> readComment(Map map);
	
	public int deleteComment(Map map);
	
	public int updateJoayo(Map map);
	
	public int selectJoayo(Map map);

	
	
}

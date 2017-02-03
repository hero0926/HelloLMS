package com.ja.id.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BoardService {
	
	public int writeNotice(Map map) throws Exception;

	public Map readNotice(Map map);

	//List<HashMap> listNotice(Map map);

	public List<HashMap> getAllNotice(Map map);

	public int updateCnt(Map map) throws Exception;

	int editNotice(Map map) throws Exception;
	
	public int deleteNotice(Map map);

	public int writeQna(Map map) throws Exception;

	List<HashMap> getAllQna(Map map);
	
	List<HashMap> repCheck(Map map);
	
	public Map readQna(Map map);
	
	public int writeQnarep(Map map) throws Exception;
	
	
}

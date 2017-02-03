package com.ja.id.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BoardMapper {
	
	public List<HashMap> getAllNotice(Map map);
	
	public int writeNotice(Map map);

	public Map readNotice(Map map);

	public int updateCnt(Map map);

	public int editNotice(Map map);
	
	public int deleteNotice(Map map);
	
	public List<HashMap> getAllQna(Map map);
	
	public int writeQna(Map map);
	
	public List<HashMap> repCheck(Map map);
	
	public Map readQna(Map map);
	
	public int writeQnarep(Map map);
	
}

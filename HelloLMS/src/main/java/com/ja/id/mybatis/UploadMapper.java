package com.ja.id.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface UploadMapper {
	
	public void insertad(Map map)throws Exception;

	public List<HashMap> selectad(Map map);

}

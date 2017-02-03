package com.ja.id.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface UploadDAO {
	
	public void updatead(Map map) throws Exception;

	public List<HashMap> selectad(Map map);

}

package com.ja.id.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface UploadService {
	
	public void updatead(Map map) throws Exception;

	public List<HashMap> selectad(Map map);

}

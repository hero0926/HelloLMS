package com.ja.id.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface CodeService {

	public int insertCode(Map map) throws Exception;

	public List<HashMap> selectCode(Map map);

}

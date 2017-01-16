package com.ja.id.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface CodeDAO {

	public int insertCode(Map map);

	public List<HashMap> selectCode(Map map);

	public int deleteCode(Map map);

}

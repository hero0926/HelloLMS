package com.ja.id.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface CodeMapper {

	public int insertCode(Map map);

	public List<HashMap> selectCode(Map map);

}

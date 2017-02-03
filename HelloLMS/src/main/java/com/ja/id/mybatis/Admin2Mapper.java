package com.ja.id.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public interface Admin2Mapper {

	public List<HashMap> getLectureList(Map map);

	public int updateFile(Map map);

	public int lectureDel(Map map);

	public int insertLecture(Map map);

	public List<HashMap> getApplyList(Map map);

	public List<HashMap> modLecture(Map map);

	public List<HashMap> selectCode(Map map);

	public int lectureMod(Map map);

	public int statusUpdate(Map map);

}

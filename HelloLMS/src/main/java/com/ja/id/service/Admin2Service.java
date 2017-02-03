package com.ja.id.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public interface Admin2Service {

	public List<HashMap> getLectureList(Map map) throws Exception;

	public int updateFile(Map map) throws Exception;

	public int lectureDel(Map map) throws Exception;

	public int insertLecture(Map map) throws Exception;

	public List<HashMap> getApplyList(Map map) throws Exception;

	public List<HashMap> modLecture(Map map) throws Exception;

	public List<HashMap> selectCode(Map map) throws Exception;

	public int lectureMod(Map map) throws Exception;

	public int statusUpdate(Map map) throws Exception;


}

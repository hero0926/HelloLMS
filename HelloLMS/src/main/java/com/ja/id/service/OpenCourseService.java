package com.ja.id.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface OpenCourseService {

	public List<HashMap> openCourseList(Map map) throws Exception;

	public List<HashMap> openLectureList(Map map) throws Exception;

	public List<HashMap> getLecture(Map map) throws Exception;

}

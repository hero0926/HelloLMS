package com.ja.id.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface AdminMemberService {
	
	public List<HashMap> selectMember(Map map);

	public int deleteMember(Map map);

	public int updateMemberT(Map map);
	
	public List<HashMap> updateM(Map map);
	

}

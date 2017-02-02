package com.ja.id.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface AdminMemberDAO {
	
	public List<HashMap> selectMember(Map map);

	public int deleteMember(Map map);

	public int updateMemberT(Map map);


}

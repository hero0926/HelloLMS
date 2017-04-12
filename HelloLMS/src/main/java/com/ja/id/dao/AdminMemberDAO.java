package com.ja.id.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface AdminMemberDAO {
	
	public List<HashMap> selectMember(Map map);

	public int deleteMember(Map map);

	public int updateMemberT(Map map);

	public List<HashMap> updateM(Map map);

	public int insertMemberT(Map map);
	public int deleteT(Map map);

	public int updateMemberS(Map map);

	public List<HashMap> loginHistory(Map map);

}

package com.ja.id.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ja.id.domain.MemberVO;
import com.ja.id.dto.LoginDTO;

public interface MemberDAO {

	public void insertMember(MemberVO vo);
	
	public MemberVO login(LoginDTO dto) throws Exception;	

	public void update(MemberVO vo) throws Exception;
	
	public void deleteMember(String mxid) throws Exception;
	
	public String id(String mxname, String mxmail);
	
	public int chkDupId(MemberVO vo);
	
	public int pw(String mxid, String mxname, String mxmail);
	public void pwupdate(String pw, String mxid);
	
	public List<HashMap> selectMain();

	public int loginHis(Map map);

}

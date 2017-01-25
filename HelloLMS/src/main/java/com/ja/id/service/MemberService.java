package com.ja.id.service;

import java.util.Map;

import com.ja.id.domain.MemberVO;
import com.ja.id.dto.LoginDTO;

public interface MemberService {
	
	public void insertMember(MemberVO vo);
	
	public MemberVO login(LoginDTO dto) throws Exception;	

	public void update(MemberVO vo) throws Exception;
	
	public void deleteMember(String mxid) throws Exception;
	
	public String id(String mxname, String mxmail);

}

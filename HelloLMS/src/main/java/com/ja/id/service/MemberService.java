package com.ja.id.service;

import java.util.Map;

import com.ja.id.domain.MemberVO;
import com.ja.id.dto.LoginDTO;

public interface MemberService {
	
	public int insertMember(Map map) throws Exception;
	
	public MemberVO login(LoginDTO dto) throws Exception;

}

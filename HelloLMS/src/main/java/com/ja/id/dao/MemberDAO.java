package com.ja.id.dao;

import java.util.Map;

import com.ja.id.domain.MemberVO;
import com.ja.id.dto.LoginDTO;

public interface MemberDAO {
	
	public int insertMember(Map map);
	
	public MemberVO login(LoginDTO dto) throws Exception;

}

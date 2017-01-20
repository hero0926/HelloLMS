package com.ja.id.mybatis;

import java.util.Map;

import com.ja.id.domain.MemberVO;
import com.ja.id.dto.LoginDTO;

public interface MemberMapper {
	
	public int insertMember(Map map);
	
	public MemberVO login(LoginDTO dto);
}

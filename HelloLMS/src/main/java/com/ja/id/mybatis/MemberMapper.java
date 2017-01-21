package com.ja.id.mybatis;

import java.util.Map;

import com.ja.id.domain.MemberVO;
import com.ja.id.dto.LoginDTO;

public interface MemberMapper {
	
	public void insertMember(MemberVO vo);
	
	public MemberVO login(LoginDTO dto);
}

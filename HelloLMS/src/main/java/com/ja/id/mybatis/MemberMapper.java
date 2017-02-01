package com.ja.id.mybatis;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ja.id.domain.MemberVO;
import com.ja.id.dto.LoginDTO;

public interface MemberMapper {
	
	public void insertMember(MemberVO vo);
	
	public MemberVO login(LoginDTO dto);
	
	public void updateMember(MemberVO vo);
	
	public void deleteMember(String mxid) throws Exception;
	
	public String id(@Param("mxname")String mxname, @Param("mxmail")String mxmail);

	public int chkDupId(MemberVO vo);
	
	public int pw(@Param("mxid")String mxid, @Param("mxname")String mxname, @Param("mxmail")String mxmail );

	public void pwupdate(@Param("pw")String pw, @Param("mxid")String mxid);
}

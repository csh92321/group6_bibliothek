package com.care.root.member.service;

import java.sql.Date;

import com.care.root.member.dto.MemberDTO;

public interface MemberService {
	
	public int userCheck(String id, String pwd);
	public int register(MemberDTO dto);
	public void keepLogin(String sessionId, Date limitDate, String id);
	public MemberDTO getUserSessionId(String sessionId);
	
	public int idCheck(String id);
	public int emailCheck(String email);
	public int phoneCheck(String phone);
}

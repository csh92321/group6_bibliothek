package com.care.root.member.service;

import javax.servlet.http.HttpServletResponse;

import com.care.root.member.dto.MemberDTO;

public interface MemberService {
	
	public int userCheck(String id, String pwd);
	public int register(MemberDTO dto);
	
	public int idCheck(String id);
}

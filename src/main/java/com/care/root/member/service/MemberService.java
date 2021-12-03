package com.care.root.member.service;

import com.care.root.member.dto.MemberDTO;

public interface MemberService {
	
	public int userCheck(String id, String pwd);
	public int register(MemberDTO dto);
}

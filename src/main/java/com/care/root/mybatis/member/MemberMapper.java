package com.care.root.mybatis.member;

import org.springframework.stereotype.Repository;

import com.care.root.member.dto.MemberDTO;

@Repository
public interface MemberMapper {

	public MemberDTO userCheck(String id);
	public int register(MemberDTO dto);
	public int idCheck(String id);
}

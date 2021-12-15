package com.care.root.mybatis.member;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.care.root.member.dto.DeleteReasonDTO;
import com.care.root.member.dto.MemberDTO;

@Repository
public interface MemberMapper {

	public MemberDTO userCheck(String id);
	public int register(MemberDTO dto);
	public void keepLogin(Map<String,Object> map);
	public MemberDTO getUserSessionId(String sessionId);
	
	public int idCheck(String id);
	public int emailCheck(String email);
	public int phoneCheck(String phone);
	
	public MemberDTO memberInfo(String id);
	
	public int modify(MemberDTO dto);
	
	public int delete(String id);
	public int deleteReasonCheck(DeleteReasonDTO dr_dto);
}

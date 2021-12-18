package com.care.root.member.service;

import java.sql.Date;

import org.springframework.ui.Model;

import com.care.root.member.dto.DeleteReasonDTO;
import com.care.root.member.dto.MemberDTO;

public interface MemberService {
	
	public int userCheck(String id, String pwd);
	public int register(MemberDTO dto);
	public void keepLogin(String sessionId, Date limitDate, String id);
	public MemberDTO getUserSessionId(String sessionId);
	
	public int idCheck(String id);
	public int emailCheck(String email);
	public int phoneCheck(String phone);
	
	public void getMemberData(Model model,String id);
	
	public int modify(MemberDTO dto);
	
	public int delete(String id);
	
	public int deleteReasonCheck(DeleteReasonDTO dr_dto);
	
	public MemberDTO findId(MemberDTO dto);
}

package com.care.root.member.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.root.member.dto.MemberDTO;
import com.care.root.mybatis.member.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired MemberMapper mapper;
	
	@Override
	public int userCheck(String id, String pwd) {
		MemberDTO dto = mapper.userCheck(id);
		if (dto!=null) {	//아이디 값이 존재한다면
			if(pwd.equals(dto.getPwd())) {	//비밀번호가 동일하다면
				return 1;	//로그인 성공	
			}
		}
		return 0;	//로그인 실패
	}

	@Override
	public int register(MemberDTO dto) {
		int result=0;
		try {
			result=mapper.register(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int idCheck(String id) {
		return mapper.idCheck(id);
	}

}

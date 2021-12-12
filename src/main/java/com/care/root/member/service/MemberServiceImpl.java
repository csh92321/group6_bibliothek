package com.care.root.member.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.care.root.member.dto.MemberDTO;
import com.care.root.mybatis.member.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired MemberMapper mapper;
	BCryptPasswordEncoder encoder;	//비밀번호 암호화
	
	public MemberServiceImpl() {
		encoder = new BCryptPasswordEncoder();
	}
	
	@Override
	public int userCheck(String id, String pwd) {
		MemberDTO dto = mapper.userCheck(id);
		if (dto!=null) {	//아이디 값이 존재한다면
			if(pwd.equals(dto.getPwd()) || encoder.matches(pwd, dto.getPwd())) {	//비밀번호가 동일하다면
				return 1;	//로그인 성공	
			}
		}
		return 0;	//로그인 실패
	}

	@Override
	public int register(MemberDTO dto) {
		//비밀번호 암호화
		String securePwd = encoder.encode(dto.getPwd());
		dto.setPwd(securePwd);
		
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

	@Override
	public int emailCheck(String email) {
		return mapper.emailCheck(email);
	}

	@Override
	public int phoneCheck(String phone) {
		return mapper.phoneCheck(phone);
	}

	@Override
	public void keepLogin(String sessionId, Date limitDate, String id) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("sessionId", sessionId);
		map.put("limitDate", limitDate);
		map.put("id", id);
		mapper.keepLogin(map);	
	}

	@Override
	public MemberDTO getUserSessionId(String sessionId) {
		return mapper.getUserSessionId(sessionId);
	}

}

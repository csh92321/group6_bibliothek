package com.care.root.member.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.member.dto.DeleteReasonDTO;
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

	@Override
	public void getMemberData(Model model,String id) {
		model.addAttribute("member",mapper.memberInfo(id));
		
	}

	@Override
	public int modify(MemberDTO dto) {
		//비밀번호 암호화
				String securePwd = encoder.encode(dto.getPwd());
				dto.setPwd(securePwd);
				
				int result=0;
				try {
					result=mapper.modify(dto);
				} catch (Exception e) {
					e.printStackTrace();
				}
				return result;
	}

	@Override
	public int delete(String id) {
		int result=0;
		try {
			result=mapper.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteReasonCheck(DeleteReasonDTO dr_dto) {
		int result=0;
		try {
			result=mapper.deleteReasonCheck(dr_dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public MemberDTO findId(MemberDTO dto) {
		return mapper.findId(dto);
	}

	@Override
	public void sendEmail(MemberDTO dto, String div) {
		//Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "lilyjilyhily@gmail.com";
		String hostSMTPpwd = "ljhljhljh1!";
		
		//보내는 사람 Email, 제목, 내용
		String formEmail = "lilyjilyhily@gmail.com";
		String formName = "Bi6ilothek";
		String subject="";
		String msg="";
		
		if(div.equals("findPwd")) {
			subject="Bi6ilothek 임시 비밀번호";
			msg +="<div align='center', style='border:1px solid black; font-family:verdana;'>";
			msg += "<h3 style='color:blue;'>";
			msg += dto.getId() + "님의 임시 비밀번호 입니다. </h3> 로그인 성공 후 반드시 비밀번호를 변경하여 사용해주세요";
			msg += "<p>임시 비밀번호 : ";
			msg += dto.getPwd() + "</p></div>";
		}
		
		//받는 사람 Email 주소
		String mail = dto.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465);
			
			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(formEmail, formName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일 발송 실패 : ");
			e.printStackTrace();
		}
		
	}

	@Override
	public int findPwd(MemberDTO dto) throws Exception {	//비밀번호 찾기
		int result=0;
		
		//resp.setContentType("text/html; charset=utf-8");
		MemberDTO result_dto = mapper.userCheck(dto.getId());
		//PrintWriter out = resp.getWriter();
		
		if(mapper.idCheck(dto.getId())==0) {	//가입된 아이디가 없으면
			result=0;
			return result;
		} else if (mapper.emailCheck(dto.getEmail())==0) {	//가입된 이메일이 없으면
			result=-1;
			return result;
		} else {	
			String pwd = "";
			for (int i=0; i<12; i++) {
				pwd += (char)((Math.random()*26)+97);
			}
			result_dto.setPwd(pwd);
			mapper.updatePwd(result_dto);
			
			sendEmail(result_dto,"findPwd");
	
			result=1;
			return result;
		}
		
	}
	
}

package com.care.root.member.controller;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.root.common.MemberSessionName;
import com.care.root.member.dto.MemberDTO;
import com.care.root.member.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController implements MemberSessionName{

	@Autowired MemberService ms;
	
	@GetMapping("/login")
	public String login() {
		System.out.println("member/login 페이지 연결");
		return "member/login";
	}
	
	@PostMapping("/user_check")
	public String userCheck(@RequestParam String id, @RequestParam String pwd, @RequestParam(required=false) String autoLogin,
							@RequestParam(required=false) String saveId, RedirectAttributes rs) {
		System.out.println("member/user_check 로그인 확인");
		int result = ms.userCheck(id,pwd);
		if (result==1) {
			System.out.println("로그인 성공");
			rs.addAttribute("id",id);
			rs.addAttribute("autoLogin", autoLogin);
			//rs.addAttribute("saveId", saveId);
			return "redirect:successLogin";
		} else {
			System.out.println("로그인 실패");
			return "redirect:login";
		}
	}
	
	@GetMapping("/successLogin")
	public String successLogin(@RequestParam String id, @RequestParam(required=false) String autoLogin, HttpSession session, HttpServletResponse response) {
		session.setAttribute(LOGIN, id);
		
		if(autoLogin!=null) {	//사용자가 자동로그인 체크
			int limitTime = 60*60*24*90;	//90일
			Cookie loginCookie = new Cookie("loginCookie",session.getId());
			loginCookie.setPath("/");
			loginCookie.setMaxAge(limitTime);
			response.addCookie(loginCookie);
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			cal.add(Calendar.MONTH, 3);
			java.sql.Date limitDate = new java.sql.Date(cal.getTimeInMillis());
			
			ms.keepLogin(session.getId(), limitDate, id);	//DB로 연결
		}
		return "member/successLogin";
	}
	
	@GetMapping("register_form")
	public String registerForm() {
		System.out.println("회원가입 페이지 연결");
		return "member/register";
	}
	
	@PostMapping("register")
	public String register(MemberDTO dto){
		int result=ms.register(dto);
		if(result==1) {
			System.out.println("회원가입 성공");
			return "redirect:login";
		}
		return "Redirect:register_form";
	}

	@PostMapping("idCheck")
	@ResponseBody
	public int idCheck(@RequestParam(value="id", required=false) String id){
		int cnt=0;
		if(id!=null) {
			cnt=ms.idCheck(id);
		}
		return cnt;
	}
	
	@PostMapping("emailCheck")
	@ResponseBody
	public int emailCheck(@RequestParam(value="email", required=false) String email) {
		int cnt=0;
		if(email!=null) {
			cnt=ms.emailCheck(email);
		}
		return cnt;
	}
	
	@PostMapping("phoneCheck")
	@ResponseBody
	public int phoneCheck(@RequestParam(value="phone", required=false) String phone) {
		int cnt=0;
		if(phone!=null) {
			cnt=ms.phoneCheck(phone);
		}
		return cnt;
	}
}

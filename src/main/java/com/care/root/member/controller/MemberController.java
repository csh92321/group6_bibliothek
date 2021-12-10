package com.care.root.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.root.member.dto.MemberDTO;
import com.care.root.member.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {

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
			rs.addAttribute("saveId", saveId);
			return "redirect:successLogin";
		} else {
			System.out.println("로그인 실패");
			return "redirect:login";
		}
	}
	
	@GetMapping("register_form")
	public String registerForm() {
		System.out.println("회원가입 페이지 연결");
		return "member/register";
	}
	
	@PostMapping("register")
	public String register(MemberDTO dto,HttpServletResponse response) throws IOException {
		int result=ms.register(dto);
		if(result==1) {
			return "redirect:login";
		}
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('회원가입 실패');</script>");
		out.flush();
		return "redirect:register_form";
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
}

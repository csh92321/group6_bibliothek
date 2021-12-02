package com.care.root.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
}

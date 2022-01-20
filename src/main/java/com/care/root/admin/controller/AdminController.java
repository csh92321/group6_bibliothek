package com.care.root.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.root.common.MemberSessionName;

@Controller
@RequestMapping("/admin")
public class AdminController implements MemberSessionName {
	
	@GetMapping("adminPage")
	public String adminSuccessLogin(HttpSession session) {
		System.out.println("관리자 페이지 진입");
		System.out.println(session.getAttribute(LOGIN));
		if (session.getAttribute(LOGIN)==null) {
			return "admin/wrongApproach";
		}
		else if (session.getAttribute(LOGIN).equals("group6")) {
			return "admin/adminPage"; 
		} else {
			return "admin/wrongApproach";
		}
	}
}

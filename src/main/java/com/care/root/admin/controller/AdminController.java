package com.care.root.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.root.admin.service.AdminService;
import com.care.root.common.MemberSessionName;

@Controller
@RequestMapping("/admin")
public class AdminController implements MemberSessionName {
	
	@Autowired AdminService as;
	
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
	
	@GetMapping("PBlistAll")
	public String pbListAll(Model model, @RequestParam(required=false, defaultValue="1") int num) {
		as.pbListAll(model,num);
		return "admin/PBlistAll";
	}
}

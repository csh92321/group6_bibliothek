package com.care.root.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.root.admin.service.AdminService;
import com.care.root.common.MemberSessionName;
import com.care.root.personalBoard.dto.PersonalBoardDTO;

@Controller
@RequestMapping("/admin")
public class AdminController implements MemberSessionName {
	
	@Autowired AdminService as;
	
	@GetMapping("adminPage")
	public String adminSuccessLogin(HttpSession session) {
		System.out.println("관리자 페이지 진입");
		return "admin/adminPage"; 
	}
	
	@GetMapping("PBlistAll")
	public String pbListAll(Model model, @RequestParam(required=false, defaultValue="1") int num) {
		as.pbListAll(model,num);
		return "admin/PBlistAll";
	}
	
	@GetMapping("PBView")
	public String pbView(Model model, @RequestParam int writeNum) {
		as.pbView(model,writeNum);
		return "admin/PBview";
	}
	
	@PostMapping("reply")
	public String reply(PersonalBoardDTO dto) {
		System.out.println("reply컨트롤러 체크");
		System.out.println(dto.getReply());
		System.out.println(dto.getWriteNum());
		int result=as.reply(dto);
		if(result==1) {
			System.out.println("1:1문의 답변 성공");
			return "redirect:PBView?writeNum="+dto.getWriteNum();
		}
		return "redirect:PBlistAll";
	}
}

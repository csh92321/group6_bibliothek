package com.care.root.personalBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.root.personalBoard.dto.PersonalBoardDTO;
import com.care.root.personalBoard.service.PersonalBoardService;

@Controller
@RequestMapping("personalBoard")
public class PersonalBoardController {

	@Autowired PersonalBoardService pbs;
	
	@GetMapping("PBlist")
	public String list(@RequestParam String id, Model model) {
		pbs.pbList(model,id);
		model.addAttribute("id", id);
		return "personalBoard/PBlist";
	}
	
	@GetMapping("PBform")
	public String form(@RequestParam String id, Model model) {
		model.addAttribute("id", id);
		return "personalBoard/PBform";
	}
	
	@PostMapping("save")
	public String save(PersonalBoardDTO dto) {
		int result=pbs.save(dto);
		if(result==1) {
			System.out.println("1:1문의 등록 성공");
			return "redirect:PBlist?id="+dto.getId();
		}
		return "redirect:PBform";
	}
	
	@GetMapping("PBview")
	public String view(@RequestParam int writeNum, Model model) {
		pbs.pbView(model,writeNum);
		return "personalBoard/PBview";
	}
}

package com.care.root.ntboard.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.root.ntboard.DTO.NtBoardDTO;
import com.care.root.ntboard.service.NtBoardService;

@Controller
@RequestMapping("ntboard")
public class NtBoardController {

	@Autowired
	NtBoardService ns;
	
	@GetMapping("ntBoardWriteForm")
	public String ntBoardWriteForm() {
		return "ntboard/ntBoardWriteForm";
	}
	@GetMapping("ntBoardList")
	public String ntBoardList(Model model) {
		ns.ntAllList(model);
		return "ntboard/ntBoardList";
	}
	@PostMapping("ntWriteSave")
	public String ntWriteSave(NtBoardDTO dto) {
		
		int result = ns.ntWriteSave(dto);
		if(result==1) {
			System.out.println("글 작성 성공");			
		return "redirect:ntBoardList";
		}
		System.out.println("글 작성 실패");
		return "redirect:ntBoardWriteForm";
	}
	@GetMapping("ntBoardContentView")
	public String ntBoardContentView(@RequestParam int ntWriteNo, Model model) {
		ns.ntBoardContentView(ntWriteNo, model);
		return "ntboard/ntBoardContentView";
	}
	// test 중
	@GetMapping("delete")
	public String ntBoardDelete(@RequestParam("writeNo") int write_no,
				HttpServletResponse response,
				HttpServletRequest request) throws Exception{
		
		String message = ns.ntBoardDelete(write_no, request);
		
		PrintWriter out = null;
		response.setContentType("text/html; charset=utf-8");
		out = response.getWriter();
		out.println(message);
		
		return "redirect:ntBoardList";
	}

}

package com.care.root.board.controller;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.board.DTO.BoardDTO;
import com.care.root.board.service.BoardService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@Autowired
	BoardService bs;
	
	@GetMapping("writeForm")
	public String writeForm() {
		return "board/writeForm";
	}
	@GetMapping("boardList")
	public String boardList(Model model) {
		bs.allList(model); //이걸로 서비스에서 불러오는거
		return "board/boardList";
	} 
	@PostMapping("writeSave")
	public String writeSave(BoardDTO dto) {

		int result=bs.writeSave(dto);
		if(result==1) {
			System.out.println("글 작성 성공");
			return "redirect:boardList";
		}
		System.out.println("글 작성 실패");
		return "redirect:writeForm"; 
	}

	@GetMapping("contentView")
	public String contentView(@RequestParam int writeNo, Model model) {
				// @RequestParam int wrtieNo : 유일값을 전달받아오기 위해서, Model : DB에서 전달받은 값을 jsp페이지에 보여주기 위해
		bs.contentView(writeNo,model);
		return "board/contentView";
	}
	// test
	@GetMapping("delete")
	public String boardDelete(@RequestParam("writeNo") int write_no,
				HttpServletResponse response,
				HttpServletRequest request) throws Exception{
		String message = bs.boardDelete(write_no, request);
		
		PrintWriter out = null;
		response.setContentType("text/html; charset=utf-8");
		out = response.getWriter();
		out.println(message);
		
		return "redirect:boardList";
	}
	@GetMapping("modify_form")
	public String modify_form(@RequestParam int writeNo, Model model) {
		//bs.getData(writeNo, model);
		bs.contentView(writeNo, model);
		return "board/modify_form";
	}
//	@PostMapping("modify")
//	public void modify(MultipartHttpServletRequest mul,
//						HttpServletResponse response,
//						HttpServletRequest request) throws IOException{
//		String message = bs.modify(mul, request);
//		
//		PrintWriter out = null;
//		response.setContentType("text:html; charset=utf-8");
//		out = response.getWriter();
//		out.println(message);
//	}
	
	@PostMapping("modify")
	public String modify(BoardDTO dto) {
		System.out.println("dto.getWriteNo : " + dto.getWriteNo());
		int result = bs.modify(dto);
		if (result==1) {
			return "redirect:boardList";
		} else {
			return "board/modify_form";
		}
	}
}

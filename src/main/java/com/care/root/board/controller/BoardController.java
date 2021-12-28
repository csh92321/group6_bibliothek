package com.care.root.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.root.board.DTO.BoardDTO;
import com.care.root.board.service.BoardService;

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
	// 여기까지 이용자가 사용하는 랜선모임 게시판 

}

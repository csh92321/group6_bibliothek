package com.care.root.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board")
public class BoardController {
	@GetMapping("boardAllList")
	public String selectAllBoardList() {
		return "board/boardAllList";
	}
	@GetMapping("contentList")
	public String selectAllContentList() {
		return "board/contentList";
	}
}

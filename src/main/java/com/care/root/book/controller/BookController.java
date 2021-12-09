package com.care.root.book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.root.book.dto.BookDTO;
import com.care.root.book.service.BookService;

@Controller
public class BookController {
	
	@Autowired BookService book;

	@RequestMapping("novel")
	public String novel(BookDTO dto) {
		for (int i=1;i<=3;i++) {
			String.valueOf(i);
			book.bookList("L00"+i);
		}
		return "book/novel";
	}
	
	@RequestMapping("poem")
	public String poem() {
		return "book/poem";
	}
	
	@RequestMapping("essay")
	public String essay() {
		return "book/essay";
	}
	


}

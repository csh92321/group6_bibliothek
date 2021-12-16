package com.care.root.book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.root.book.dto.BookDTO;
import com.care.root.book.dto.BookGenre;
import com.care.root.book.service.BookService;

@Controller
public class BookController {
	
	@Autowired BookService book;


	@RequestMapping("novel")
	public String novel(BookDTO dto) {
		String genre = "LF" ;
		try {
			BookGenre.genre = genre;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "book/novel";
	}
	
	@RequestMapping("poem")
	public String poem() {
		String genre = "LP" ;
		try {
			BookGenre.genre = genre;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "book/poem";
	}
	
	@RequestMapping("essay")
	public String essay() {
		String genre = "LA" ;
		try {
			BookGenre.genre = genre;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "book/essay";
	}
	
	@RequestMapping("search")
	public String search() {
		
		return "book/search";
	}


}

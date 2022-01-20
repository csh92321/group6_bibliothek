package com.care.root.book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.root.book.dto.BookDTO;
import com.care.root.book.service.BookService;

@Controller
public class BookController {
	
	@Autowired BookService book;


	@RequestMapping("book")
	public String novel(BookDTO dto) {
		return "book/book";
	}
	
	@RequestMapping("poem")
	public String poem() {
		return "book/poem";
	}
	
	@RequestMapping("essay")
	public String essay() {
		return "book/essay";
	}
	
	@RequestMapping("search")
	public String search() {
		
		return "book/search";
	}
	
	@RequestMapping("detail")
	public String detail() {
		
		return "book/detail";
	}
	
	@RequestMapping("bestSeller")
	public String bestSeller() {
		
		return "book/bestSeller";
	}
	
	@RequestMapping("newBook")
	public String newBook() {
		
		return "book/newBook";
	}
	
	@RequestMapping("recommend")
	public String recommend() {
		
		return "book/recommend";
	}
	
	@RequestMapping("eBook")
	public String eBook() {
		
		return "book/eBook";
	}


}

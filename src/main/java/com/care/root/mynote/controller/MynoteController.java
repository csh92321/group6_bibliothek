package com.care.root.mynote.controller;

import java.util.ArrayList;
import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.root.book.dto.BookDTO;
import com.care.root.book.service.BookServiceImpl;
import com.care.root.mynote.service.MynoteService;

@Controller
@RequestMapping("myNote")
public class MynoteController {

	@Autowired MynoteService ms;
	
	@GetMapping("mynote")
	public String myNote() {
		return "mynote/mynote";
	}
	
	@GetMapping("writeNote")
	public String writeNote() {
		return "mynote/writeNote";
	}
	
	@GetMapping("bookSearch")
	public String bookSearch() {
		return "mynote/bookSearch";
	}
	
	@PostMapping("search")
	@ResponseBody
	public ArrayList<BookDTO>search(@RequestParam(value = "search", required = false) String search) {
		
		return ms.search(search);
	}
		
}

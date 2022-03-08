package com.care.root.mynote.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.root.book.dto.BookDTO;
import com.care.root.mynote.dto.MynoteDTO;
import com.care.root.mynote.service.MynoteService;

@Controller
@RequestMapping("myNote")
public class MynoteController {

	@Autowired MynoteService ms;
	
	@GetMapping("mynote")
	public String myNote(String id, Model model) {
		ms.mnList(model,id);
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
	
	@PostMapping("writeNote")
	public String writeNote(MynoteDTO dto) {
		System.out.println(dto.getBookNum());
		System.out.println(dto.getId());
		int result = ms.writeNote(dto);
		if(result==1) {
			System.out.println("작성 성공");
			return "redirect:mynote?id="+dto.getId();
		} 
			System.out.println("작성 실패");
			return "writeNote";
	}
	
}

package com.care.root.mynote.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
}

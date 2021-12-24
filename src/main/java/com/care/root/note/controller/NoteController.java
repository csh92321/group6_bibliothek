package com.care.root.note.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.root.note.service.NoteService;

@Controller
@RequestMapping("note")
public class NoteController {

	@Autowired NoteService ns;
	
	@GetMapping("note")
	public String list(@RequestParam String id, Model model) {
		ns.noteList_rec(model,id);
		ns.noteList_send(model,id);
		model.addAttribute("id",id);
		return "note/note";
	}
	
}

package com.care.root.note.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.root.common.MemberSessionName;
import com.care.root.note.dto.NoteDTO;
import com.care.root.note.service.NoteService;

@Controller
@RequestMapping("note")
public class NoteController implements MemberSessionName{

	@Autowired NoteService ns;
	
	@GetMapping("note")
	public String list(@RequestParam String id, Model model) {
		ns.noteList_rec(model,id);
		ns.noteList_send(model,id);
		model.addAttribute("id",id);
		return "note/note";
	}
	
	@PostMapping("noteMsg")
	public String msg(NoteDTO dto) {
		int result=ns.msg(dto);
		if(result==1) {
			System.out.println("쪽지 보내기 성공");
			return "redirect:note?id="+dto.getId();
		}
		return "redirect:note?id="+dto.getId();
		//수정필요
	}
	
	@GetMapping("noteView")
	public String view(@RequestParam int noteNum, Model model, HttpSession session) {
		System.out.println(noteNum);
		model.addAttribute("sessionId", session.getAttribute(LOGIN));
		ns.noteView(noteNum, model);
		return "note/noteView";
	}
	
	@GetMapping("noteReply")
	public String reply(@RequestParam int noteNum, Model model) {
		return "note/noteReply";
	}
}

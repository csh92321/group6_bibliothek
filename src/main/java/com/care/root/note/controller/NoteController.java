package com.care.root.note.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
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
	
//	@GetMapping("note")
//	public String list(@RequestParam String id, Model model) {
//		ns.noteList_rec(model,id);
//		ns.noteList_send(model,id);
//		model.addAttribute("id",id);
//		return "note/note";
//	}
	
	@GetMapping("note")
	public String note(@RequestParam String id, Model model) {
		ns.noteList_rec(model, id);
		ns.noteList_send(model, id);
		model.addAttribute("id", id);
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
		ns.noteView(noteNum, model,session);
		return "note/noteView";
	}
	
	@GetMapping("noteReply")
	public String reply(@RequestParam int noteNum ,Model model, HttpSession session) {
		model.addAttribute("sessionId", session.getAttribute(LOGIN));
		ns.noteView(noteNum, model,session);
		return "note/noteReply";
	}
	
	//@PostMapping(value="noteReplyMsg", produces="application/json; charset=utf-8")
	//@ResponseBody
	@PostMapping("noteReplyMsg")
	public void replyMsg(NoteDTO dto,HttpServletResponse response) throws Exception {
		int result = ns.msg(dto);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(result==1) {
			System.out.println("답장 쪽지 보내기 성공");
			out.println("<script>close()</script>");
		} else {
			out.println("<script>alert('답장 전송 실패')</script>");
		}
		out.flush();
	}
}

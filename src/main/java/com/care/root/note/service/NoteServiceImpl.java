package com.care.root.note.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.mybatis.note.NoteMapper;

@Service
public class NoteServiceImpl implements NoteService {

	@Autowired NoteMapper mapper;
	
	@Override
	public void noteList_rec(Model model, String id) {
		model.addAttribute("noteList_rec", mapper.noteList_rec(id));
	}


	@Override
	public void noteList_send(Model model, String id) {
		model.addAttribute("noteList_send",mapper.noteList_send(id));
	}

}

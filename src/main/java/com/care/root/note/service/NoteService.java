package com.care.root.note.service;

import org.springframework.ui.Model;

import com.care.root.note.dto.NoteDTO;

public interface NoteService {

	public void noteList_rec(Model model, String id);
	public void noteList_send(Model model, String id);
	public int msg(NoteDTO dto);
}

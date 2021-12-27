package com.care.root.note.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.mybatis.note.NoteMapper;
import com.care.root.note.dto.NoteDTO;

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

	@Override
	public int msg(NoteDTO dto) {
		int result=0;
		try {
			result=mapper.msg(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void noteView(int noteNum, Model model) {
		model.addAttribute("noteView",mapper.noteView(noteNum));
		readY(noteNum);
	}
	
	private void readY(int noteNum) {
		mapper.readY(noteNum);
	}

}

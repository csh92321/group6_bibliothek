package com.care.root.mynote.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.care.root.book.dto.BookDTO;
import com.care.root.mynote.dto.MynoteDTO;

public interface MynoteService {

	public ArrayList<BookDTO> search(String search);
	public int writeNote(MynoteDTO dto);
	public void mnList(Model model, String id);
	
}

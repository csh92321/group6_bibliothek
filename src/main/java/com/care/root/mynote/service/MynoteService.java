package com.care.root.mynote.service;

import java.util.ArrayList;

import com.care.root.book.dto.BookDTO;
import com.care.root.mynote.dto.MynoteDTO;

public interface MynoteService {

	public ArrayList<BookDTO> search(String search);
	public int writeNote(MynoteDTO dto);
}

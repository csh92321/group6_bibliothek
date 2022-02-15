package com.care.root.mynote.service;

import java.util.ArrayList;

import com.care.root.book.dto.BookDTO;

public interface MynoteService {

	public ArrayList<BookDTO> search(String search);
}

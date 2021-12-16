package com.care.root.book.service;

import java.util.ArrayList;

import com.care.root.book.dto.BookDTO;

public interface BookService {
	
	public void bookList(String bookNum);
	public ArrayList<BookDTO> novels();
	public ArrayList<BookDTO> poems();
	public ArrayList<BookDTO> essays();

}

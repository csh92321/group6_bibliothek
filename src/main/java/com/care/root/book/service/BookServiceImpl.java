package com.care.root.book.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.root.book.dto.BookDTO;
import com.care.root.mybatis.book.BookMapper;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired BookMapper mapper;
	
	public void bookList(String bookNum) {
		BookDTO dto = mapper.bookList(bookNum);
	}
	
	

}

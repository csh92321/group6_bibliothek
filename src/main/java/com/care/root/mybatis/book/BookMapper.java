package com.care.root.mybatis.book;

import org.springframework.stereotype.Repository;

import com.care.root.book.dto.BookDTO;

@Repository
public interface BookMapper {

	public BookDTO bookList(String bookNum);

}

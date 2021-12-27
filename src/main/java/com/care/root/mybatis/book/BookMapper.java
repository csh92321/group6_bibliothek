package com.care.root.mybatis.book;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.care.root.book.dto.BookDTO;

@Repository
public interface BookMapper {

	public BookDTO bookList(String bookNum);
	public ArrayList<BookDTO> bookSearch(String search);
	public BookDTO detail(String bookNum);
	public int hitPlus(@Param("bookNum")String bookNum, @Param("hit")int hit);
	public int hitLoad(String bookNum);
	public BookDTO getAll(String bookNum);
	public ArrayList<BookDTO> getHit(int num);

}

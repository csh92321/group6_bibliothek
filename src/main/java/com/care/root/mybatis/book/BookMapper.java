package com.care.root.mybatis.book;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.care.root.book.dto.BookDTO;
import com.care.root.book.dto.GenreDTO;
import com.care.root.book.service.BookServiceImpl.Book;

@Repository
public interface BookMapper {

	public ArrayList<BookDTO> bookList(String bookNum);
	public ArrayList<BookDTO> bookSearch(String search);
	public BookDTO detail(String bookNum);
	public int hitPlus(@Param("bookNum")String bookNum, @Param("hit")int hit);
	public int hitLoad(String bookNum);
	public BookDTO getAll(String bookNum);
	public ArrayList<BookDTO> getHit();
	public GenreDTO bookCode(String genre);
	public GenreDTO bookCodeKr(String genre);
	public ArrayList<GenreDTO> codeGenre(String code);
	public ArrayList<BookDTO> getAllBook();
	public BookDTO getRecommend(String bookNum);
	public int gradeUpdate(@Param("bookNum")String bookNum, @Param("gradeLevel")float gradeLevel);
	public int gradeLoad(String bookNum);

}

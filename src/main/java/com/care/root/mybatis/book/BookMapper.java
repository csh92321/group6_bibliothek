package com.care.root.mybatis.book;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.care.root.book.dto.BookDTO;
import com.care.root.book.dto.GenreDTO;
import com.care.root.book.dto.GradeDTO;
import com.care.root.book.dto.LikeDTO;

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
	public void gradePush(@Param("id")String id, @Param("bookNum")String bookNum, @Param("gradeLevel")int gradeLevel);	
	public ArrayList<Integer> gradeLoad(@Param("bookNum")String bookNum);
	public void gradeChange(@Param("id")String id, @Param("bookNum")String bookNum, @Param("gradeLevel")int gradeLevel);
	public GradeDTO gradeCheck(@Param("id")String id, @Param("bookNum")String bookNum);
	public double gradeOriginal(@Param("bookNum")String bookNum);
	public void gradeUpdate(@Param("bookNum")String bookNum, @Param("grade")double grade);
	public void likePush(@Param("id")String id, @Param("bookNum")String bookNum);
	public void likeCancel(@Param("id")String id, @Param("bookNum")String bookNum);
	public LikeDTO likeCheck(@Param("id")String id, @Param("bookNum")String bookNum);
	public ArrayList<String> recommendList();
	public void recommendPlus(@Param("bookNum")String bookNum);
	public void recommendDelete(@Param("bookNum")String bookNum);
	public int bookPlus(BookDTO dto);

}

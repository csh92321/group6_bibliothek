package com.care.root.book.dto;

import org.springframework.web.multipart.MultipartFile;

public class BookDTO {
	
	private String bookNum;
	private String title;
	private String subtitle;
	private String writer;
	private String company;
	private int hit;
	private double grade;
	private int likeCnt;
	private int totalPage;
	private String bookIntro;
	private String contentsTable;
	private String writerIntro;
	private MultipartFile coverImg;
	
	

	public MultipartFile getCoverImg() {
		return coverImg;
	}
	public void setCoverImg(MultipartFile coverImg) {
		this.coverImg = coverImg;
	}
	public String getBookIntro() {
		return bookIntro;
	}
	public void setBookIntro(String bookIntro) {
		this.bookIntro = bookIntro;
	}
	public String getContentsTable() {
		return contentsTable;
	}
	public void setContentsTable(String contentsTable) {
		this.contentsTable = contentsTable;
	}
	public String getWriterIntro() {
		return writerIntro;
	}
	public void setWriterIntro(String writerIntro) {
		this.writerIntro = writerIntro;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public String getBookNum() {
		return bookNum;
	}
	public void setBookNum(String bookNum) {
		this.bookNum = bookNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	

	
	
}

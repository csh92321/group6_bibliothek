package com.care.root.mynote.dto;

import java.sql.Date;

public class MynoteDTO {
	
	private int writeNum;
	private String id;
	private String bookNum;
	private String content;
	private Date savedate;
	private String readingPeriod;
	private int open;
	private int hit;
	
	public int getWriteNum() {
		return writeNum;
	}
	public void setWriteNum(int writeNum) {
		this.writeNum = writeNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBookNum() {
		return bookNum;
	}
	public void setBookNum(String bookNum) {
		this.bookNum = bookNum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getSavedate() {
		return savedate;
	}
	public void setSavedate(Date savedate) {
		this.savedate = savedate;
	}
	public String getReadingPeriod() {
		return readingPeriod;
	}
	public void setReadingPeriod(String readingPeriod) {
		this.readingPeriod = readingPeriod;
	}
	public int getOpen() {
		return open;
	}
	public void setOpen(int open) {
		this.open = open;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
}

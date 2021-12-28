package com.care.root.board.DTO;

import java.sql.Date;

public class BoardDTO {

	private String id;
	private int writeNo;
	private Date saveDate;
	private String title;
	private String content;
	private String mCnt;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getWriteNo() {
		return writeNo;
	}
	public void setWriteNo(int writeNo) {
		this.writeNo = writeNo;
	}
	public Date getSaveDate() {
		return saveDate;
	}
	public void setSaveDate(Date saveDate) {
		this.saveDate = saveDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getmCnt() {
		return mCnt;
	}
	public void setmCnt(String mCnt) {
		this.mCnt = mCnt;
	}
	
	
}

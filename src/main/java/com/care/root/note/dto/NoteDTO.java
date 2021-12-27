package com.care.root.note.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class NoteDTO {
	
	private String id;
	private String sender;
	private String receiver;
	private String content;
	private int noteNum;
	private int gubun;	//수신, 발신
	private String savedate;
	private int readYN;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getNoteNum() {
		return noteNum;
	}
	public void setNoteNum(int noteNum) {
		this.noteNum = noteNum;
	}
	public int getGubun() {
		return gubun;
	}
	public void setGubun(int gubun) {
		this.gubun = gubun;
	}
	public String getSavedate() {
		return savedate;
	}
	
	public void setSavedate(Timestamp savedate) {	//DB와 연동시 수정 필요 //java.sql.Timestamp
		SimpleDateFormat fo = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		this.savedate = fo.format(savedate);
	}
	
	public int getReadYN() {
		return readYN;
	}
	public void setReadYN(int readYN) {
		this.readYN = readYN;
	}
	
}

package adminQnA.dto;

import java.sql.Date;

public class QnaVO {
	
	private String id;
	private int writeNum;
	private String title;
	private String content;
	private Date savedate;
	private int replyCheck;
	private String reply;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getWriteNum() {
		return writeNum;
	}
	public void setWriteNum(int writeNum) {
		this.writeNum = writeNum;
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
	public Date getSavedate() {
		return savedate;
	}
	public void setSavedate(Date savedate) {
		this.savedate = savedate;
	}
	public int getReplyCheck() {
		return replyCheck;
	}
	public void setReplyCheck(int replyCheck) {
		this.replyCheck = replyCheck;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
}

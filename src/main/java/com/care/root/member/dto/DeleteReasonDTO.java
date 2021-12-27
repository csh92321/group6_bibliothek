package com.care.root.member.dto;

import java.sql.Date;

public class DeleteReasonDTO {

	private int expensive;
	private int nomoreRead;
	private int recentNotUse;
	private int otherSite;
	private int etc;
	private Date deletedate;
	private String total;
	private String id;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getExpensive() {
		return expensive;
	}
	public void setExpensive(int expensive) {
		this.expensive = expensive;
	}
	public int getNomoreRead() {
		return nomoreRead;
	}
	public void setNomoreRead(int nomoreRead) {
		this.nomoreRead = nomoreRead;
	}
	public int getRecentNotUse() {
		return recentNotUse;
	}
	public void setRecentNotUse(int recentNotUse) {
		this.recentNotUse = recentNotUse;
	}
	public int getOtherSite() {
		return otherSite;
	}
	public void setOtherSite(int otherSite) {
		this.otherSite = otherSite;
	}
	public int getEtc() {
		return etc;
	}
	public void setEtc(int etc) {
		this.etc = etc;
	}
	public Date getDeletedate() {
		return deletedate;
	}
	public void setDeletedate(Date deletedate) {
		this.deletedate = deletedate;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
}

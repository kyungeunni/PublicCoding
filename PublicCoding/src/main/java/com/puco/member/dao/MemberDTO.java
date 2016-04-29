package com.puco.member.dao;

import java.util.Date;

/*
 * DESC pucoMember;
 MNO                                       NOT NULL NUMBER
 MID                                       NOT NULL VARCHAR2(20)
 MPWD                                      NOT NULL VARCHAR2(20)
 MEMAIL                                    NOT NULL VARCHAR2(320)
 MIMAGEURL                                          VARCHAR2(400)
 MDATE                                              DATE
 MPOINT                                             NUMBER
 LNO                                                NUMBER
 */
public class MemberDTO {
	private int mno;
	private String mid;
	private String mpwd;
	private String memail;
	private String mimageURL;
	private int filesize;
	private Date mdate;
	private int mpoint;
	private int lno;
	private Date logindate;
	
	
	public Date getLogindate() {
		return logindate;
	}
	public void setLogindate(Date logindate) {
		this.logindate = logindate;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpwd() {
		return mpwd;
	}
	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMimageURL() {
		return mimageURL;
	}
	public void setMimageURL(String mimageURL) {
		this.mimageURL = mimageURL;
	}
	public Date getMdate() {
		return mdate;
	}
	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}
	public int getMpoint() {
		return mpoint;
	}
	public void setMpoint(int mpoint) {
		this.mpoint = mpoint;
	}
	public int getLno() {
		return lno;
	}
	public void setLno(int lno) {
		this.lno = lno;
	}
}

package com.puco.board.dao;

import java.util.Date;

public class FreeBoardVO {
	private int bno;
	private int mno;
	private String bsubject;
	private String bcontent;
	private int bhit;
	private Date bdate;
	private int bdel;
	private int btno;
	private String mpwd;
	private String userid;
	private String answer;
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getMpwd() {
		return mpwd;
	}
	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getBsubject() {
		return bsubject;
	}
	public void setBsubject(String bsubject) {
		this.bsubject = bsubject;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public int getBhit() {
		return bhit;
	}
	public void setBhit(int bhit) {
		this.bhit = bhit;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public int getBdel() {
		return bdel;
	}
	public void setBdel(int bdel) {
		this.bdel = bdel;
	}
	public int getBtno() {
		return btno;
	}
	public void setBtno(int btno) {
		this.btno = btno;
	}
	
	
}
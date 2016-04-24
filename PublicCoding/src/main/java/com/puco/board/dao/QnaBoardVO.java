package com.puco.board.dao;

import java.util.Date;

public class QnaBoardVO {
	private int bno;
	private int mno;
	private String bsubject;
	private String bcontent;
	private Date bdate;
	private int bhit;
	private int bvote;
	private int tgno1;
	private int tgno2;
	private int tgno3;
	private int btno;
	private int bdel;
	private String tag1;
	private String tag2;
	private String tag3;
	private String userid;
	private int answer;

	
	public int getAnswer() {
		return answer;
	}
	public void setAnswer(int answer) {
		this.answer = answer;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTag1() {
		return tag1;
	}
	public void setTag1(String tag1) {
		this.tag1 = tag1;
	}
	public String getTag2() {
		return tag2;
	}
	public void setTag2(String tag2) {
		this.tag2 = tag2;
	}
	public String getTag3() {
		return tag3;
	}
	public void setTag3(String tag3) {
		this.tag3 = tag3;
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
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public int getBhit() {
		return bhit;
	}
	public void setBhit(int bhit) {
		this.bhit = bhit;
	}
	public int getBvote() {
		return bvote;
	}
	public void setBvote(int bvote) {
		this.bvote = bvote;
	}
	public int getTgno1() {
		return tgno1;
	}
	public void setTgno1(int tgno1) {
		this.tgno1 = tgno1;
	}
	public int getTgno2() {
		return tgno2;
	}
	public void setTgno2(int tgno2) {
		this.tgno2 = tgno2;
	}
	public int getTgno3() {
		return tgno3;
	}
	public void setTgno3(int tgno3) {
		this.tgno3 = tgno3;
	}
	public int getBtno() {
		return btno;
	}
	public void setBtno(int btno) {
		this.btno = btno;
	}
	public int getBdel() {
		return bdel;
	}
	public void setBdel(int bdel) {
		this.bdel = bdel;
	}

	
	
}
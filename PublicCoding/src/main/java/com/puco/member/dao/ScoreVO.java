package com.puco.member.dao;

import java.util.*;
public class ScoreVO {

	 private int score;
	 private int mno;
	 private String message;
	 private Date sdate;
	public ScoreVO(int mno, int score, String message) {
		this.mno=mno;
		this.score=score;
		this.message=message;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	 
	 
}

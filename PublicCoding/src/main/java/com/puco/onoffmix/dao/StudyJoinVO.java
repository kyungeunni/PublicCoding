package com.puco.onoffmix.dao;

public class StudyJoinVO {
	private int rno;
	private int mno;
	private int meetno;
	private int res_check;
	private String meetdate;
	private String meettime;
	private int tno;
	
		public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
		public String getMeetdate() {
		return meetdate;
	}
	public void setMeetdate(String meetdate) {
		this.meetdate = meetdate;
	}
	public String getMeettime() {
		return meettime;
	}
	public void setMeettime(String meettime) {
		this.meettime = meettime;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getMeetno() {
		return meetno;
	}
	public void setMeetno(int meetno) {
		this.meetno = meetno;
	}
	public int getRes_check() {
		return res_check;
	}
	public void setRes_check(int res_check) {
		this.res_check = res_check;
	}

	
	
}

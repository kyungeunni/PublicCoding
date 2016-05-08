package com.puco.onoffmix.dao;

import java.util.Map;

public class StudyJoinVO {
	private int rno;
	private int mno;
	private int meetno;
	private int res_check;
	private String meetdate;
	private String meettime;
	private int tno;
	//meetupinfo에서 추가
	private String title;
	private String poster;
	private int maxpeople;
	
	private String tname;
	private String loc;
    //수강인원
	
	
	private String mnogroup;
	
	
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public int getMaxpeople() {
		return maxpeople;
	}
	public void setMaxpeople(int maxpeople) {
		this.maxpeople = maxpeople;
	}
	public String getMnogroup() {
		return mnogroup;
	}
	public void setMnogroup(String mnogroup) {
		this.mnogroup = mnogroup;
	}
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

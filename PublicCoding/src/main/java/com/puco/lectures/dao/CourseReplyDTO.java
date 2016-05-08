package com.puco.lectures.dao;
import java.util.*;
public class CourseReplyDTO {
/*
GRENO                                     NOT NULL NUMBER
GNO                                       NOT NULL NUMBER
GRECONTENT                                NOT NULL VARCHAR2(800)
GREPOINT                                           NUMBER
GREDATE                                            DATE
GREGROUP                                           NUMBER
GRESTEP                                            NUMBER
GRETAB                                             NUMBER
GREROOT                                            NUMBER
GREDEPTH                                           NUMBER
GREPWD                                    NOT NULL VARCHAR2(10)
GRENAME                                   NOT NULL VARCHAR2(50)
 */
	private int greno;
	private int gno;
	private String grecontent;
	private int grepoint;
	private Date gredate;
	private int gregroup;
	private int grestep;
	private int gretab;
	private int greroot;
	private int gredepth;
	private String grepwd;
	private String grename;
	private String dbday;
	
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	public int getGreno() {
		return greno;
	}
	public void setGreno(int greno) {
		this.greno = greno;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public String getGrecontent() {
		return grecontent;
	}
	public void setGrecontent(String grecontent) {
		this.grecontent = grecontent;
	}
	public int getGrepoint() {
		return grepoint;
	}
	public void setGrepoint(int grepoint) {
		this.grepoint = grepoint;
	}
	public Date getGredate() {
		return gredate;
	}
	public void setGredate(Date gredate) {
		this.gredate = gredate;
	}
	public int getGregroup() {
		return gregroup;
	}
	public void setGregroup(int gregroup) {
		this.gregroup = gregroup;
	}
	public int getGrestep() {
		return grestep;
	}
	public void setGrestep(int grestep) {
		this.grestep = grestep;
	}
	public int getGretab() {
		return gretab;
	}
	public void setGretab(int gretab) {
		this.gretab = gretab;
	}
	public int getGreroot() {
		return greroot;
	}
	public void setGreroot(int greroot) {
		this.greroot = greroot;
	}
	public int getGredepth() {
		return gredepth;
	}
	public void setGredepth(int gredepth) {
		this.gredepth = gredepth;
	}
	public String getGrepwd() {
		return grepwd;
	}
	public void setGrepwd(String grepwd) {
		this.grepwd = grepwd;
	}
	public String getGrename() {
		return grename;
	}
	public void setGrename(String grename) {
		this.grename = grename;
	}
}

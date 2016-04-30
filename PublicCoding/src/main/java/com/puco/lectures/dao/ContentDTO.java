package com.puco.lectures.dao;
/*
CREATE TABLE Content(
   Cno NUMBER CONSTRAINT ct_cno_nn NOT NULL,
   Cname VARCHAR2(50) CONSTRAINT ct_cnm_nn NOT NULL, 
   CmediaURL VARCHAR2(400) CONSTRAINT ct_mu_nn NOT NULL, 
   Ctime VARCHAR2(28),
   CsiteURL VARCHAR2(400),
   Cstep NUMBER CONSTRAINT ct_cs_nn NOT NULL, 
   Gno NUMBER CONSTRAINT ct_gno_nn NOT NULL,
   CONSTRAINT ct_cno_pk PRIMARY KEY(Cno),
   CONSTRAINT ct_gn_fk FOREIGN KEY(Gno)
   REFERENCES CourseGroup(gno)
);
 */
public class ContentDTO {

	private int cno;
	private String cname;
	private String cmediaurl;
	private String ctime;
	private String csiteurl;
	private int cstep;
	private int gno;
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCmediaurl() {
		return cmediaurl;
	}
	public void setCmediaurl(String cmediaurl) {
		this.cmediaurl = cmediaurl;
	}
	public String getCtime() {
		return ctime;
	}
	public void setCtime(String ctime) {
		this.ctime = ctime;
	}
	public String getCsiteurl() {
		return csiteurl;
	}
	public void setCsiteurl(String csiteurl) {
		this.csiteurl = csiteurl;
	}
	public int getCstep() {
		return cstep;
	}
	public void setCstep(int cstep) {
		this.cstep = cstep;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
}

package com.puco.lectures.dao;
/*
CREATE TABLE CourseGroup(
   Gno NUMBER CONSTRAINT cg_gno_nn NOT NULL, 
   Gname VARCHAR2(50) CONSTRAINT sg_sno_nn NOT NULL,
   GimageURL VARCHAR2(400),
   TotalCno NUMBER,
   Gintro VARCHAR2(800) CONSTRAINT sg_gi_nn NOT NULL,
   Sno NUMBER CONSTRAINT cg_sno_nn NOT NULL,
   CONSTRAINT cg_gn_pk PRIMARY KEY(Gno),
   CONSTRAINT cg_sn_fk FOREIGN KEY(Sno)
   REFERENCES scategory(sno)
);
 */
public class CourseGroupDTO {
	private int gno;
	private String gname;
	private String gimageurl;
	private int totalcno;
	private String gintro;
	private int sno;
	
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getGimageurl() {
		return gimageurl;
	}
	public void setGimageurl(String gimageurl) {
		this.gimageurl = gimageurl;
	}
	public int getTotalcno() {
		return totalcno;
	}
	public void setTotalcno(int totalcno) {
		this.totalcno = totalcno;
	}
	public String getGintro() {
		return gintro;
	}
	public void setGintro(String gintro) {
		this.gintro = gintro;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
}

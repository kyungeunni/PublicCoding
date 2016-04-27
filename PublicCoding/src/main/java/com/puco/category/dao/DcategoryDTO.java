package com.puco.category.dao;
/*
CREATE TABLE Dcategory(
   Dno Number CONSTRAINT dc_dno_nn NOT NULL,
   Dname VARCHAR2(50) CONSTRAINT dc_dname_nn NOT NULL,
   CONSTRAINT dc_dno_pk PRIMARY KEY(Dno)
);
 */
public class DcategoryDTO {
	private int dno;
	private String dname;
	
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	
}
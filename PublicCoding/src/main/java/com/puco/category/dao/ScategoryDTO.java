package com.puco.category.dao;
/*
CREATE TABLE Scategory(
   Sno Number CONSTRAINT sc_sno_nn NOT NULL,
   Sname VARCHAR2(50) CONSTRAINT sc_sname_nn NOT NULL,
   Dno Number CONSTRAINT sc_dno_nn NOT NULL,
   CONSTRAINT sc_sno_pk PRIMARY KEY(sno),
   CONSTRAINT sc_dno_fk FOREIGN KEY(dno)
   REFERENCES dcategory(dno)
);
 */
public class ScategoryDTO {
	private int sno;
	private String sname;
	private String dno;
	
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getDno() {
		return dno;
	}
	public void setDno(String dno) {
		this.dno = dno;
	}
}

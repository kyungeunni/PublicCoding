package com.puco.lectures.dao;

public class VideoDTO {
	private int Gno;
	private String Gname;//title
	private String GimageURL;//image
	private int TotalCno;
	private int Gintro;
	private int Sno;
	
	public int getTotalCno() {
		return TotalCno;
	}
	public void setTotalCno(int totalCno) {
		TotalCno = totalCno;
	}
	public int getGno() {
		return Gno;
	}
	public void setGno(int gno) {
		Gno = gno;
	}
	public String getGname() {
		return Gname;
	}
	public void setGname(String gname) {
		Gname = gname;
	}
	public String getGimageURL() {
		return GimageURL;
	}
	public void setGimageURL(String gimageURL) {
		GimageURL = gimageURL;
	}
	public int getGintro() {
		return Gintro;
	}
	public void setGintro(int gintro) {
		Gintro = gintro;
	}
	public int getSno() {
		return Sno;
	}
	public void setSno(int sno) {
		Sno = sno;
	}
	
	
}
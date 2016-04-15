package com.puco.lectures.dao;

public class VideoDTO {
	private int no;
	private String title;//title
	private String image;//image
	private String lectureurl;//url
	
	public String getLectureurl() {
		return lectureurl;
	}
	public void setLectureurl(String lectureurl) {
		this.lectureurl = lectureurl;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
}

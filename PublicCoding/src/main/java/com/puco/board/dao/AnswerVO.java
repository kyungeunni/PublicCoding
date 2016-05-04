package com.puco.board.dao;
import java.util.*;
/*
RNO
RCONTENT
RDATE
RHIT
BNO
MNO
 * 
 */
public class AnswerVO {
private int Rno;
private String Rcontent;
private Date Rdate;
private int Rhit;
private int Bno;
private int Mno;
private String userid;
private String mimageurl;
private int group_id;
private int group_step;
private int group_tab;
private int root;
private int depth;



public int getGroup_id() {
	return group_id;
}
public void setGroup_id(int group_id) {
	this.group_id = group_id;
}
public int getGroup_step() {
	return group_step;
}
public void setGroup_step(int group_step) {
	this.group_step = group_step;
}
public int getGroup_tab() {
	return group_tab;
}
public void setGroup_tab(int group_tab) {
	this.group_tab = group_tab;
}
public int getRoot() {
	return root;
}
public void setRoot(int root) {
	this.root = root;
}
public int getDepth() {
	return depth;
}
public void setDepth(int depth) {
	this.depth = depth;
}
public String getMimageurl() {
	return mimageurl;
}
public void setMimageurl(String mimageurl) {
	this.mimageurl = mimageurl;
}
public String getUserid() {
	return userid;
}
public void setUserid(String userid) {
	this.userid = userid;
}
public int getRno() {
	return Rno;
}
public void setRno(int rno) {
	Rno = rno;
}
public String getRcontent() {
	return Rcontent;
}
public void setRcontent(String rcontent) {
	Rcontent = rcontent;
}
public Date getRdate() {
	return Rdate;
}
public void setRdate(Date rdate) {
	Rdate = rdate;
}
public int getRhit() {
	return Rhit;
}
public void setRhit(int rhit) {
	Rhit = rhit;
}
public int getBno() {
	return Bno;
}
public void setBno(int bno) {
	Bno = bno;
}
public int getMno() {
	return Mno;
}
public void setMno(int mno) {
	Mno = mno;
}



}

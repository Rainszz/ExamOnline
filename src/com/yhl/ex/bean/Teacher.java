package com.yhl.ex.bean;

import java.io.Serializable;

public class Teacher implements Serializable{
	private int tID ;//教师ID
	private String tName ;//教师名字
	private String tSex ;//教师性别
	private int tPos ;//岗位
	private int rID;//角色ID
	
	public Teacher() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int gettID() {
		return tID;
	}

	public void settID(int tID) {
		this.tID = tID;
	}

	public String gettName() {
		return tName;
	}

	public void settName(String tName) {
		this.tName = tName;
	}

	public String gettSex() {
		return tSex;
	}

	public void settSex(String tSex) {
		this.tSex = tSex;
	}

	public int gettPos() {
		return tPos;
	}

	public void settPos(int tPost) {
		this.tPos = tPost;
	}

	public int getrID() {
		return rID;
	}

	public void setrID(int rID) {
		this.rID = rID;
	}
	
}

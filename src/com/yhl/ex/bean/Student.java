package com.yhl.ex.bean;

import java.io.Serializable;

public class Student implements Serializable{
	private int sID;	//学生编号
	private String sName ;	//姓名
	private String sSex;	//性别
	private String entrance ;	//入学年份
	private int classId;	//班级
	private int majorId;	//专业编号 
    private int rID;	//角色编号

	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getsID() {
		return sID;
	}

	public void setsID(int sID) {
		this.sID = sID;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getsSex() {
		return sSex;
	}

	public void setsSex(String sSex) {
		this.sSex = sSex;
	}

	public String getEntrance() {
		return entrance;
	}

	public void setEntrance(String entrance) {
		this.entrance = entrance;
	}

	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

	public int getMajorId() {
		return majorId;
	}

	public void setMajorId(int majorId) {
		this.majorId = majorId;
	}

	public int getrID() {
		return rID;
	}

	public void setrID(int rID) {
		this.rID = rID;
	}
	
}

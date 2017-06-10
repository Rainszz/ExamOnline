package com.yhl.ex.bean;

import java.io.Serializable;

public class Account implements Serializable{
	private int aID;
	private String aName;
	private String aPwd;
	private int rType;
	private int id;


	public Account() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getaID() {
		return aID;
	}


	public void setaID(int aID) {
		this.aID = aID;
	}


	public String getaName() {
		return aName;
	}


	public void setaName(String aName) {
		this.aName = aName;
	}


	public String getaPwd() {
		return aPwd;
	}


	public void setaPwd(String aPwd) {
		this.aPwd = aPwd;
	}


	public int getrType() {
		return rType;
	}


	public void setrType(int rType) {
		this.rType = rType;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}
	
}

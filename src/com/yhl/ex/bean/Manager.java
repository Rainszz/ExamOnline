package com.yhl.ex.bean;

import java.io.Serializable;

public class Manager implements Serializable{
	private int mID;
	private String mName;
	private int rID;
	
	public Manager() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getmID() {
		return mID;
	}

	public void setmID(int mID) {
		this.mID = mID;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public int getrID() {
		return rID;
	}

	public void setrID(int rID) {
		this.rID = rID;
	}

	
}

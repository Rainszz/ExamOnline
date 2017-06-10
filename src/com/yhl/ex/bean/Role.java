package com.yhl.ex.bean;

import java.io.Serializable;

public class Role implements Serializable{
	private int rID;
	private String rName;

	public Role() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getrId() {
		return rID;
	}

	public void setrID(int rId) {
		this.rID = rId;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}
	
}

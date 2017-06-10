package com.yhl.ex.bean;

import java.io.Serializable;

public class Paper implements Serializable{
	private int pId;
	private String pName;
	private int pTime;
	private int pTotalScore;
	private int qsId;
	private int mjId;
	private int stId;
	private int qNumber;
	private int qScore;
	private int psId;
	public Paper() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getpTime() {
		return pTime;
	}
	public void setpTime(int pTime) {
		this.pTime = pTime;
	}
	public int getpTotalScore() {
		return pTotalScore;
	}
	public void setpTotalScore(int pTotalScore) {
		this.pTotalScore = pTotalScore;
	}
	public int getQsId() {
		return qsId;
	}
	public void setQsId(int qsId) {
		this.qsId = qsId;
	}
	public int getMjId() {
		return mjId;
	}
	public void setMjId(int mjId) {
		this.mjId = mjId;
	}
	public int getStId() {
		return stId;
	}
	public void setStId(int stId) {
		this.stId = stId;
	}
	public int getqNumber() {
		return qNumber;
	}
	public void setqNumber(int qNumber) {
		this.qNumber = qNumber;
	}
	public int getqScore() {
		return qScore;
	}
	public void setqScore(int qScore) {
		this.qScore = qScore;
	}
	public int getPsId() {
		return psId;
	}
	public void setPsId(int psId) {
		this.psId = psId;
	}
	
}

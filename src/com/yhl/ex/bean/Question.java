package com.yhl.ex.bean;

import java.io.Serializable;

public class Question implements Serializable{
	private int qId;
	private String qTitle;
	private String optionA;
	private String optionB;
	private String optionC;
	private String optionD;
	private String answer;
	private int qtId;
	private int qdId;
	private int qsId;
	
	public Question() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getqId() {
		return qId;
	}
	public void setqId(int qId) {
		this.qId = qId;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getOptionA() {
		return optionA;
	}
	public void setOptionA(String optionA) {
		this.optionA = optionA;
	}
	public String getOptionB() {
		return optionB;
	}
	public void setOptionB(String optionB) {
		this.optionB = optionB;
	}
	public String getOptionC() {
		return optionC;
	}
	public void setOptionC(String optionC) {
		this.optionC = optionC;
	}
	public String getOptionD() {
		return optionD;
	}
	public void setOptionD(String optionD) {
		this.optionD = optionD;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public int getQtId() {
		return qtId;
	}
	public void setQtId(int qtId) {
		this.qtId = qtId;
	}
	public int getQdId() {
		return qdId;
	}
	public void setQdId(int qdId) {
		this.qdId = qdId;
	}
	public int getQsId() {
		return qsId;
	}
	public void setQsId(int qsId) {
		this.qsId = qsId;
	}
}


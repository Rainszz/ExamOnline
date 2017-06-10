package com.yhl.ex.bean;

import java.io.Serializable;

public class QuestionsItem implements Serializable{
	private Paper paper;	//当前试题信息
	private String subName;
	private String stageName;
	private int machineCount;	//机试题总数
	private int choiceCount;	//选择题总数
	
	public Paper getPaper() {
		return paper;
	}
	public void setPaper(Paper paper) {
		this.paper = paper;
	}
	public int getMachineCount() {
		return machineCount;
	}
	public void setMachineCount(int machineCount) {
		this.machineCount = machineCount;
	}
	public int getChoiceCount() {
		return choiceCount;
	}
	public void setChoiceCount(int choiceCount) {
		this.choiceCount = choiceCount;
	}
	
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public String getStageName() {
		return stageName;
	}
	public void setStageName(String stageName) {
		this.stageName = stageName;
	}
}
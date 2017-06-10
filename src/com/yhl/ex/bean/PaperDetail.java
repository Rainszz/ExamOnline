package com.yhl.ex.bean;

import java.io.Serializable;
import java.util.List;



public class PaperDetail implements Serializable {
	private Paper paper;
	private String subName;
	private PageBean pageBean;
	
	public PaperDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Paper getPaper() {
		return paper;
	}
	public void setPaper(Paper paper) {
		this.paper = paper;
	}
	
	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
}

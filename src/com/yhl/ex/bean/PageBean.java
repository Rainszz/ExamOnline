package com.yhl.ex.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class PageBean implements Serializable {
	private int pageSize;
	private int p;
	private int pageTotal;
	private int count;
	private List<Object> data;
	
	public PageBean() {
		super();
		// TODO Auto-generated constructor stub
		this.pageSize = 10;
		data = new ArrayList();
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getP() {
		return p;
	}

	public void setP(int p) {
		if(p<1){
			this.p = 1;
		}else if(p > pageTotal){
			this.p = pageTotal;
		}else{
			this.p = p;
		}
	}

	public int getPageTotal() {
		return pageTotal;
	}

	public void setPageTotal(int pageTotal) {
		this.pageTotal = pageTotal;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
		if(count > 0){
			this.pageTotal = (int) Math.ceil((count*1.0)/pageSize);
		}else{
			this.pageTotal = 1;
		}
	}

	public List<Object> getData() {
		return data;
	}

	public void setData(List<Object> data) {
		this.data = data;
	}
	
	public void addData(Object obj){
		this.data.add(obj);
	}
	
}
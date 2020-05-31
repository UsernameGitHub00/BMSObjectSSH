package com.wuchuan.vo;

import java.util.List;
/**
 * 
 * @author qzly
 *
 * @param <T>
 */
public class Bsgrid<T> {
	private boolean success;
	private int totalRows;
	private int curPage;
	private List<T> data;
	
	
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public int getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
	
	
	
}

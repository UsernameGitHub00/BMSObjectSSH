package com.wuchuan.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.wuchuan.po.Borrow;
import com.wuchuan.service.IBookBrOrReService;
import com.wuchuan.util.Tools;
import com.wuchuan.vo.Bsgrid;

public class BookBrOrReAction extends ActionSupport implements ModelDriven<Borrow> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Autowired
	IBookBrOrReService bookBrOrReService;
	
	private Borrow borrow;

	private String message;
	
	private String curPage;
	
	private String pageSize;
	
	private List<Borrow> listBorrow;
	
	private Bsgrid<Borrow> bsgrid;
	
	private String inpstart;
	
	private String inpend;

	






	//借书管理  还书管理  列表
	public String selectBorrow(){
		int currentPage=1;
		int pageSizeStr=10;
		if (curPage!=null && Tools.isNum(curPage)) {
			currentPage=Integer.parseInt(curPage);
		}
		if (pageSize!=null &&Tools.isNum(pageSize)) {
			 pageSizeStr=Integer.parseInt(pageSize);
		}
		
		int startIndex=(currentPage-1)*pageSizeStr;
		listBorrow = bookBrOrReService.selectBorrow(startIndex, pageSizeStr, borrow.getBook_name(), borrow.getUser_name(),inpstart,inpend,borrow.getBook_state_id());
	    int totalRow=bookBrOrReService.getTotalRow(borrow.getBook_name(), borrow.getUser_name(), inpstart,inpend,borrow.getBook_state_id());
		bsgrid = new Bsgrid<Borrow>();
		bsgrid.setSuccess(true);
		bsgrid.setCurPage(currentPage);
		bsgrid.setTotalRows(totalRow);
		bsgrid.setData(listBorrow);
		
		return "selectBorrow";
	}
	
	//归还书籍
	public String setReturnBook(){
		Boolean sf= bookBrOrReService.updateBookState(borrow.getBook_id());
		Boolean tf= bookBrOrReService.updateBorrow(borrow.getBorrow_id());
		if (sf.equals(tf)==true) {
			message="归还成功！";
		} else {
			message="归还失败！";
		}
		return "message";
	}
	
	
	//get -- set
	public Borrow getBorrow() {
		return borrow;
	}

	public void setBorrow(Borrow borrow) {
		this.borrow = borrow;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getCurPage() {
		return curPage;
	}

	public void setCurPage(String curPage) {
		this.curPage = curPage;
	}

	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public List<Borrow> getListBorrow() {
		return listBorrow;
	}

	public void setListBorrow(List<Borrow> listBorrow) {
		this.listBorrow = listBorrow;
	}

	public Bsgrid<Borrow> getBsgrid() {
		return bsgrid;
	}

	public String getInpstart() {
		return inpstart;
	}

	public void setInpstart(String inpstart) {
		this.inpstart = inpstart;
	}

	public String getInpend() {
		return inpend;
	}
	
	public void setInpend(String inpend) {
		this.inpend = inpend;
	}
	
	public void setBsgrid(Bsgrid<Borrow> bsgrid) {
		this.bsgrid = bsgrid;
	}

	@Override
	public Borrow getModel() {
		// TODO Auto-generated method stub
		if (borrow==null) {
			return borrow = new Borrow();
		} else {
			return borrow;
		}
	}
	
}

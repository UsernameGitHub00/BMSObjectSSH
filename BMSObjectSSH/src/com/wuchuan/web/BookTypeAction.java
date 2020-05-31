package com.wuchuan.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.wuchuan.po.BookType;
import com.wuchuan.service.IBookTypeService;
import com.wuchuan.util.Tools;
import com.wuchuan.vo.Bsgrid;

public class BookTypeAction extends ActionSupport implements ModelDriven<BookType>  {

	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Autowired
	IBookTypeService bookTypeService;
	
	private String message;
	
	private String curPage;
	
	private String pageSize;
	
	private List<BookType> listBookType;
	
	private Bsgrid<BookType> bsgrid;
	
	private BookType bookType;
	
	
	//查询所有书籍类别   列表
	public String bookTypeList(){
		int currentPage=1;
		int pageSizeStr=10;
		if (curPage!=null && Tools.isNum(curPage)) {
			currentPage=Integer.parseInt(curPage);
		}
		if (pageSize!=null &&Tools.isNum(pageSize)) {
			 pageSizeStr=Integer.parseInt(pageSize);
		}
		
		int startIndex=(currentPage-1)*pageSizeStr;
		listBookType = bookTypeService.findAll(startIndex,pageSizeStr);
	    int totalRow=bookTypeService.getTotalRow();
		bsgrid = new Bsgrid<BookType>();
		bsgrid.setSuccess(true);
		bsgrid.setCurPage(currentPage);
		bsgrid.setTotalRows(totalRow);
		bsgrid.setData(listBookType);
		
		return "bookTypeList";
	}
	
	//书籍类型的上级信息
	public String selectMessage(){
		bookType=bookTypeService.selectMessage(bookType.getBook_type_id());
		return "selectMessage";
	}
	
	//树形数据
	public String treeDate(){
		listBookType=bookTypeService.findAll();
		return "treeDate";
	}
	
	//书籍类型大类下拉框
	public String selectBookTypeById(){
		listBookType=bookTypeService.selectBookTypeById(bookType.getBook_type_id_1());
		return "treeDate";
	}
	
	//新增书籍类型
	public String insertDate(){
		boolean sf = bookTypeService.insertDate(bookType.getBook_type(), bookType.getBook_type_id_1());
		if (sf) {
			message="success";
		} else {
			message="新增失败！";
		}
		return "message";
	}
	
	//修改书籍类型
	public String updateBookType(){
		boolean sf = bookTypeService.updateBookType(bookType);
		if (sf) {
			message="success";
		} else {
			message="修改失败！";
		}
		
		return "message";
	}
	
	//删除书籍类型
	public String deleteBookType(){
		
		boolean sf = bookTypeService.deleteBookType(bookType.getBook_type_id());
		if (sf) {
			message="success";
		} else {
			message="删除失败！";
		}
		return "message";
	}
	
	// get -- set
	@Override
	public BookType getModel() {
		if (bookType==null) {
			return bookType = new BookType();
		} else {
			return bookType;
		}
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

	public BookType getBookType() {
		return bookType;
	}

	public void setBookType(BookType bookType) {
		this.bookType = bookType;
	}

	public List<BookType> getListBookType() {
		return listBookType;
	}


	public void setListBookType(List<BookType> listBookType) {
		this.listBookType = listBookType;
	}


	public Bsgrid<BookType> getBsgrid() {
		return bsgrid;
	}


	public void setBsgrid(Bsgrid<BookType> bsgrid) {
		this.bsgrid = bsgrid;
	}

}

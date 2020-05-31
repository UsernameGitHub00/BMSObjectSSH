package com.wuchuan.web;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.wuchuan.po.Book;
import com.wuchuan.po.BookState;
import com.wuchuan.service.IBookMessageService;
import com.wuchuan.util.Tools;
import com.wuchuan.vo.Bsgrid;

public class BookMessageAction extends ActionSupport implements ModelDriven<Book>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Autowired
	IBookMessageService bookManageService;
	
	private Book book;

	private String message;
	
	private String curPage;
	
	private String pageSize;
	
	private List<Book> listBook;
	
	private Bsgrid<Book> bsgrid;

	private List<BookState> listBookState;
	
	private BookState bookState;
	
	private File upFile;

	//书籍列表
	public String bsBookMessage(){
		int currentPage=1;
		int pageSizeStr=10;
		if (curPage!=null && Tools.isNum(curPage)) {
			currentPage=Integer.parseInt(curPage);
		}
		if (pageSize!=null &&Tools.isNum(pageSize)) {
			 pageSizeStr=Integer.parseInt(pageSize);
		}
		
		int startIndex=(currentPage-1)*pageSizeStr;
		listBook = bookManageService.bsBookMessage(startIndex, pageSizeStr, book.getBook_name(), book.getBook_author(), book.getBook_state_id());
	    int totalRow=bookManageService.getTotalRow(book.getBook_name(), book.getBook_author(), book.getBook_state_id());
		bsgrid = new Bsgrid<Book>();
		bsgrid.setSuccess(true);
		bsgrid.setCurPage(currentPage);
		bsgrid.setTotalRows(totalRow);
		bsgrid.setData(listBook);
		
		
		return "bsBookMessage";
	}
	
	//查询所有书籍状态
	public String selectBookState(){
		listBookState = bookManageService.selectBookState();
		
		return "selectBookState";
	}
	
	//根据ID查询书籍状态
	public String selectBookStateById(){
		bookState = bookManageService.selectBookState(book.getBook_state_id());
		
		return "selectBookStateById";
	}
	
	//查询书籍
	public String selectBook(){
		book=bookManageService.selectBook(book.getBook_id());
		return "book";
	}
	
	public String selectBookAll(){
		listBook = bookManageService.selectBookAll();
		return "selectBookAll";
	}
	
	//新增书籍
	public String insertBook() throws IOException{
		InputStream input=new FileInputStream(upFile);//将文件转为输入流
		ByteArrayOutputStream output = new ByteArrayOutputStream();
		byte[] buffer = new byte[1024*4];
		int n = 0;
		while (-1 != (n = input.read(buffer))) {
			output.write(buffer, 0, n);
		}
		book.setBook_img(output.toByteArray());
		boolean sf=bookManageService.insertBook(book);
		if (sf) {
			message="新增成功！";
		} else {
			message="新增失败！";
		}
		return "message";
	}
	
	//修改书籍
	public String updateBook() throws IOException{
		InputStream input = null;
		if (upFile!=null) {
			input=new FileInputStream(upFile);//将文件转为输入流
		} else {
			input=new FileInputStream("C:\\Workspaces\\BMS\\BMSObjectSSH\\WebRoot\\Content\\bookImg\\"+book.getBook_id()+".jpg");//将文件转为输入流
		}
		ByteArrayOutputStream output = new ByteArrayOutputStream();
		byte[] buffer = new byte[1024*4];
		int n = 0;
		while (-1 != (n = input.read(buffer))) {
			output.write(buffer, 0, n);
		}
		book.setBook_img(output.toByteArray());
		boolean sf=bookManageService.updateBook(book);
		if (sf) {
			message="修改成功！";
		} else {
			message="修改失败！";
		}
		return "message";
	}
	
	
	//删除书籍
	public String deleteBook(){
		
		boolean sf=bookManageService.deleteBook(book.getBook_id());
		if (sf) {
			message="success";
		} else {
			message="删除失败！";
		}
		return "message";
	}
	
	//设置书籍状态
	public String setBookState(){
		boolean sf=bookManageService.setBookState(book.getBook_id(),book.getBook_state_id());
		if (sf) {
			message="修改成功！";
		} else {
			message="修改失败！";
		}
		return "message";
	}
	
	//get -- set
	@Override
	public Book getModel() {
		// TODO Auto-generated method stub
		if (book==null) {
			return book = new Book();
		} else {
			return book;
		}
	}
	
	public Book getBook() {
		return book;
	}
	
	public void setBook(Book book) {
		this.book = book;
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

	public List<Book> getListBook() {
		return listBook;
	}

	public void setListBook(List<Book> listBook) {
		this.listBook = listBook;
	}

	public Bsgrid<Book> getBsgrid() {
		return bsgrid;
	}

	public void setBsgrid(Bsgrid<Book> bsgrid) {
		this.bsgrid = bsgrid;
	}

	
	public List<BookState> getListBookState() {
		return listBookState;
	}

	public void setListBookState(List<BookState> listBookState) {
		this.listBookState = listBookState;
	}
	
	public BookState getBookState() {
		return bookState;
	}

	public void setBookState(BookState bookState) {
		this.bookState = bookState;
	}
	
	public File getUpFile() {
		return upFile;
	}

	public void setUpFile(File upFile) {
		this.upFile = upFile;
	}
}

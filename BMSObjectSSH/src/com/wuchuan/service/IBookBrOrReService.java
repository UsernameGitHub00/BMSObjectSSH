package com.wuchuan.service;

import java.util.List;

import com.wuchuan.po.Borrow;


public interface IBookBrOrReService {
	
	List<Borrow> selectBorrow(int startIndex,int pageSize,String bookName,String userName,String inpstart,String inpend,int bookStateId);
	
	int getTotalRow(String bookName,String userName,String inpstart,String inpend,int bookStateId);
	
	Boolean updateBookState(int bookId);
	
	Boolean updateBorrow(int borrowId);
}

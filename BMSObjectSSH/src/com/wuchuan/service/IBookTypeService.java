package com.wuchuan.service;

import java.util.List;

import com.wuchuan.po.BookType;

public interface IBookTypeService {
	List<BookType> findAll(int startIndex,int pageSize);
	
	int getTotalRow();
	
	BookType selectMessage(int bookTypeId);
	
	List<BookType> findAll();
	
	Boolean insertDate(String bookType,int bookTypeIds);
	
	Boolean updateBookType(BookType bookType);
	
	Boolean deleteBookType(int bookTypeId);
	
	List<BookType> selectBookTypeById(int bookTypeIds);
}

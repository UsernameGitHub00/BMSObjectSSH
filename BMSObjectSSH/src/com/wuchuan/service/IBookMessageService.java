package com.wuchuan.service;

import java.util.List;

import com.wuchuan.po.Book;
import com.wuchuan.po.BookState;


public interface IBookMessageService {
	
	List<Book> bsBookMessage(int startIndex,int pageSize,String bookName,String bookAuthor,int bookStateId);
	
	List<BookState> selectBookState();
	
	int getTotalRow(String bookName,String bookAuthor,int bookStateId);
	
	BookState selectBookState(int bookStateId);
	
	Boolean insertBook(Book book);
	
	Boolean deleteBook(int bookId);
	
	Boolean setBookState(int bookId,int bookStateId);
	
	Book selectBook(int bookId);
	
	Boolean updateBook(Book book);
	
	List<Book> selectBookAll();
}

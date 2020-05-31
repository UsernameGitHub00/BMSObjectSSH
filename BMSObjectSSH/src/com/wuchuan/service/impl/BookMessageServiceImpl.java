package com.wuchuan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wuchuan.dao.IBookMessageDao;
import com.wuchuan.po.Book;
import com.wuchuan.po.BookState;
import com.wuchuan.service.IBookMessageService;


@Transactional//开启事务
@Service(value="bookManageService")
public class BookMessageServiceImpl implements IBookMessageService {

	@Autowired
	private IBookMessageDao bookMessageDao;
	
	@Override
	public List<Book> bsBookMessage(int startIndex, int pageSize,
			String bookName, String bookAuthor, int bookStateId) {
		// TODO Auto-generated method stub
		return bookMessageDao.bsBookMessage(startIndex, pageSize, bookName, bookAuthor, bookStateId);
	}

	@Override
	public List<BookState> selectBookState() {
		// TODO Auto-generated method stub
		return bookMessageDao.selectBookState();
	}

	@Override
	public int getTotalRow(String bookName, String bookAuthor, int bookStateId) {
		// TODO Auto-generated method stub
		return bookMessageDao.getTotalRow(bookName, bookAuthor, bookStateId);
	}

	@Override
	public BookState selectBookState(int bookStateId) {
		// TODO Auto-generated method stub
		return bookMessageDao.selectBookState(bookStateId);
	}

	@Override
	public Boolean insertBook(Book book) {
		// TODO Auto-generated method stub
		return bookMessageDao.insertBook(book);
	}

	@Override
	public Boolean deleteBook(int bookId) {
		// TODO Auto-generated method stub
		return bookMessageDao.deleteBook(bookId);
	}

	@Override
	public Boolean setBookState(int bookId, int bookStateId) {
		// TODO Auto-generated method stub
		return bookMessageDao.setBookState(bookId,bookStateId);
	}

	@Override
	public Book selectBook(int bookId) {
		// TODO Auto-generated method stub
		return bookMessageDao.selectBook(bookId);
	}

	@Override
	public Boolean updateBook(Book book) {
		// TODO Auto-generated method stub
		return bookMessageDao.updateBook(book);
	}

	@Override
	public List<Book> selectBookAll() {
		// TODO Auto-generated method stub
		return bookMessageDao.selectBookAll();
	}

}

package com.wuchuan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wuchuan.dao.IBookTypeDao;
import com.wuchuan.po.BookType;
import com.wuchuan.service.IBookTypeService;

@Transactional//开启事务
@Service(value="bookTypeService")
public class BookTypeServiceImpl implements IBookTypeService {
	
	@Autowired
	private IBookTypeDao bookTypeDao;

	@Override
	public List<BookType> findAll(int startIndex, int pageSize) {
		// TODO Auto-generated method stub
		return bookTypeDao.findAll(startIndex, pageSize);
	}

	@Override
	public int getTotalRow() {
		// TODO Auto-generated method stub
		return bookTypeDao.getTotalRow();
	}

	@Override
	public BookType selectMessage(int bookTypeId) {
		// TODO Auto-generated method stub
		return bookTypeDao.selectMessage(bookTypeId);
	}

	@Override
	public List<BookType> findAll() {
		// TODO Auto-generated method stub
		return bookTypeDao.findAll();
	}

	@Override
	public Boolean insertDate(String bookType, int bookTypeIds) {
		// TODO Auto-generated method stub
		return bookTypeDao.insertDate(bookType, bookTypeIds);
	}

	@Override
	public Boolean updateBookType(BookType bookType) {
		// TODO Auto-generated method stub
		return bookTypeDao.updateBookType(bookType);
	}

	@Override
	public Boolean deleteBookType(int bookTypeId) {
		// TODO Auto-generated method stub
		return bookTypeDao.deleteBookType(bookTypeId);
	}

	@Override
	public List<BookType> selectBookTypeById(int bookTypeIds) {
		// TODO Auto-generated method stub
		return bookTypeDao.selectBookTypeById(bookTypeIds);
	}
	
	
	
}

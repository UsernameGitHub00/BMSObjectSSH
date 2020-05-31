package com.wuchuan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wuchuan.dao.IBookBrOrReDao;
import com.wuchuan.po.Borrow;
import com.wuchuan.service.IBookBrOrReService;

@Transactional//开启事务
@Service(value="bookBrOrReService")
public class BookBrOrReServiceImpl implements IBookBrOrReService{
	
	@Autowired
	private IBookBrOrReDao bookBrOrReDao;

	@Override
	public List<Borrow> selectBorrow(int startIndex, int pageSize,
			String bookName, String userName, String inpstart, String inpend,int bookStateId) {
		// TODO Auto-generated method stub
		return bookBrOrReDao.selectBorrow(startIndex, pageSize, bookName, userName, inpstart, inpend,bookStateId);
	}

	@Override
	public int getTotalRow(String bookName, String userName, String inpstart,
			String inpend,int bookStateId) {
		// TODO Auto-generated method stub
		return bookBrOrReDao.getTotalRow(bookName, userName, inpstart, inpend,bookStateId);
	}

	@Override
	public Boolean updateBookState(int bookId) {
		// TODO Auto-generated method stub
		return bookBrOrReDao.updateBookState(bookId);
	}

	@Override
	public Boolean updateBorrow(int borrowId) {
		// TODO Auto-generated method stub
		return bookBrOrReDao.updateBorrow(borrowId);
	}
	
	
}

package com.wuchuan.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wuchuan.dao.IBookBrOrReDao;
import com.wuchuan.po.Book;
import com.wuchuan.po.Borrow;

@Repository(value="bookBrOrReDao")//dao层注解
public class BookBrOrReDaoImpl implements IBookBrOrReDao{
	@Autowired//spring通过注解自动查找类型为SessionFactory的bean注入
	private SessionFactory sessionFactory;
	
	//Hibernate的session
	private Session session;
	
	private String selectBorrow="SELECT * FROM b_borrow INNER JOIN b_books ON b_borrow.book_id = b_books.book_id INNER JOIN s_user ON b_borrow.user_id=s_user.user_id WHERE b_books.book_name LIKE \"%\"?\"%\" AND s_user.user_name LIKE \"%\"?\"%\" AND book_state_id=?";

	private String updateBookState="update b_books set book_state_id=1 where book_id=?";
	
	private String updateBorrow="update b_borrow set borrow_state=1,return_time=? where borrow_id=?";
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Borrow> selectBorrow(int startIndex, int pageSize,
			String bookName, String userName, String inpstart, String inpend,int bookStateId) {
		// TODO Auto-generated method stub
		session=sessionFactory.getCurrentSession();
		
		SQLQuery sqlQuery;
		if (inpstart.equals("") && inpend.equals("")) {
			String selectBorrowList = selectBorrow+" LIMIT ?,?";
			sqlQuery=session.createSQLQuery(selectBorrowList).addEntity(Borrow.class);
			
			sqlQuery.setString(0, bookName)
					.setString(1, userName)
					.setInteger(2, bookStateId)
					.setInteger(3, startIndex)
					.setInteger(4, pageSize);
		} else {
			String selectBorrowList = selectBorrow+" AND borrow_time > ? AND borrow_time < ?  LIMIT ?,?";
			sqlQuery=session.createSQLQuery(selectBorrowList).addEntity(Borrow.class);
			sqlQuery.setString(0, bookName)
					.setString(1, userName)
					.setInteger(2, bookStateId)
					.setString(3, inpstart)//设置开始时间
					.setString(4, inpend)//设置结束时间
					.setInteger(5, startIndex)
					.setInteger(6, pageSize);
		}
		
		List<Borrow> list = sqlQuery.list();
		
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public int getTotalRow(String bookName, String userName, String inpstart,
			String inpend,int bookStateId) {
		// TODO Auto-generated method stub
		session=sessionFactory.getCurrentSession();
		
		SQLQuery sqlQuery;
		if (inpstart.equals("") && inpend.equals("")) {
			sqlQuery=session.createSQLQuery(selectBorrow).addEntity(Borrow.class);
			
			sqlQuery.setString(0, bookName)
					.setString(1, userName)
					.setInteger(2, bookStateId);
		} else {
			String selectBorrowList = selectBorrow+" AND borrow_time > ? AND borrow_time < ?";
			sqlQuery=session.createSQLQuery(selectBorrowList).addEntity(Borrow.class);
			sqlQuery.setString(0, bookName)
					.setString(1, userName)
					.setInteger(2, bookStateId)
					.setString(3, inpstart)//设置开始时间
					.setString(4, inpend);//设置结束时间
		}
		
		List<Borrow> list = sqlQuery.list();
		
		return list.size();
	}

	@Override
	public Boolean updateBookState(int bookId) {
		// TODO Auto-generated method stub
		session=sessionFactory.getCurrentSession();
		SQLQuery sqlQuery=session.createSQLQuery(updateBookState).addEntity(Book.class);
		sqlQuery.setInteger(0, bookId);
		int r= sqlQuery.executeUpdate();
		if (r>0) {
			return true;
			
		}else{
			return false;
		}
	}

	@Override
	public Boolean updateBorrow(int borrowId) {
		// TODO Auto-generated method stub
		session=sessionFactory.getCurrentSession();
		SQLQuery sqlQuery=session.createSQLQuery(updateBorrow).addEntity(Borrow.class);
		Date date = new Date();
		SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
		System.out.println(dateFormat.format(date));
		sqlQuery.setString(0,dateFormat.format(date))
				.setInteger(1, borrowId);
		int r= sqlQuery.executeUpdate();
		if (r>0) {
			return true;
			
		}else{
			return false;
		}
	}
}

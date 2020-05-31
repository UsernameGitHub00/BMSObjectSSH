package com.wuchuan.dao.impl;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.wuchuan.dao.IBookTypeDao;
import com.wuchuan.po.BookType;

@Repository(value="bookTypeDao")//dao层注解
public class BookTypeDaoImpl extends HibernateDaoSupport implements IBookTypeDao{

	@Autowired//spring通过注解自动查找类型为SessionFactory的bean注入
	private SessionFactory sessionFactory;
	
	//Hibernate的session
	private Session session;
	
	private String selectBookType = "SELECT * FROM b_book_type limit ?,?";
	
	private String selectMessage="SELECT * FROM b_book_type where b_book_type.book_type_id=?";
	
	private String findAll = "SELECT * FROM b_book_type";
	
	private String insertDate = "insert into b_book_type(book_type,book_type_id_1) values(?,?)";
	
	private String updateBookType= "update b_book_type set b_book_type.book_type=?,b_book_type.book_type_id_1=? where b_book_type.book_type_id=?";

	private String deleteBookType= "delete from b_book_type where b_book_type.book_type_id=?";
	
	private String selectBookTypeById= "SELECT * FROM b_book_type where b_book_type.book_type_id_1=?";
	
	@SuppressWarnings("unchecked")
	@Override
	public List<BookType> findAll(int startIndex, int pageSize) {
		// TODO Auto-generated method stub
		session=sessionFactory.getCurrentSession();
		
		SQLQuery sqlQuery=session.createSQLQuery(selectBookType).addEntity(BookType.class);
		sqlQuery.setInteger(0, startIndex)
				.setInteger(1, pageSize);
		List<BookType> list = sqlQuery.list();
		return list;
	}


	@SuppressWarnings("unchecked")
	@Override
	public int getTotalRow() {
		// TODO Auto-generated method stub
		session=sessionFactory.getCurrentSession();
		SQLQuery sqlQuery=session.createSQLQuery(findAll).addEntity(BookType.class);
		List<BookType> list = sqlQuery.list();
		return list.size();
	}


	@Override
	public BookType selectMessage(int bookTypeId) {
		// TODO Auto-generated method stub
		session=sessionFactory.getCurrentSession();
		SQLQuery sqlQuery=session.createSQLQuery(selectMessage).addEntity(BookType.class);
		sqlQuery.setInteger(0, bookTypeId);
		BookType bookType=(BookType) sqlQuery.uniqueResult();
		return bookType;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<BookType> findAll() {
		// TODO Auto-generated method stub
		session=sessionFactory.getCurrentSession();
		
		SQLQuery sqlQuery=session.createSQLQuery(findAll).addEntity(BookType.class);
		List<BookType> list = sqlQuery.list();
		
		return list;
	}


	@Override
	public Boolean insertDate(String bookType, int bookTypeIds) {
		// TODO Auto-generated method stub
		
		session=sessionFactory.getCurrentSession();
		
		SQLQuery sqlQuery=session.createSQLQuery(insertDate).addEntity(BookType.class);
		sqlQuery.setString(0, bookType)
				.setInteger(1, bookTypeIds);
		int r= sqlQuery.executeUpdate();
		if (r>0) {
			return true;
		}else{
			return false;
		}
	}


	@Override
	public Boolean updateBookType(BookType bookType) {
		// TODO Auto-generated method stub
		session=sessionFactory.getCurrentSession();
		
		SQLQuery sqlQuery=session.createSQLQuery(updateBookType).addEntity(BookType.class);
		sqlQuery.setString(0,bookType.getBook_type())
				.setInteger(1,bookType.getBook_type_id_1())
				.setInteger(2,bookType.getBook_type_id());
		int r= sqlQuery.executeUpdate();
		if (r>0) {
			return true;
		} else {
			return false;
		}
	}


	@Override
	public Boolean deleteBookType(int bookTypeId) {
		// TODO Auto-generated method stub
		session=sessionFactory.getCurrentSession();
		
		SQLQuery sqlQuery=session.createSQLQuery(deleteBookType).addEntity(BookType.class);
		sqlQuery.setInteger(0,bookTypeId);
		int r= sqlQuery.executeUpdate();
		if (r>0) {
			return true;
		} else {
			return false;
		}
		
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<BookType> selectBookTypeById(int bookTypeIds) {
		// TODO Auto-generated method stub
		
		session=sessionFactory.getCurrentSession();
		
		SQLQuery sqlQuery=session.createSQLQuery(selectBookTypeById).addEntity(BookType.class);
		sqlQuery.setInteger(0, bookTypeIds);
		List<BookType> list = sqlQuery.list();
		return list;
	}
	
	

}

package com.wuchuan.dao.impl;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wuchuan.dao.IBookMessageDao;
import com.wuchuan.po.Book;
import com.wuchuan.po.BookState;
import com.wuchuan.util.ByteToImg;

@Repository(value="bookManageDao")//dao层注解
public class BookMessageDaoImpl implements IBookMessageDao{

	@Autowired//spring通过注解自动查找类型为SessionFactory的bean注入
	private SessionFactory sessionFactory;
	
	//Hibernate的session
	private Session session;
	
	private String bsBookMessage="SELECT * FROM b_books inner join b_book_state on b_books.book_state_id = b_book_state.book_state_id WHERE book_name LIKE \"%\"?\"%\" AND book_author LIKE \"%\"?\"%\"";
	
	private String selectBookState="SELECT * FROM b_book_state";
	
	private String selectBookStateById="SELECT * FROM b_book_state where b_book_state.book_state_id=?";
	
	private String insertBook="INSERT INTO b_books(book_name,book_price,book_author,book_synopsis,book_type_id,book_img,book_state_id) VALUES(?,?,?,?,?,?,1)";
	
	private String deleteBook="delete from b_books where book_id=?";
	
	private String setBookState="update b_books set book_state_id=? where book_id=?";
	
	private String selectBook="SELECT * FROM b_books where b_books.book_id=?";
	
	private String updateBook="update b_books set book_name=?,book_price=?,book_author=?,book_synopsis=?,book_type_id=?,book_img=? where book_id=?";
	
	private String selectBookAll="SELECT * FROM b_books";
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Book> bsBookMessage(int startIndex, int pageSize,
			String bookName, String bookAuthor, int bookStateId) {
		// TODO Auto-generated method stub
		session=sessionFactory.getCurrentSession();
		
		SQLQuery sqlQuery;
		if (bookStateId>0) {
			String bookManageList = bsBookMessage+"and b_books.book_state_id=?  LIMIT ?,?";
			sqlQuery=session.createSQLQuery(bookManageList).addEntity(Book.class);
			sqlQuery.setString(0, bookName)
					.setString(1, bookAuthor)
					.setInteger(2, bookStateId)
					.setInteger(3, startIndex)
					.setInteger(4, pageSize);
		} else {
			String bookManageList = bsBookMessage+"LIMIT ?,?";
			sqlQuery=session.createSQLQuery(bookManageList).addEntity(Book.class);
			
			sqlQuery.setString(0, bookName)
					.setString(1, bookAuthor)
					.setInteger(2, startIndex)
					.setInteger(3, pageSize);
		}
		
		List<Book> list = sqlQuery.list();
		
		for (int i = 0; i < list.size(); i++) {
			String path="C:\\Users\\Deep love\\BMSSSH项目\\BMSObjectSSH\\WebRoot\\Content\\bookImg\\"+list.get(i).getBook_id()+".jpg";
			ByteToImg.byteimage(list.get(i).getBook_img(), path);
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BookState> selectBookState() {
		// TODO Auto-generated method stub
		session=sessionFactory.getCurrentSession();
		
		SQLQuery sqlQuery=session.createSQLQuery(selectBookState).addEntity(BookState.class);
		List<BookState> list = sqlQuery.list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public int getTotalRow(String bookName,String bookAuthor,int bookStateId) {
		// TODO Auto-generated method stub
		
		session=sessionFactory.getCurrentSession();
		
		SQLQuery sqlQuery;
		if (bookStateId>0) {
			String books=bsBookMessage+"and b_books.book_state_id=?";
			sqlQuery=session.createSQLQuery(books).addEntity(Book.class);
			sqlQuery.setString(0, bookName)
					.setString(1, bookAuthor)
					.setInteger(2, bookStateId);
		} else {
			sqlQuery=session.createSQLQuery(bsBookMessage).addEntity(Book.class);
			sqlQuery.setString(0, bookName)
					.setString(1, bookAuthor);
		}
		List<Book> list = sqlQuery.list();
		return list.size();
	}

	@Override
	public BookState selectBookState(int bookStateId) {
		// TODO Auto-generated method stub
		
		session=sessionFactory.getCurrentSession();
		SQLQuery sqlQuery=session.createSQLQuery(selectBookStateById).addEntity(BookState.class);
		sqlQuery.setInteger(0, bookStateId);
		BookState bookState=(BookState) sqlQuery.uniqueResult();
		return bookState;
	}

	@Override
	public Boolean insertBook(Book book) {
		// TODO Auto-generated method stub
		
		session=sessionFactory.getCurrentSession();
		SQLQuery sqlQuery=session.createSQLQuery(insertBook).addEntity(Book.class);
		sqlQuery.setString(0, book.getBook_name())
				.setString(1, book.getBook_price())
				.setString(2, book.getBook_author())
				.setString(3, book.getBook_synopsis())
				.setInteger(4, book.getBook_type_id())
				.setBinary(5, book.getBook_img()); 
		int r= sqlQuery.executeUpdate();
		if (r>0) {
			return true;
			
		}else{
			return false;
		}
	}

	@Override
	public Boolean deleteBook(int bookId) {
		// TODO Auto-generated method stub
		
		session=sessionFactory.getCurrentSession();
		SQLQuery sqlQuery=session.createSQLQuery(deleteBook).addEntity(Book.class);
		sqlQuery.setInteger(0, bookId);
		int r= sqlQuery.executeUpdate();
		if (r>0) {
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean setBookState(int bookId, int bookStateId) {
		// TODO Auto-generated method stub
		
		session=sessionFactory.getCurrentSession();
		SQLQuery sqlQuery=session.createSQLQuery(setBookState).addEntity(Book.class);
		sqlQuery.setInteger(0, bookStateId)
				.setInteger(1, bookId);
		int r= sqlQuery.executeUpdate();
		if (r>0) {
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Book selectBook(int bookId) {
		// TODO Auto-generated method stub
		session=sessionFactory.getCurrentSession();
		SQLQuery sqlQuery=session.createSQLQuery(selectBook).addEntity(Book.class);
		sqlQuery.setInteger(0, bookId);
		Book book=(Book) sqlQuery.uniqueResult();
		return book;
	}

	@Override
	public Boolean updateBook(Book book) {
		// TODO Auto-generated method stub
		session=sessionFactory.getCurrentSession();
		SQLQuery sqlQuery=session.createSQLQuery(updateBook).addEntity(Book.class);
		sqlQuery.setString(0, book.getBook_name())
				.setString(1, book.getBook_price())
				.setString(2, book.getBook_author())
				.setString(3, book.getBook_synopsis())
				.setInteger(4, book.getBook_type_id())
				.setBinary(5, book.getBook_img())
				.setInteger(6, book.getBook_id());
		int r= sqlQuery.executeUpdate();
		if (r>0) {
			return true;
		}else{
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Book> selectBookAll() {
		// TODO Auto-generated method stub
		session=sessionFactory.getCurrentSession();
		
		SQLQuery sqlQuery=session.createSQLQuery(selectBookAll).addEntity(Book.class);
		List<Book> list = sqlQuery.list();
		return list;
	}

}

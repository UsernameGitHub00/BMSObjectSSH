package com.wuchuan.po;

import java.util.Date;

/**
 * BBorrow entity. @author MyEclipse Persistence Tools
 */

public class Borrow {

	// Fields

	private String book_name;
	private String user_name;
	private int book_id;
	private int user_id;
	private Date borrow_time;
	private Date return_time;
	private int borrow_day;
	private int borrow_state;
	private String book_author;
	private int book_state_id;
	private int borrow_id;
	
	public Date getReturn_time() {
		return return_time;
	}
	public void setReturn_time(Date return_time) {
		this.return_time = return_time;
	}
	public int getBook_state_id() {
		return book_state_id;
	}
	public void setBook_state_id(int book_state_id) {
		this.book_state_id = book_state_id;
	}
	public String getBook_state() {
		return book_state;
	}
	public void setBook_state(String book_state) {
		this.book_state = book_state;
	}
	private String book_state;
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public Date getBorrow_time() {
		return borrow_time;
	}
	public void setBorrow_time(Date borrow_time) {
		this.borrow_time = borrow_time;
	}
	public int getBorrow_day() {
		return borrow_day;
	}
	public void setBorrow_day(int borrow_day) {
		this.borrow_day = borrow_day;
	}
	public int getBorrow_state() {
		return borrow_state;
	}
	public void setBorrow_state(int borrow_state) {
		this.borrow_state = borrow_state;
	}
	public String getBook_author() {
		return book_author;
	}
	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}
	public int getBorrow_id() {
		return borrow_id;
	}
	public void setBorrow_id(int borrow_id) {
		this.borrow_id = borrow_id;
	}

}
package com.wuchuan.po;

public class Book {
	private int book_id;
	private String book_name;
	private String book_price;
	private int book_state_id;
	private int book_type_id;
	private String book_type;
	private int book_type_id_1;
	private byte[] book_img;
	
	public Book() {
		
	}
	public byte[] getBook_img() {
		return book_img;
	}
	public void setBook_img(byte[] book_img) {
		this.book_img = book_img;
	}
	public int getBook_type_id_1() {
		return book_type_id_1;
	}
	public void setBook_type_id_1(int book_type_id_1) {
		this.book_type_id_1 = book_type_id_1;
	}
	private String book_author;
	public String getBook_type() {
		return book_type;
	}
	public void setBook_type(String book_type) {
		this.book_type = book_type;
	}
	private String book_synopsis;
	
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_price() {
		return book_price;
	}
	public void setBook_price(String book_price) {
		this.book_price = book_price;
	}
	public int getBook_state_id() {
		return book_state_id;
	}
	public void setBook_state_id(int book_state_id) {
		this.book_state_id = book_state_id;
	}
	
	public int getBook_type_id() {
		return book_type_id;
	}
	public void setBook_type_id(int book_type_id) {
		this.book_type_id = book_type_id;
	}
	public String getBook_author() {
		return book_author;
	}
	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}
	public String getBook_synopsis() {
		return book_synopsis;
	}
	public void setBook_synopsis(String book_synopsis) {
		this.book_synopsis = book_synopsis;
	}
}

package com.wuchuan.po;

public class UserInformation {
	
	private int user_information_id;
	
	private int user_id;
	
	private String name;
	
	private String sex;
	
	private String code;
	
	private String number;
	
	private String address;
	
	private String type_name;
	
	private int user_type_id;
	
	private String is_borrow_card;
	
	private String user_name;
	
	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public UserInformation(){
		
	}
	
	public int getUser_type_id() {
		return user_type_id;
	}

	public void setUser_type_id(int user_type_id) {
		this.user_type_id = user_type_id;
	}

	
	
	public String getType_name() {
		return type_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}

	public int getUser_information_id() {
		return user_information_id;
	}

	public void setUser_information_id(int user_information_id) {
		this.user_information_id = user_information_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getIs_borrow_card() {
		return is_borrow_card;
	}

	public void setIs_borrow_card(String is_borrow_card) {
		this.is_borrow_card = is_borrow_card;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
}

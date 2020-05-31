package com.wuchuan.po;

public class User {

	/**
	 * 
	 */

	private int user_id;
	private int user_type_id;
	private String password;
	private String user_name;
	private int user_information_id;
	
	public User(){
		
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int userID) {
		user_id = userID;
	}

	public int getUser_type_id() {
		return user_type_id;
	}

	public int getUser_information_id() {
		return user_information_id;
	}

	public void setUser_information_id(int user_information_id) {
		this.user_information_id = user_information_id;
	}

	
	public void setUser_type_id(int userTypeID) {
		user_type_id = userTypeID;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String passWord) {
		password = passWord;
	}
	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String userName) {
		user_name = userName;
	}

}

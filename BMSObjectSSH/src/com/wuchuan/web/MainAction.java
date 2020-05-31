package com.wuchuan.web;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.wuchuan.po.User;
import com.wuchuan.po.UserInformation;
import com.wuchuan.service.IUserService;
import com.wuchuan.util.MD5Util;

public class MainAction extends ActionSupport implements ModelDriven<User>{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private User user;
	
	private UserInformation userinfor;
	
	private String message;

	private String oldPassword;

	

	@Autowired
	IUserService userService;
	
	//个人信息
	public String information(){
		userinfor = userService.findById(user.getUser_id());
		
		return SUCCESS;
	}

	//前台首页
	public String toIndex(){
		
		return "index";
	}
	
	//修改个人信息
	public String updateUserInfor(){
		if(userinfor.getCode().equals(null)||userinfor.getNumber().equals(null)||userinfor.getName().equals(null)){
			message="请填写完整";
		}else{
			boolean sf=userService.updateUserInfor(userinfor, user);
			if (sf) {
				message="修改成功！";
			}else{
				message="修改失败！";
			}
		}
		return "message";
	}
	
	//修改密码
	public String updatePassword() throws UnsupportedEncodingException{
		String username=URLDecoder.decode(user.getUser_name(),"UTF-8");
		User dbUser = userService.login(username);
		String password =MD5Util.getMD5(oldPassword);
		
		if (dbUser.getPassword().equals(password)) {
			boolean sf=userService.updatePassword(dbUser.getUser_id(), MD5Util.getMD5(user.getPassword()));
			if (sf) {
				message = "修改成功！";
			} else {
				message = "修改失败！";
			}
		} else {
			message = "当前密码不正确！";
		}
		return "main";
	}
	
	//查询用户信息
	public String selectUserInfor(){
		userinfor = userService.findById(user.getUser_id());
		return "selectUserInfor";
	}
	
	//修改用户信息
	public String updateUser(){
		user.setPassword(MD5Util.getMD5(user.getPassword()));
		boolean sf=userService.updateUser(user, userinfor);
		if (sf) {
			message="修改成功！";
		}else{
			message="修改失败！";
		}
		return "message";
	}
	
	//get  --  set
	@Override
	public User getModel() {
		if (user==null) {
			return user = new User();
		} else {
			return user;
		}
	}
	
	public User getUser() {
		return user;
	}
	
	public UserInformation getUserinfor() {
		return userinfor;
	}

	public void setUserinfor(UserInformation userinfor) {
		this.userinfor = userinfor;
	}
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
}

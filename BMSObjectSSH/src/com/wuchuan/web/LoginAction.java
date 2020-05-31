package com.wuchuan.web;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;

import com.wuchuan.util.MD5Util;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.wuchuan.po.User;
import com.wuchuan.service.IUserService;

public class LoginAction extends ActionSupport implements ModelDriven<User>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private User user;
	private String message;
	private String phone;
	private String sex;
	

	

	@Autowired
	IUserService userService;
	
	/*
	 * 登录
	 */
	public String login(){
		User dbUser=userService.login(user.getUser_name());
		if (dbUser!=null) {
			String password = MD5Util.getMD5(user.getPassword());
            if (dbUser.getPassword().equals(password)) {
            	message="登录成功！";
            	user=dbUser;
            	if(user.getUser_id()==3){
            		return "toIndex";
            	}else{
            		return SUCCESS;
            	}
                
            } else {
                message="密码错误！";
                return ERROR;
            }
        } else {
            message="没有此用户！";
            return ERROR;
        }
	}
	
	/*
	 * 注册
	 */
	public String register(){
		//正则验证手机号
		String regex = "^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(17[013678])|(18[0,5-9]))\\d{8}$";
		if (phone.length() != 11) {
			message="手机号应为11位数!";
		} else {
			Pattern p = Pattern.compile(regex);
			Matcher m = p.matcher(phone);
			boolean isMatch = m.matches();
			if (isMatch) {
				Boolean insert = userService.register(user,phone,sex);
				if (insert) {
					message="注册成功！";
				} else {
					message="注册失败！";
				}
			} else {
				message="手机号格式不正确!";
			}
		}
		return "message";
	}
	
	//get and set
	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		if (user==null) {
			return user = new User();
		} else {
			return user;
		}
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
}

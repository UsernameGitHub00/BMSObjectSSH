package com.wuchuan.dao;

import java.util.List;

import com.wuchuan.po.User;
import com.wuchuan.po.UserInformation;

public interface IUserDao {
	User login(String name);
	
	Boolean register(User user,String phone,String sex);
	
	UserInformation findById(int userid);
	
	Boolean updateUserInfor(UserInformation userInfor,User user);
	
	Boolean updatePassword(int userid,String password);
	
	List<UserInformation> bsUserMessage(int startIndex, int pageSize,String userName, String number,String sex, String isHave,String type);

	int getTotalRow(String userName, String number,String sex, String isHave,String type);
	
	Boolean bookCard(int userInforId,String bookCardState);
	
	Boolean deleteUser(int userId,int userInforId);
	
	Boolean setManage(int userId);
	
	Boolean updateUser(User user,UserInformation userInfor);
}

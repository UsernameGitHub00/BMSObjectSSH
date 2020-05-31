package com.wuchuan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wuchuan.dao.IUserDao;
import com.wuchuan.po.User;
import com.wuchuan.po.UserInformation;
import com.wuchuan.service.IUserService;

@Transactional//开启事务
@Service(value="userService")
public class UserServiceImpl implements IUserService{

	@Autowired
	private IUserDao userDao;
	
	@Override
	public User login(String name) {
		// TODO Auto-generated method stub
		return userDao.login(name);
	}

	@Override
	public Boolean register(User user,String phone,String sex) {
		// TODO Auto-generated method stub
		return userDao.register(user,phone,sex);
	}

	@Override
	public UserInformation findById(int userid) {
		// TODO Auto-generated method stub
		return userDao.findById(userid);
	}

	@Override
	public Boolean updateUserInfor(UserInformation userInfor, User user) {
		// TODO Auto-generated method stub
		return userDao.updateUserInfor(userInfor, user);
	}

	@Override
	public Boolean updatePassword(int userid, String password) {
		// TODO Auto-generated method stub
		return userDao.updatePassword(userid, password);
	}

	@Override
	public List<UserInformation> bsUserMessage(int startIndex, int pageSize,
			String userName, String number, String sex, String isHave, String type) {
		// TODO Auto-generated method stub
		return userDao.bsUserMessage(startIndex, pageSize, userName, number, sex, isHave, type);
	}

	@Override
	public int getTotalRow(String userName, String number, String sex, String isHave,
			String type) {
		// TODO Auto-generated method stub
		return userDao.getTotalRow(userName, number, sex, isHave, type);
	}

	@Override
	public Boolean bookCard(int userInforId, String bookCardState) {
		// TODO Auto-generated method stub
		return userDao.bookCard(userInforId, bookCardState);
	}

	@Override
	public Boolean deleteUser(int userId, int userInforId) {
		// TODO Auto-generated method stub
		return userDao.deleteUser(userId, userInforId);
	}

	@Override
	public Boolean setManage(int userId) {
		// TODO Auto-generated method stub
		return userDao.setManage(userId);
	}

	@Override
	public Boolean updateUser(User user, UserInformation userInfor) {
		// TODO Auto-generated method stub
		return userDao.updateUser(user, userInfor);
	}

}

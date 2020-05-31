package com.wuchuan.dao.impl;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.wuchuan.dao.IUserDao;
import com.wuchuan.po.Information;
import com.wuchuan.po.User;
import com.wuchuan.po.UserInformation;
import com.wuchuan.util.MD5Util;

@Repository(value="userDao")//dao层注解
public class UserDaoImpl extends HibernateDaoSupport implements IUserDao{

	@Autowired//spring通过注解自动查找类型为SessionFactory的bean注入
	private SessionFactory sessionFactory;
	
	//Hibernate的session
	private Session session;
	
	private String login="select * from s_user where user_name=?";
	
	private String register="insert into s_user(user_type_id,password,user_name,user_information_id)values(3,?,?,?)";
	
	private String infor = "select * from s_user inner join s_user_type on s_user.user_type_id = s_user_type.user_type_id inner join s_user_information on s_user.user_information_id = s_user_information.user_information_id where s_user.user_id = ?";
	
	private String updateUserInfor="update s_user inner join s_user_information on s_user.user_information_id=s_user_information.user_information_id SET s_user.user_name=?,s_user_information.name=?,s_user_information.sex=?,s_user_information.code=?,s_user_information.number=?,s_user_information.address=? where s_user.user_id=?";
	
	private String updatePassword="update s_user set s_user.password=? where s_user.user_id=?";
	
	private String bsUserMessage="SELECT * FROM s_user inner join s_user_type on s_user.user_type_id = s_user_type.user_type_id INNER JOIN s_user_information ON s_user.user_information_id = s_user_information.user_information_id where user_name LIKE \"%\"?\"%\" AND number LIKE \"%\"?\"%\" AND sex LIKE \"%\"?\"%\" AND is_borrow_card LIKE \"%\"?\"%\" ";
	
	private String bookCard="update s_user_information set s_user_information.is_borrow_card=? where s_user_information.user_information_id=?";
	
	private String deleteUser="delete from s_user where user_id=?";
	
	private String deleteUserInfor="delete from s_user_information where user_information_id=?";
	
	private String setManage="update s_user set s_user.user_type_id=2 where s_user.user_id=?";
	
	private String updateUser="update s_user inner join s_user_information on s_user.user_information_id=s_user_information.user_information_id SET s_user.user_name=?,s_user.password=?,s_user_information.name=?,s_user_information.sex=?,s_user_information.number=? where s_user.user_id=?";
	
	//登录
	@Override
	public User login(String name) {
		// TODO Auto-generated method stub
		session=sessionFactory.getCurrentSession();
		SQLQuery sqlQuery=session.createSQLQuery(login).addEntity(User.class);
		sqlQuery.setString(0, name);
		User user=(User) sqlQuery.uniqueResult();
		return user;
	}

	//注册
	@Override
	public Boolean register(User user,String phone,String sex) {
		// TODO Auto-generated method stub
		int id=0;
		if (sex.equals("")||sex.equals(null)) {
			sex="1";
		}
		session=sessionFactory.getCurrentSession();
		Information information=new Information();
		information.setNumber(phone);
		information.setAddress("");
		information.setCode("");
		information.setIs_borrow_card("1");
		information.setSex(sex);
		information.setName("");
		session.save(information);
		id=information.getUser_information_id(); 
		
		SQLQuery sqlQuery1=session.createSQLQuery(register).addEntity(User.class);
		String password = MD5Util.getMD5(user.getPassword());
		sqlQuery1.setString(0, password);
		sqlQuery1.setString(1, user.getUser_name());
		sqlQuery1.setInteger(2, id);
		int r= sqlQuery1.executeUpdate();
		
		if (r>0) {
			return true;
		}else{
			return false;
		}
	}

	//查询我的信息
	@Override
	public UserInformation findById(int userid) {
		session=sessionFactory.getCurrentSession();
		SQLQuery sqlQuery=session.createSQLQuery(infor).addEntity(UserInformation.class);
		
		sqlQuery.setInteger(0, userid);
		
		UserInformation userinfor = (UserInformation) sqlQuery.uniqueResult();
		return userinfor;
	}

	//修改我的信息
	@Override
	public Boolean updateUserInfor(UserInformation userInfor,User user) {
		// TODO Auto-generated method stub
		
		session=sessionFactory.getCurrentSession();
		
		SQLQuery sqlQuery=session.createSQLQuery(updateUserInfor).addEntity(UserInformation.class);
		sqlQuery.setString(0, user.getUser_name())
				.setString(1, userInfor.getName())
				.setString(2, userInfor.getSex())
				.setString(3, userInfor.getCode())
				.setString(4, userInfor.getNumber())
				.setString(5, userInfor.getAddress())
				.setInteger(6, user.getUser_id());
		int r= sqlQuery.executeUpdate();
		if (r>0) {
			return true;
		} else {
			return false;
		}
	}

	
	//修改密码
	@Override
	public Boolean updatePassword(int userid, String password) {
		// TODO Auto-generated method stub
		
		session=sessionFactory.getCurrentSession();
		
		SQLQuery sqlQuery=session.createSQLQuery(updatePassword).addEntity(User.class);
		
		sqlQuery.setString(0, password)
				.setInteger(1, userid);
		
		int r= sqlQuery.executeUpdate();
		if (r>0) {
			return true;
		} else {
			return false;
		}
	}
	
	//借阅证列表
	@SuppressWarnings("unchecked")
	@Override
	public List<UserInformation> bsUserMessage(int startIndex, int pageSize,
			String userName, String number, String sex, String isHave, String type) {
		// TODO Auto-generated method stub
		session=sessionFactory.getCurrentSession();
		String selectUserMessage="";
		if (type.equals("card")) {
			selectUserMessage=bsUserMessage + "limit ?,?";
		} else if (type.equals("user")) {
			selectUserMessage=bsUserMessage + "and s_user.user_type_id=3 limit ?,?";
		} else if (type.equals("manage")){
			selectUserMessage=bsUserMessage + "and s_user.user_type_id=2 limit ?,?";
		}
		SQLQuery sqlQuery=session.createSQLQuery(selectUserMessage).addEntity(UserInformation.class);
		sqlQuery.setString(0, userName)
				.setString(1, number)
				.setString(2, sex)
				.setString(3, isHave)
				.setInteger(4, startIndex)
				.setInteger(5, pageSize);
		List<UserInformation> list = sqlQuery.list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public int getTotalRow(String userName, String number, String sex, String isHave,
			String type) {
		// TODO Auto-generated method stub
		session=sessionFactory.getCurrentSession();
		String selectUserMessage="";
		if (type.equals("card")) {
			selectUserMessage=bsUserMessage;
		} else if (type.equals("user")) {
			selectUserMessage=bsUserMessage + "and s_user.user_type_id=3";
		} else if (type.equals("manage")){
			selectUserMessage=bsUserMessage + "and s_user.user_type_id=2";
		}
		SQLQuery sqlQuery=session.createSQLQuery(selectUserMessage).addEntity(UserInformation.class);
		sqlQuery.setString(0, userName)
				.setString(1, number)
				.setString(2, sex)
				.setString(3, isHave);
		List<UserInformation> list = sqlQuery.list();
		return list.size();
	}

	
	//借阅证管理
	@Override
	public Boolean bookCard(int userInforId, String bookCardState) {
		// TODO Auto-generated method stub
		
		session=sessionFactory.getCurrentSession();
		
		SQLQuery sqlQuery=session.createSQLQuery(bookCard).addEntity(UserInformation.class);
		sqlQuery.setString(0, bookCardState)
				.setInteger(1, userInforId);
		int r= sqlQuery.executeUpdate();
		if (r>0) {
			return true;
		} else {
			return false;
		}
	}

	
	//删除用户
	@Override
	public Boolean deleteUser(int userId, int userInforId) {
		// TODO Auto-generated method stub
		session=sessionFactory.getCurrentSession();
		session.createSQLQuery(deleteUser).addEntity(User.class);
		SQLQuery sqlQuery=session.createSQLQuery(deleteUser).addEntity(User.class);
		sqlQuery.setInteger(0, userId);
		int r= sqlQuery.executeUpdate();
		if (r>0) {
			SQLQuery sqlQuery1=session.createSQLQuery(deleteUserInfor).addEntity(UserInformation.class);
			sqlQuery1.setInteger(0, userInforId);
			int i= sqlQuery1.executeUpdate();
			if (i>0) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	//设为管理员
	@Override
	public Boolean setManage(int userId) {
		// TODO Auto-generated method stub
		session=sessionFactory.getCurrentSession();
		
		SQLQuery sqlQuery=session.createSQLQuery(setManage).addEntity(UserInformation.class);
		sqlQuery.setInteger(0, userId);
		int r= sqlQuery.executeUpdate();
		if (r>0) {
			return true;
		} else {
			return false;
		}
	}

	
	//编辑用户资料
	@Override
	public Boolean updateUser(User user, UserInformation userInfor) {
		// TODO Auto-generated method stub
		session=sessionFactory.getCurrentSession();
		
		SQLQuery sqlQuery=session.createSQLQuery(updateUser).addEntity(UserInformation.class);
		sqlQuery.setString(0, user.getUser_name())
				.setString(1, user.getPassword())
				.setString(2, userInfor.getName())
				.setString(3, userInfor.getSex())
				.setString(4, userInfor.getNumber())
				.setInteger(5, user.getUser_id());
		int r= sqlQuery.executeUpdate();
		if (r>0) {
			return true;
		} else {
			return false;
		}
	}
	
}

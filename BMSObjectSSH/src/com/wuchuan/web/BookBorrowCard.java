package com.wuchuan.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.wuchuan.po.UserInformation;
import com.wuchuan.service.IUserService;
import com.wuchuan.util.Tools;
import com.wuchuan.vo.Bsgrid;

//借阅证管理
public class BookBorrowCard extends ActionSupport implements ModelDriven<UserInformation>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Autowired
	IUserService userService;
	
	private UserInformation userInfor;

	private String message;
	
	private String curPage;
	
	private String type;

	private String pageSize;
	
	private List<UserInformation> listUserInfor;
	
	private Bsgrid<UserInformation> bsgrid;
	
	
	//借阅证信息列表
	public String bsUserMessage(){
		
		int currentPage=1;
		int pageSizeStr=10;
		if (curPage!=null && Tools.isNum(curPage)) {
			currentPage=Integer.parseInt(curPage);
		}
		if (pageSize!=null &&Tools.isNum(pageSize)) {
			 pageSizeStr=Integer.parseInt(pageSize);
		}
		int startIndex=(currentPage-1)*pageSizeStr;
		listUserInfor = userService.bsUserMessage(startIndex, pageSizeStr, userInfor.getUser_name(), userInfor.getNumber(),userInfor.getSex(),userInfor.getIs_borrow_card(),type);
	    int totalRow=userService.getTotalRow(userInfor.getUser_name(), userInfor.getNumber(),userInfor.getSex(),userInfor.getIs_borrow_card(),type);
		bsgrid = new Bsgrid<UserInformation>();
		bsgrid.setSuccess(true);
		bsgrid.setCurPage(currentPage);
		bsgrid.setTotalRows(totalRow);
		bsgrid.setData(listUserInfor);

		return "bsUserMessage";
	}
	
	//借阅证审核||作废
	public String bookCard(){
		
		boolean sf=userService.bookCard(userInfor.getUser_information_id(), userInfor.getIs_borrow_card());
		
		if (sf) {
			message="设置成功！";
		} else {
			message="设置失败！";
		}
		return "message";
	}
	
	
	//删除用户
	public String deleteUser(){
		
		boolean sf=userService.deleteUser(userInfor.getUser_id(), userInfor.getUser_information_id());
		if (sf) {
			message="success";
		} else {
			message="删除失败！";
		}
		return "message";
	}
	
	//设为管理员
	public String setManage(){
		boolean sf=userService.setManage(userInfor.getUser_id());
		if (sf) {
			message="设置成功！";
		} else {
			message="设置失败！";
		}
		return "message";
	}
	
	//get -- set
	@Override
	public UserInformation getModel() {
		// TODO Auto-generated method stub
		if (userInfor==null) {
			return userInfor = new UserInformation();
		} else {
			return userInfor;
		}
	}
	
	public UserInformation getUserInfor() {
		return userInfor;
	}

	public void setUserInfor(UserInformation userInfor) {
		this.userInfor = userInfor;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getCurPage() {
		return curPage;
	}

	public void setCurPage(String curPage) {
		this.curPage = curPage;
	}

	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public List<UserInformation> getListUserInfor() {
		return listUserInfor;
	}

	public void setListUserInfor(List<UserInformation> listUserInfor) {
		this.listUserInfor = listUserInfor;
	}

	public Bsgrid<UserInformation> getBsgrid() {
		return bsgrid;
	}

	public void setBsgrid(Bsgrid<UserInformation> bsgrid) {
		this.bsgrid = bsgrid;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}

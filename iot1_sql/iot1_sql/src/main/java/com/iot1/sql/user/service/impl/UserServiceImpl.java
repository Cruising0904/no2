package com.iot1.sql.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iot1.sql.user.dao.UserDAO;
import com.iot1.sql.user.dao.dto.UserInfo;
import com.iot1.sql.user.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	
	@Autowired
	private UserDAO ud;
	public UserInfo login(UserInfo user) {
		UserInfo rUser = ud.selectUser(user);
		if(rUser!=null && rUser.getUserPwd().equals(user.getUserPwd())){
			return rUser;
		}
		return null;
	}

	public UserInfo selectUser(UserInfo user) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<UserInfo> selectUserList(UserInfo user) {
		return ud.selectUserList(user);
	}

	public int insertUser(UserInfo user) {
		// TODO Auto-generated method stub
		return 0;
	}
	

	public int updateUser(UserInfo user) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteUser(UserInfo user) {
		// TODO Auto-generated method stub
		return 0;
	}

}

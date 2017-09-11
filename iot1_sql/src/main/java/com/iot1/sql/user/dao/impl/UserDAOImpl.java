package com.iot1.sql.user.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.iot1.sql.user.dao.UserDAO;
import com.iot1.sql.user.dao.dto.UserInfo;

@Repository
public class UserDAOImpl extends SqlSessionDaoSupport  implements UserDAO{

		public UserInfo selectUser(UserInfo user) {
			return this.getSqlSession().selectOne("user.SELECT_USER", user);
		}

		public List<UserInfo> selectUserList(UserInfo user) {
			return this.getSqlSession().selectList("user.SELECT_USER_LIST", user);
		}

		public int insertUser(UserInfo user) {
			return this.getSqlSession().insert("user.INSERT_USER", user);
		}

	
		
		public int deleteUser(UserInfo user) {
			return this.getSqlSession().delete("user.DELETE_USER", user);
		}

		public int updateUser(UserInfo user) {
			return this.getSqlSession().update("user.UPDATE_USER", user);
		}
}

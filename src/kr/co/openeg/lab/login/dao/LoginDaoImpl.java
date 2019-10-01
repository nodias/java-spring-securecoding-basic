package kr.co.openeg.lab.login.dao;

import kr.co.openeg.lab.login.dao.LoginDao;
import kr.co.openeg.lab.login.model.LoginSessionModel;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Component;

public class LoginDaoImpl extends SqlMapClientDaoSupport implements LoginDao {

	@Override
	public LoginSessionModel selectUserId(String userId) {
		return (LoginSessionModel) getSqlMapClientTemplate().queryForObject("login.loginCheck1", userId);

	}	
	@Override
	public LoginSessionModel selectUserId(String userId, String userPw) {
		return (LoginSessionModel) getSqlMapClientTemplate().queryForObject("login.loginCheck2",                
				                          new LoginSessionModel(userId, userPw, null, false));
	}	
}

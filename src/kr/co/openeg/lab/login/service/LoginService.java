package kr.co.openeg.lab.login.service;

import javax.annotation.Resource;

import kr.co.openeg.lab.login.dao.LoginDao;
import kr.co.openeg.lab.login.model.LoginSessionModel;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
	
	@Resource(name="loginDao")
	private LoginDao dao;
	
	public LoginSessionModel checkUserId(String userId) {
		return dao.selectUserId(userId);		
	}	

	public LoginSessionModel checkUserId(String userId, String userPw) {
		return dao.selectUserId(userId, userPw);
	}	
}

package kr.co.openeg.lab.login.dao;

import kr.co.openeg.lab.login.model.LoginSessionModel;

public interface LoginDao {
	
	LoginSessionModel selectUserId(String userId);
	LoginSessionModel selectUserId(String userId, String userPw);

}

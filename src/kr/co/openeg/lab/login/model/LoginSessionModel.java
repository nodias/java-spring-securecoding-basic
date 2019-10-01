package kr.co.openeg.lab.login.model;


public class LoginSessionModel {
	private String userId;
	private String userPw;
	private String userName;
	private boolean auth;
	
	public LoginSessionModel() {}
	public LoginSessionModel(String userId, String userPw, String userName,
			boolean auth) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.auth = auth;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public boolean isAuth() {
		return auth;
	}
	public void setAuth(boolean auth) {
		this.auth = auth;
	}	
}

package kr.co.openeg.lab.login.model;

public class LoginHistory {
	private int idx;
	private String userId;
	private int retry;
	private long lastFailedLogin;
	private long lastSuccessedLogin;
	private String clientIP;
	public LoginHistory(){}
	public LoginHistory(int idx, String userId, int retry, long lastFailedLogin, long lastSuccessedLogin,
			String clientIP) {
		super();
		this.idx = idx;
		this.userId = userId;
		this.retry = retry;
		this.lastFailedLogin = lastFailedLogin;
		this.lastSuccessedLogin = lastSuccessedLogin;
		this.clientIP = clientIP;
	}
	/**
	 * @return the idx
	 */
	public int getIdx() {
		return idx;
	}
	/**
	 * @param idx the idx to set
	 */
	public void setIdx(int idx) {
		this.idx = idx;
	}
	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}
	/**
	 * @return the retry
	 */
	public int getRetry() {
		return retry;
	}
	/**
	 * @param retry the retry to set
	 */
	public void setRetry(int retry) {
		this.retry = retry;
	}
	/**
	 * @return the lastFailedLogin
	 */
	public long getLastFailedLogin() {
		return lastFailedLogin;
	}
	/**
	 * @param lastFailedLogin the lastFailedLogin to set
	 */
	public void setLastFailedLogin(long lastFailedLogin) {
		this.lastFailedLogin = lastFailedLogin;
	}
	/**
	 * @return the lastSuccessedLogin
	 */
	public long getLastSuccessedLogin() {
		return lastSuccessedLogin;
	}
	/**
	 * @param lastSuccessedLogin the lastSuccessedLogin to set
	 */
	public void setLastSuccessedLogin(long lastSuccessedLogin) {
		this.lastSuccessedLogin = lastSuccessedLogin;
	}
	/**
	 * @return the clientIp
	 */
	public String getClientIP() {
		return clientIP;
	}
	/**
	 * @param clientIp the clientIp to set
	 */
	public void setClientIP(String clientIP) {
		this.clientIP = clientIP;
	}
	
	
}
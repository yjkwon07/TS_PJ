package com.duojj.dto;

import java.util.Date;

/*
 * VO패키지가 있는데 DTO를 따로 만든 이유
 * 두개다 공통적으로 데이터를 담아서 전달하는 역할을 하지만
 * VO는 데이터베이스의 데이터를 처리
 * DTO는 화면에서 전달되는 데이터를 처리를 위함
 * Spring MVC를 이용하는 경우에 DTO 검증을 위한 처리
 */

public class LoginDTO {
	private String user_id;
	private String user_pw;
	private boolean useCookie; // It has not the DB Schema, Only process the Keep Login
	private String user_sessionkey;
	private Date user_sessionlimit;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public boolean isUseCookie() {
		return useCookie;
	}

	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}

	public Date getUser_sessionlimit() {
		return user_sessionlimit;
	}

	public void setUser_sessionlimit(Date user_sessionlimit) {
		this.user_sessionlimit = user_sessionlimit;
	}

	public String getUser_sessionkey() {
		return user_sessionkey;
	}

	public void setUser_sessionkey(String user_sessionkey) {
		this.user_sessionkey = user_sessionkey;
	}
}

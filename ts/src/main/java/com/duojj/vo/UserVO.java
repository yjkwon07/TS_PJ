package com.duojj.vo;

import java.util.Date;

public class UserVO {
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_birth;
	private String user_image;
	private int user_sex;
	private String user_status;
	private String user_youtube;
	private int user_auth;
	private Date user_regdate;
	private Date user_moddate;
	private String user_sessionkey;
	private Date user_sessionlimit;
	private Double user_rating;
	
	public Double getUser_rating() {
		return user_rating;
	}
	public void setUser_rating(Double user_rating) {
		this.user_rating = user_rating;
	}
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
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
	public String getUser_image() {
		return user_image;
	}
	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}
	public int getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(int user_sex) {
		this.user_sex = user_sex;
	}
	public String getUser_status() {
		return user_status;
	}
	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}
	public String getUser_youtube() {
		return user_youtube;
	}
	public void setUser_youtube(String user_youtube) {
		this.user_youtube = user_youtube;
	}
	public int getUser_auth() {
		return user_auth;
	}
	public void setUser_auth(int user_auth) {
		this.user_auth = user_auth;
	}
	public Date getUser_regdate() {
		return user_regdate;
	}
	public void setUser_regdate(Date user_regdate) {
		this.user_regdate = user_regdate;
	}
	public Date getUser_moddate() {
		return user_moddate;
	}
	public void setUser_moddate(Date user_moddate) {
		this.user_moddate = user_moddate;
	}
	public String getUser_sessionkey() {
		return user_sessionkey;
	}
	public void setUser_sessionkey(String user_sessionkey) {
		this.user_sessionkey = user_sessionkey;
	}
	public Date getUser_sessionlimit() {
		return user_sessionlimit;
	}
	public void setUser_sessionlimit(Date user_sessionlimit) {
		this.user_sessionlimit = user_sessionlimit;
	}

}

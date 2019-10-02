package com.duojj.vo;

import org.springframework.web.multipart.MultipartFile;

public class FileImageVO {
	private MultipartFile file;
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	private String class_id;
	private String user_id;
	private String image_name;
	private String image_date;
	public String getImage_date() {
		return image_date;
	}
	public void setImage_date(String image_date) {
		this.image_date = image_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getImage_name() {
		return image_name;
	}
	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
}

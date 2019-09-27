package com.duojj.dto;

import org.springframework.web.multipart.MultipartFile;

public class FileImageDTO {
	private MultipartFile file;
	private String class_id;
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
}

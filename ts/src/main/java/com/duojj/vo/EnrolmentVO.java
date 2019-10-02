package com.duojj.vo;

import java.util.Date;

public class EnrolmentVO {
	private int enrolment_id;
	private String user_id;
	private String enrolment_classname;
	private String enrolment_review;
	private Date enrolment_reviewdate;
	private int enrolment_class_id;
	private double enrolment_rating;
	public int getEnrolment_id() {
		return enrolment_id;
	}
	public void setEnrolment_id(int enrolment_id) {
		this.enrolment_id = enrolment_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getEnrolment_classname() {
		return enrolment_classname;
	}
	public void setEnrolment_classname(String enrolment_classname) {
		this.enrolment_classname = enrolment_classname;
	}
	public String getEnrolment_review() {
		return enrolment_review;
	}
	public void setEnrolment_review(String enrolment_review) {
		this.enrolment_review = enrolment_review;
	}
	public Date getEnrolment_reviewdate() {
		return enrolment_reviewdate;
	}
	public void setEnrolment_reviewdate(Date enrolment_reviewdate) {
		this.enrolment_reviewdate = enrolment_reviewdate;
	}
	public int getEnrolment_class_id() {
		return enrolment_class_id;
	}
	public void setEnrolment_class_id(int enrolment_class_id) {
		this.enrolment_class_id = enrolment_class_id;
	}
	public double getEnrolment_rating() {
		return enrolment_rating;
	}
	public void setEnrolment_rating(double enrolment_rating) {
		this.enrolment_rating = enrolment_rating;
	}
}

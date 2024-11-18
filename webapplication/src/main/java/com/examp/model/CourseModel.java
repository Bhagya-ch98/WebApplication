package com.examp.model;

public class CourseModel {
	private int Cid;
	private String coursename;
	private int coursefee;
	private int courseduration;
	
	public CourseModel() {}
	
	public CourseModel(String coursename , int coursefee , int courseduration )
	{
		this.coursename=coursename;
		this.coursefee=coursefee;
		this.courseduration=courseduration;
	}
	public CourseModel(int Cid , String coursename , int coursefee , int courseduration )
	{
		this.Cid=Cid;
		this.coursename=coursename;
		this.coursefee=coursefee;
		this.courseduration=courseduration;
	}

	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public int getCoursefee() {
		return coursefee;
	}

	public void setCoursefee(int coursefee) {
		this.coursefee = coursefee;
	}

	public int getCourseduration() {
		return courseduration;
	}

	public void setCourseduration(int courseduration) {
		this.courseduration = courseduration;
	}

	

	public int getCid() {
		return Cid;
	}

	public void setCid(int cid) {
		Cid = cid;
	}

	
}

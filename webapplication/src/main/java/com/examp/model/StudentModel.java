package com.examp.model;

public class StudentModel {
	private int StudentId;
	private String firstname;
	private String lastname;
	private long mobileno;
	private String mailid;
	private String password;
	private String branch;
	private int yearofpass;
	private int courseid;
	
	public StudentModel() {}
	
	public StudentModel(int StudentId,String firstname,String lastname,long mobileno,String mailid,String password,String branch,int yearofpass,int courseid)
	{
		this.StudentId=StudentId;
		this.firstname=firstname;
		this.lastname=lastname;
		this.mobileno=mobileno;
		this.mailid=mailid;
		this.password=password;
		this.branch=branch;
		this.yearofpass=yearofpass;
		this.courseid=courseid;
		
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public long getMobileno() {
		return mobileno;
	}

	public void setMobileno(long mobileno) {
		this.mobileno = mobileno;
	}

	public String getMailid() {
		return mailid;
	}

	public void setMailid(String mailid) {
		this.mailid = mailid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public int getYearofpass() {
		return yearofpass;
	}

	public void setYearofpass(int yearofpass) {
		this.yearofpass = yearofpass;
	}

	public int getCourseid() {
		return courseid;
	}

	public void setCourseid(int courseid) {
		this.courseid = courseid;
	}

	public int getStudentId() {
		return StudentId;
	}

	public void setStudentId(int studentId) {
		StudentId = studentId;
	}

	
	
}

package com.examp.model;

public class FacultyModel {
	private int FacultyId;
	private String firstname;
	private String lastname;
	private long mobileno ;
	private String mailid ;
	private String password ;
	private String qualification;
	private int yearofexp ;
	private int courseid ;
	
	public FacultyModel( )
	{
		
	}
	
	public FacultyModel(int FacultyId, String firstname,String lastname,long mobileno,String mailid ,String password,String qualification,int yearofexp,int courseid )
	{
		this.FacultyId=FacultyId;
		this.firstname=firstname;
		this.lastname=lastname;
		this.mobileno=mobileno;
		this.mailid=mailid;
		this.password=password;
		this.qualification=qualification;
		this.yearofexp=yearofexp;
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

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public int getYearofexp() {
		return yearofexp;
	}

	public void setYearofexp(int yearofexp) {
		this.yearofexp = yearofexp;
	}

	public int getCourseid() {
		return courseid;
	}

	public void setCourseid(int courseid) {
		this.courseid = courseid;
	}

	public int getFacultyId() {
		return FacultyId;
	}

	public void setFacultyId(int FacultyId) {
		this.FacultyId = FacultyId;
	}

}

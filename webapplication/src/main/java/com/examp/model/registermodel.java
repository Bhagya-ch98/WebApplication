package com.examp.model;

public class registermodel {
	private int userid;
	private String password;
	private String role;
	
	public registermodel() {}
	
	public registermodel(int userid ,String password , String role) 
	{
		this.userid=userid;
		this.password = password;
		this.role=role;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}
		

	
	
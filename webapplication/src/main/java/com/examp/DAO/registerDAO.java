package com.examp.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.examp.model.registermodel;

public class registerDAO {
	public String loginData(registermodel rm) {
		String status="failure";
		System.out.println("dao data: "+rm.getUserid());
		int userid=rm.getUserid();
		String password=rm.getPassword();
		String role=rm.getRole();
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
		
			 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapplication", "root", "root");
			 if(role.equals("ADMIN"))
			 {
				 PreparedStatement ps = con.prepareStatement("select * from Admin where AdminId = ? and Apassword=?");
				 ps.setInt(1,userid);
				 ps.setString(2,password);
				 ResultSet rs=ps.executeQuery();
				 while(rs.next())
				 {
					 status="ASUCCESS";
				 }
			 }
			 else if (role.equals("FACULTY"))
			 {
	
					 PreparedStatement ps = con.prepareStatement("select * from Faculty where FacultyId = ? and Fpassword=?");
					 ps.setInt(1,userid);
					 ps.setString(2,password);
					 ResultSet rs=ps.executeQuery();
					 while(rs.next())
					 {
						 status="FSUCCESS";
					 }
				 
			 }
			 else
			 {
				 PreparedStatement ps = con.prepareStatement("select * from Student where StudentId= ? and SPassword=?");
				 ps.setInt(1,userid);
				 ps.setString(2,password);
				 ResultSet rs=ps.executeQuery();
				 while(rs.next())
				 {
					 status="SSUCCESS";
				 
				 }
			 }
				 
			 
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return status;
	}
}

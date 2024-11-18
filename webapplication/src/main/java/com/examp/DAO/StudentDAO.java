package com.examp.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.examp.model.StudentModel;

public class StudentDAO {
	public String insertstudent(StudentModel sm)
	{
		String status="failure";
		String firstname=sm.getFirstname();
		String lastname=sm.getLastname();
		long mobileno=sm.getMobileno();
		String mailid=sm.getMailid();
		String password=sm.getPassword();
		String branch=sm.getBranch();
		int yearofpass=sm.getYearofpass();
		int courseid =sm.getCourseid();
		try 
		{
					
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapplication", "root", "root");
					PreparedStatement ps = con.prepareStatement("insert into Student(Sfname,Slname,SmobileNo,Sbranch,Sgmail,SYearofPassout,SPassword,Cid) values(?,?,?,?,?,?,?,?)");
					ps.setString(1,firstname);
					ps.setString(2,lastname);
					ps.setLong(3,mobileno);
					ps.setString(4,branch);
					ps.setString(5,mailid);
					ps.setInt(6,yearofpass);
					ps.setString(7,password);
					ps.setInt(8,courseid);
					System.out.println("error");
					int p=ps.executeUpdate();
					if(p>0)
					{
						status="SUCCESS";
					}
					
		}
		catch(Exception e) 
		{
			System.out.println(e);
		}
		
		return status;
		
	}
	public List<StudentModel> allstudent() {
		List<StudentModel> students = new ArrayList<StudentModel>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapplication", "root", "root");
			PreparedStatement ps = con.prepareStatement("Select * from Student");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				StudentModel sd = new StudentModel();
				sd.setStudentId(rs.getInt(1));
				sd.setFirstname(rs.getString(2));
				sd.setLastname(rs.getString(3));
				sd.setMobileno(rs.getLong(4));
				sd.setBranch(rs.getString(5));
				sd.setMailid(rs.getString(6));
				sd.setYearofpass(rs.getInt(7));
				sd.setPassword(rs.getString(8));
				sd.setCourseid(rs.getInt(9));
				
				students.add(sd);
				
			}
		}
		
		catch(Exception e) 
		{
			System.out.println(e);
		}
		return students ;
	}
	
	public StudentModel getElementByStudentId(int StudentId1) {
		StudentModel student = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapplication", "root", "root");
			PreparedStatement ps = con.prepareStatement("Select * from Student where StudentId=?");
			ps.setInt(1,StudentId1);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				
				int StudentId = rs.getInt(1);
				String firstname = rs.getString(2);
				String lastname = rs.getString(3);
				long mobileno = rs.getLong(4);
				String mailid = rs.getString(6);
				String password = rs.getString(8);
				String branch = rs.getString(5);
				int yearofpass = rs.getInt(7);
				int courseid = rs.getInt(9);
				student = new StudentModel(StudentId,firstname,lastname,mobileno,mailid,password,branch,yearofpass,courseid);
			}
		}
		catch(Exception e) 
		{
			System.out.println(e);
		}
		
		return student;
		
	}

	
	public String editStudent(StudentModel student) {
		String status="failure";
		try 
		{
					
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapplication", "root", "root");
			PreparedStatement ps = con.prepareStatement("Update Student set Sfname=?,Slname=?,SmobileNo=?,Sbranch=?,Sgmail=?,SYearofPassout=?,SPassword=?,Cid=? where StudentId=?");
			ps.setString(1,student.getFirstname());
			ps.setString(2,student.getLastname());
			ps.setLong(3,student.getMobileno());
			ps.setString(4,student.getBranch());
			ps.setString(5,student.getMailid());
			ps.setInt(6,student.getYearofpass());
			ps.setString(7,student.getPassword());
			ps.setInt(8,student.getCourseid());
			ps.setInt(9,student.getStudentId());
			int n=ps.executeUpdate();
			if(n>0) {
				status="updatesuccess";
			}
		}
		
		catch(Exception e) 
		{
			System.out.println(e);
		}
		
		return status;
	}
	
	public String deleteStudent(int Sid) {
		String status="failure";
		try 
		{
					
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapplication", "root", "root");
			PreparedStatement ps = con.prepareStatement("Delete from Student where StudentId=?");
			ps.setInt(1,Sid);
			 int n=ps.executeUpdate();
	         if(n>0) {
	        	 status="deletesuccess";
	         }
		}
		catch(Exception e) 
		{
			System.out.println(e);
		}
		
		return status;
	}
	
}



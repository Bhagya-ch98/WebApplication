package com.examp.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.examp.model.FacultyModel;

public class FacultyDAO {
	public String insertfaculty(FacultyModel fm)
	{
		String status="failure";
		String firstname=fm.getFirstname();
		String lastname=fm.getLastname();
		long mobileno=fm.getMobileno();
		String mailid=fm.getMailid();
		String password=fm.getPassword();
		String qualification=fm.getQualification();
		int yearofexp=fm.getYearofexp();
		int courseid =fm.getCourseid();
		try 
		{
					
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapplication", "root", "root");
			PreparedStatement ps = con.prepareStatement("insert into Faculty(Ffname,Flname,Fmobileno,Fgmail,Fpassword,Fqualification,Fyearsofexperience,Cid) values (?,?,?,?,?,?,?,?)");
			ps.setString(1,firstname);
			ps.setString(2,lastname);
			ps.setLong(3,mobileno);
			ps.setString(4,mailid);
			ps.setString(5,password);
			ps.setString(6,qualification);
			ps.setInt(7,yearofexp);
			ps.setInt(8,courseid);
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
	
	public List<FacultyModel> allfaculty() {
		
		List<FacultyModel> facultys = new ArrayList<FacultyModel>();
		System.out.println("All Faculty ------------------------------------------------");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapplication", "root", "root");
			PreparedStatement ps = con.prepareStatement("Select * from Faculty");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				FacultyModel fd = new FacultyModel();
				fd.setFacultyId(rs.getInt(1));
				fd.setFirstname(rs.getString(2));
				fd.setLastname(rs.getString(3));
				fd.setMobileno(rs.getLong(4));
				fd.setMailid(rs.getString(5));
				fd.setPassword(rs.getString(6));
				fd.setQualification(rs.getString(7));
				fd.setYearofexp(rs.getInt(8));
				fd.setCourseid(rs.getInt(9));
				facultys.add(fd);

			}
		}
		catch(Exception e) 
		{
			System.out.println(e);
		}
		return facultys;
		
	}
	
	public FacultyModel getElementByFacultyid(int Fid) {
		
		FacultyModel faculty = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapplication", "root", "root");
			PreparedStatement ps = con.prepareStatement("Select * from Faculty where FacultyId=?");
			ps.setInt(1,Fid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int FacultyId = rs.getInt(1);
				String firstname = rs.getString(2);
				String lastname = rs.getString(3);
				long mobileno = rs.getLong(4);
				String mailid = rs.getString(5);
				String password = rs.getString(6);
				String qualification = rs.getString(7);
				int yearofexp = rs.getInt(8);
				int courseid = rs.getInt(9);
				faculty = new FacultyModel(FacultyId,firstname,lastname,mobileno,mailid,password,qualification,yearofexp,courseid);
			}
		}
		catch(Exception e) 
		{
			System.out.println(e);
		}
		
		return faculty;
	}
	
	public String editFaculty(FacultyModel faculty) {
		String status="failure";
		System.out.println("getting from dao=========================================");
		try 
		{			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapplication", "root", "root");
			PreparedStatement ps = con.prepareStatement("Update Faculty set Ffname=?,Flname=?,Fmobileno=?,Fgmail=?,Fpassword=?,Fqualification=?,Fyearsofexperience=?,Cid=? where FacultyId=?");
			ps.setString(1,faculty.getFirstname());
			ps.setString(2, faculty.getLastname());
			ps.setLong(3,faculty.getMobileno());
			ps.setString(4,faculty.getMailid());
			ps.setString(5,faculty.getPassword());
			ps.setString(6,faculty.getQualification());
			ps.setInt(7, faculty.getYearofexp());
			ps.setInt(8,faculty.getCourseid());
			ps.setInt(9,faculty.getFacultyId());
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
	
	public String deleteFaculty(int Fid) {
		String status="failure";
		try 
		{
					
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapplication", "root", "root");
			PreparedStatement ps = con.prepareStatement("Delete  from Faculty where FacultyId=?");
			ps.setInt(1,Fid);
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

	
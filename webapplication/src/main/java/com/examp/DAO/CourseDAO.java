package com.examp.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.examp.model.CourseModel;

public class CourseDAO {
	public String Course(CourseModel cm)
	{
		String status="failure";
		String coursename=cm.getCoursename();
		int coursefee=cm.getCoursefee();
		int courseduration=cm.getCourseduration();
		
	try 
	{
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapplication", "root", "root");
				PreparedStatement ps = con.prepareStatement("insert into Course(Cname,Cfee,Cduration) values (?,?,?)");
				ps.setString(1,coursename);
				ps.setInt(2,coursefee);
				ps.setInt(3,courseduration);
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
	public  List<CourseModel> allCourses()
	{
		List<CourseModel> courses = new ArrayList<CourseModel>();
		try 
		{
					
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapplication", "root", "root");
					PreparedStatement ps = con.prepareStatement("select * from Course");
					ResultSet rs = ps.executeQuery();
					while (rs.next()) 
					{
						CourseModel cm =new CourseModel();
						cm.setCid(rs.getInt(1));
						cm.setCoursename(rs.getString(2));
						cm.setCoursefee(rs.getInt(3));
						cm.setCourseduration(rs.getInt(4));
						courses.add(cm);					
						} 
					
		}
		catch(Exception e) 
		{
			System.out.println(e);
		}
		return courses;
			
		
	}
	public CourseModel getElementByCid(int Cidf) {
		CourseModel course=null;
		try 
		{		
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapplication", "root", "root");
			PreparedStatement ps = con.prepareStatement("Select * from Course where Cid=?");
			ps.setInt(1, Cidf);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int Cid= rs.getInt("Cid");
				String coursename= rs.getString("Cname");
				int coursefee=rs.getInt("Cfee");
				int courseduration=rs.getInt("Cduration");
				course=new CourseModel(Cid,coursename,coursefee,courseduration);
			}
			
		}
		catch(Exception e) 
		{
			System.out.println(e);
		}
		return course;
		
	}
	
	public String editCourse(CourseModel course) {
		String status="failure";
		try 
		{		
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapplication", "root", "root");
			PreparedStatement ps = con.prepareStatement("Update Course set Cname=?,Cfee=?,Cduration=? where Cid=?");
			ps.setString(1,course.getCoursename());
			ps.setInt(2, course.getCoursefee());
			ps.setInt(3,course.getCourseduration());
			ps.setInt(4,course.getCid());
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

	
	}



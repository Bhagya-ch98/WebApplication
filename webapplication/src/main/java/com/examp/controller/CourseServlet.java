package com.examp.controller;

import java.io.IOException;

import com.examp.DAO.CourseDAO;
import com.examp.model.CourseModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/courseregister")
public class CourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("welcome Course !!!");
		String coursename = request.getParameter("coursename");
		int coursefee =Integer.parseInt(request.getParameter("coursefee"));
		int courseduration =Integer.parseInt(request.getParameter("courseduration"));
		
		CourseModel cm = new CourseModel();
		cm.setCoursename(coursename);
		cm.setCoursefee(coursefee);
		cm.setCourseduration(courseduration);
		
		CourseDAO cd= new CourseDAO();
		String status = cd.Course(cm);
		
		if(status.equals("SUCCESS")) 
		{
	        RequestDispatcher rd1 = request.getRequestDispatcher("/adminpage.jsp");  
	        rd1.include(request, response);  
		}
		else
		{
			RequestDispatcher rd1 = request.getRequestDispatcher("/course.jsp"); 
			request.setAttribute("error", "Something went wrong!!!");
	        rd1.include(request, response);
		}

		

	}
	

}

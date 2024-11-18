package com.examp.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.examp.DAO.StudentDAO;
import com.examp.model.StudentModel;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/studentregister")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("welcome Student!!!");
		
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		long mobileno = Long.parseLong(request.getParameter("mobileno"));
		String branch = request.getParameter("branch");
		String mailid = request.getParameter("mailid");
		int yearofpass = Integer.parseInt(request.getParameter("yearofpass"));
		String password = request.getParameter("password");
		int courseid = Integer.parseInt(request.getParameter("courseid"));
		
		StudentModel sm=new StudentModel();
		sm.setFirstname(firstname);
		sm.setLastname(lastname);
		sm.setMobileno(mobileno);
		sm.setBranch(branch);
		sm.setMailid(mailid);
		sm.setYearofpass(yearofpass);
		sm.setPassword(password);
		sm.setCourseid(courseid);
		
		StudentDAO sd= new StudentDAO();
		
		String status=sd.insertstudent(sm);
		if(status.equals("SUCCESS")) 
		{
	        RequestDispatcher rd1 = request.getRequestDispatcher("/adminpage.jsp");  
	        rd1.include(request, response);  
		}
		else
		{
			RequestDispatcher rd1 = request.getRequestDispatcher("/studentregistration.jsp");
			request.setAttribute("error", "Something went wrong!!!");
	        rd1.include(request, response); 
		}
		
		
	}

}

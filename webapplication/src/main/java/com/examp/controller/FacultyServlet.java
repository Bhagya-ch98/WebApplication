package com.examp.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.examp.DAO.FacultyDAO;
import com.examp.model.FacultyModel;

/**
 * Servlet implementation class FacultyServlet
 */
@WebServlet("/facultyregister")
public class FacultyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("welcome Faculty!!!");
		
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		long mobileno = Long.parseLong(request.getParameter("mobileno"));
		String mailid = request.getParameter("mailid");
		String password = request.getParameter("password");
		String qualification = request.getParameter("qualification");
		int yearofexp = Integer.parseInt(request.getParameter("yearofexp"));
		int courseid = Integer.parseInt(request.getParameter("courseid"));
		
		FacultyModel fm= new FacultyModel();
		fm.setFirstname(firstname);
		fm.setLastname(lastname);
		fm.setMobileno(mobileno);
		fm.setMailid(mailid);
		fm.setPassword(password);
		fm.setQualification(qualification);
		fm.setYearofexp(yearofexp);
		fm.setCourseid(courseid);
		
		FacultyDAO fd=new FacultyDAO();
		
		String status=fd.insertfaculty(fm);
		if(status.equals("SUCCESS")) 
		{
	        RequestDispatcher rd1 = request.getRequestDispatcher("/adminpage.jsp");  
	        rd1.include(request, response);  
		}
		else
		{
			RequestDispatcher rd1 = request.getRequestDispatcher("/facultyregistration.jsp");
			request.setAttribute("error", "Something went wrong!!!");
	        rd1.include(request, response); 
		}
		
	}

}

package com.examp.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.examp.DAO.registerDAO;
import com.examp.model.registermodel;


@WebServlet("/loginpage")
public class myservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("welcome!!!");
		int userid = Integer.parseInt(request.getParameter("userid"));
		String password = request.getParameter("password");
		String role= request.getParameter("role");
		
		
		registermodel rm = new registermodel();
		rm.setPassword(password);
		rm.setRole(role);
		rm.setUserid(userid);
		
		registerDAO rd=new registerDAO();
		
		String status = rd.loginData(rm);
		
		if(status.equals("ASUCCESS")) 
		{
	        RequestDispatcher rd1 = request.getRequestDispatcher("/adminpage.jsp");  
	        rd1.include(request, response);  
		}
		
		else if(status.equals("FSUCCESS")) 
		{
	        RequestDispatcher rd1 = request.getRequestDispatcher("/faculty.jsp");  
	        rd1.include(request, response);  
		}
		else if(status.equals("SSUCCESS")) 
		{
	        RequestDispatcher rd1 = request.getRequestDispatcher("/student.jsp");  
	        rd1.include(request, response);  
		}
		else
		{
			RequestDispatcher rd1 = request.getRequestDispatcher("/loginpage.jsp");  
			request.setAttribute("error", "Something went wrong!!!");
	        rd1.include(request, response); 
		}
		
		
	}

}

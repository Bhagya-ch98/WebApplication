package com.examp.controller;

import java.io.IOException;
import java.util.List;

import com.examp.DAO.CourseDAO;
import com.examp.model.CourseModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ulistofcourses")
public class stupagelistofcourses extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		{
			CourseDAO cd = new CourseDAO();
			List<CourseModel> slistCourse = cd.allCourses();
			request.setAttribute("slistCourse",slistCourse);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/stupagelistofcourses.jsp");
			dispatcher.forward(request, response);
			
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}

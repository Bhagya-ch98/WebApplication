package com.examp.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.examp.DAO.CourseDAO;
import com.examp.model.CourseModel;

@WebServlet("/listofcourses")
public class listofcourses extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void  doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		{
			CourseDAO cd = new CourseDAO();
			List<CourseModel> listCourse = cd.allCourses();
			request.setAttribute("listCourse",listCourse);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/listofcourses.jsp");
			dispatcher.forward(request, response);
			
		}

		
	}

}

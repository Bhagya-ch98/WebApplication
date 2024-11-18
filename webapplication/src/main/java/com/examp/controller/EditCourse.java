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

@WebServlet("/Course")
public class EditCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;

	CourseDAO ecd = new CourseDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int Cid=Integer.parseInt(request.getParameter("Cid"));
        if(Cid!=0) {
        	CourseModel ecm=ecd.getElementByCid(Cid);
        	if(ecm!=null) {
        		request.setAttribute("editCourse",ecm);
        		 request.getRequestDispatcher("Editcourse.jsp").forward(request, response); 
        	}
        	 else {
             	String errorMessage="Course not found,please try again!!";
             	request.setAttribute("errorMessage", errorMessage);
        }
        	List<CourseModel> courseList=ecd.allCourses();
        	request.setAttribute("listCourse", courseList);
        	
        	RequestDispatcher dispatcher = request.getRequestDispatcher("listofcourses.jsp");
	        dispatcher.forward(request, response);
        	
        }
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int Cid=Integer.parseInt(request.getParameter("Cid"));
		String coursename = request.getParameter("coursename");
		int coursefee =Integer.parseInt(request.getParameter("coursefee"));
		int courseduration =Integer.parseInt(request.getParameter("courseduration"));
		
		CourseModel course= new CourseModel();
		course.setCid(Cid);
		course.setCoursename(coursename);
		course.setCoursefee(coursefee);
		course.setCourseduration(courseduration);
		
		String status=ecd.editCourse(course);
		if(status.equals("updatesuccess")) {
			request.setAttribute("CidUpdated",Cid);
		}
		 else {
	        	String updatemessage = "Row not updated,Something Went Wrong!!!";
				request.setAttribute("updatemessage", updatemessage);
	        }
		List<CourseModel> courseList=ecd.allCourses();
    	request.setAttribute("listCourse", courseList);
    	
    	RequestDispatcher dispatcher = request.getRequestDispatcher("listofcourses.jsp");
        dispatcher.forward(request, response);
		doGet(request, response);
	}

}

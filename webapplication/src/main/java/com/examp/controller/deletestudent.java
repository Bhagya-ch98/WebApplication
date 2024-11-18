package com.examp.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.examp.DAO.StudentDAO;
import com.examp.model.StudentModel;

@WebServlet("/deletestu")
public class deletestudent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		StudentDAO esd = new StudentDAO();
		int StudentId = Integer.parseInt(request.getParameter("StudentId"));
		String status = esd.deleteStudent(StudentId);
		if(status.equals("deletesuccess"))
		{
			request.setAttribute("Siddeleted",StudentId);
		}
		 else {
         	String deletemessage = "Row not deleted,Something Went Wrong!!!";
			request.setAttribute("deletemessage", deletemessage);
         }
		List<StudentModel> studentList = esd.allstudent();
    	request.setAttribute("listStudent",studentList );
    	
    	RequestDispatcher dispatcher = request.getRequestDispatcher("listofstudents.jsp");
        dispatcher.forward(request, response);
		
		
	}

}

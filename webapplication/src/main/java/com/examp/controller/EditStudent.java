package com.examp.controller;

import java.io.IOException;
import java.util.List;

import com.examp.DAO.StudentDAO;
import com.examp.model.StudentModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Student")
public class EditStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	StudentDAO esd = new StudentDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int StudentId = Integer.parseInt(request.getParameter("StudentId"));
		if(StudentId!= 0) {
			StudentModel esm = esd.getElementByStudentId(StudentId);
        	if(esm!=null) {
        		request.setAttribute("editStudent",esm);
        		 request.getRequestDispatcher("Editstudent.jsp").forward(request, response); 
        	}
        	 else {
             	String errorMessage="Student not found,please try again!!";
             	request.setAttribute("errorMessage", errorMessage);
        }
        	List<StudentModel> studentList = esd.allstudent();
        	request.setAttribute("listStudent",studentList );
        	
        	RequestDispatcher dispatcher = request.getRequestDispatcher("listofstudents.jsp");
	        dispatcher.forward(request, response);
		
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int StudentId = Integer.parseInt(request.getParameter("StudentId"));
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		long mobileno = Long.parseLong(request.getParameter("mobileno"));
		String branch = request.getParameter("branch");
		String mailid = request.getParameter("mailid");
		int yearofpass = Integer.parseInt(request.getParameter("yearofpass"));
		String password = request.getParameter("password");
		int courseid = Integer.parseInt(request.getParameter("courseid"));
		
		StudentModel student = new StudentModel();
		student.setStudentId(StudentId);
		student.setFirstname(firstname);
		student.setLastname(lastname);
		student.setMobileno(mobileno);
		student.setBranch(branch);
		student.setMailid(mailid);
		student.setYearofpass(yearofpass);
		student.setPassword(password);
		student.setCourseid(courseid);
		
		String status=esd.editStudent(student);
		if(status.equals("updatesuccess")) {
			request.setAttribute("SidUpdated",StudentId);
		}
		 else {
	        	String updatemessage = "Row not updated,Something Went Wrong!!!";
				request.setAttribute("updatemessage", updatemessage);
	        }
		List<StudentModel> studentList = esd.allstudent();
    	request.setAttribute("listStudent",studentList );
    	
    	RequestDispatcher dispatcher = request.getRequestDispatcher("listofstudents.jsp");
        dispatcher.forward(request, response);
		
		
		
		doGet(request, response);
	}

}

package com.examp.controller;

import java.io.IOException;
import java.util.List;

import com.examp.DAO.FacultyDAO;
import com.examp.model.FacultyModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Faculty")
public class EditFaculty extends HttpServlet {
	private static final long serialVersionUID = 1L;

	FacultyDAO efd = new FacultyDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int FacultyId = Integer.parseInt(request.getParameter("FacultyId"));
			if(FacultyId!=0) {
				FacultyModel efm = efd.getElementByFacultyid(FacultyId);
	        	if(efm!=null) {
	        		
	        		request.setAttribute("editFaculty",efm);
	        		 request.getRequestDispatcher("Editfaculty.jsp").forward(request, response); 
	        	}
	        	 else {
	             	String errorMessage="Faculty not found,please try again!!";
	             	request.setAttribute("errorMessage", errorMessage);
	        }
	        	List<FacultyModel> facultyList = efd.allfaculty();
	        	request.setAttribute("listFaculty",facultyList );
	        	
	        	RequestDispatcher dispatcher = request.getRequestDispatcher("listoffaculty.jsp");
		        dispatcher.forward(request, response);
		
	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int FacultyId = Integer.parseInt(request.getParameter("FacyltyId"));

		
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		long mobileno = Long.parseLong(request.getParameter("mobileno"));
		String mailid = request.getParameter("mailid");
		String password = request.getParameter("password");
		String qualification = request.getParameter("qualification");
		int yearofexp = Integer.parseInt(request.getParameter("yearofexp"));
		int courseid = Integer.parseInt(request.getParameter("courseid"));
		
		FacultyModel faculty = new FacultyModel();
		faculty.setFacultyId(FacultyId);
		faculty.setFirstname(firstname);
		faculty.setLastname(lastname);
		faculty.setMobileno(mobileno);
		faculty.setMailid(mailid);
		faculty.setPassword(password);
		faculty.setQualification(qualification);
		faculty.setYearofexp(yearofexp);
		faculty.setCourseid(courseid);
		System.out.println(faculty+" this faculty object for edit");
		String status=efd.editFaculty(faculty);
		if(status.equals("updatesuccess")) {
			request.setAttribute("FidUpdated",FacultyId);
		}
		 else {
	        	String updatemessage = "Row not updated,Something Went Wrong!!!";
				request.setAttribute("updatemessage", updatemessage);
	        }
		List<FacultyModel> facultyList = efd.allfaculty();
    	request.setAttribute("listFaculty",facultyList );
    	
    	RequestDispatcher dispatcher = request.getRequestDispatcher("listoffaculty.jsp");
        dispatcher.forward(request, response);
	}
		
	}



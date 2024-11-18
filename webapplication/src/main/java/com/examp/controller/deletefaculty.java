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

@WebServlet("/deletefac")
public class deletefaculty extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FacultyDAO efd = new FacultyDAO();
		int FacultyId = Integer.parseInt(request.getParameter("FacultyId"));
		String status = efd.deleteFaculty(FacultyId);
		if(status.equals("deletesuccess")) {
			request.setAttribute("Fiddeleted",FacultyId);
		}
		 else {
         	String deletemessage = "Row not deleted,Something Went Wrong!!!";
			request.setAttribute("deletemessage", deletemessage);
         }
		List<FacultyModel> facultyList = efd.allfaculty();
    	request.setAttribute("listFaculty",facultyList );
    	
    	RequestDispatcher dispatcher = request.getRequestDispatcher("listoffaculty.jsp");
        dispatcher.forward(request, response);
		
		
		
	}

}

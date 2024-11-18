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

@WebServlet("/ulistoffaculty")
public class stupagelistoffaculties extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FacultyDAO fd = new FacultyDAO();
		List<FacultyModel> slistFaculty = fd.allfaculty();
		request.setAttribute("slistFaculty",slistFaculty);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/stupagelistoffaculty.jsp");
		dispatcher.forward(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}

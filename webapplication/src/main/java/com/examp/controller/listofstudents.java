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

@WebServlet("/listofstudents")
public class listofstudents extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudentDAO sd = new StudentDAO();
		List<StudentModel> listStudent = sd.allstudent();
		request.setAttribute("listStudent",listStudent);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/listofstudents.jsp");
		dispatcher.forward(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}

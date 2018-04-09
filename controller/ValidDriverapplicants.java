package com.talentsprint.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

import com.talentsprint.chariot.DataBaseUtility;

/**
 * Servlet implementation class ValidDriverapplicants
 */
@WebServlet("/ValidDriverapplicants")
public class ValidDriverapplicants extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidDriverapplicants() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Connection connection = null;
		Statement statement = null;
		ResultSet rs = null;
		
		try{
			 connection =  DataBaseUtility.getConnection();
			// System.out.println("hello");
			 statement = connection.createStatement();
			 rs = statement.executeQuery("select * from driverapplicants");
			// System.out.println("hii");
			 if(rs.next()) {
				session.setAttribute("firstName", rs.getString(1));
				session.setAttribute("lastName", rs.getString(2));
				session.setAttribute("email", rs.getString(3));
				session.setAttribute("DOB", rs.getString(6));
				session.setAttribute("phoneNumber", rs.getString(4));
				session.setAttribute("licenseNumber", rs.getString(8));
				session.setAttribute("city", rs.getString(9));
			}
			 String phoneNumber = (String) session.getAttribute("phoneNumber");
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("registeredDriver.jsp");
		rd.forward(request, response);
	}
}

package com.talentsprint.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.talentsprint.bean.DriverLogin;
import com.talentsprint.chariot.DataBaseUtility;

/**
 * Servlet implementation class DriverLoginController
 */
@WebServlet("/DriverLoginController")
public class DriverLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverLoginController() {
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
		String emailId = request.getParameter("emailId");
		String password = request.getParameter("password");
		
		DriverLogin login = new DriverLogin();
		login.setEmailId(emailId);
		login.setPassword(password);
		PrintWriter out = response.getWriter();   
		
		HttpSession session = request.getSession();
		
		session.setAttribute("emailId", emailId);
		try {

			Connection connection = DataBaseUtility.getConnection();

			Statement statement = connection.createStatement();

			ResultSet resultSet = statement.executeQuery("select * from driver where emailId = '"+emailId+"'");
            //request.setAttribute("emailId",emailId);
            //out.println(request.getAttribute("phoneNumber"));
		
		 	if(resultSet.next()) {
           
			session.setAttribute("name",resultSet.getString(1) + resultSet.getString(2));
            session.setAttribute("email", resultSet.getString(3));
			session.setAttribute("phonenumber", resultSet.getString(4));

			session.setAttribute("gender", resultSet.getString(5));
            session.setAttribute("DOB", resultSet.getString(6));
			session.setAttribute("licenseNumber", resultSet.getString(8));

			session.setAttribute("city", resultSet.getString(9));

			session.setAttribute("cabNumber", resultSet.getString(11));
			} 
	}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
	}		
		  if(login.validateCredentials(emailId,password)) {
			//.getAttribute("UserName",login.getLastName() +""+ login.getFirstName());
			  session.setAttribute("emailId", emailId);			
			RequestDispatcher rd = request.getRequestDispatcher("/DriverOnline.html");
			rd.forward(request, response);  
			
		} else {
			out.print("Invalid Credentials");
			RequestDispatcher rd = request.getRequestDispatcher("/WelcomePage.html");
			rd.forward(request, response);  
			
		}
		
	}
}

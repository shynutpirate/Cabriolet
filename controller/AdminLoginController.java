package com.talentsprint.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.talentsprint.bean.DriverLogin;
import com.talentsprint.dbconnection.AdminDAO;

/**
 * Servlet implementation class AdminLoginController
 */
@WebServlet("/AdminLoginController")
public class AdminLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginController() {
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
		PrintWriter out = response.getWriter();
		String emailId = request.getParameter("emailId");
		String password = request.getParameter("password");
	    
		AdminDAO admin = new AdminDAO();
		 if(admin.validateCredentials(emailId,password)) {
			  //out.print("true");
			RequestDispatcher rd = request.getRequestDispatcher("/Admin.jsp");
			rd.forward(request, response);  
			
		} else {
			out.print("Invalid Credentials");
			RequestDispatcher rd = request.getRequestDispatcher("AdminLogin.html");
			rd.forward(request, response);
		} 
	}

}

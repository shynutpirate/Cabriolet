package com.talentsprint.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.talentsprint.bean.DriverRegister;
import com.talentsprint.chariot.DataBaseUtility;

/**
 * Servlet implementation class NewDriverController
 */
@WebServlet("/NewDriverController")
public class NewDriverController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewDriverController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DriverRegister dr = new DriverRegister();
		PrintWriter out = response.getWriter();
		String add = request.getParameter("AddDriver");
		String reject = request.getParameter("RejectDriver");
		HttpSession session = request.getSession();
		String phoneNumber = (String) session.getAttribute("phoneNumber");
		//out.print("HIII");
		if(add != null ){
			if(dr.registerDrivers()) {
				RequestDispatcher rd = request.getRequestDispatcher("Join.jsp");
				rd.forward(request, response);
				
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("JoinFail.jsp");
				rd.forward(request, response);
			}
		}
		if(reject != null){
			Connection connection = DataBaseUtility.getConnection();
			Statement statement;
			try {
				statement = connection.createStatement();
			    statement.execute("delete from driverApplicants where phoneNumber = '"+phoneNumber+"'");
				RequestDispatcher rd = request.getRequestDispatcher("Admin.jsp");
				rd.forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}		
	}

}

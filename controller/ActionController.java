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

import com.talentsprint.chariot.DataBaseUtility;

/**
 * Servlet implementation class ActionController
 */
@WebServlet("/ActionController")
public class ActionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActionController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stud
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*RequestDispatcher rd = request.getRequestDispatcher("JSP/RefreshPage.jsp");
		rd.forward(request, response);*/
		PrintWriter out = response.getWriter();
		String status = "Waiting";
		HttpSession session = request.getSession();
		String driverId = (String)session.getAttribute("phonenumber");
		//out.println(driverId);
		Connection connection = DataBaseUtility.getConnection();
		Statement statement;
		try {
			System.out.println("before");
			statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from ride where driverId = '"+driverId+"' and status = '"+status+"'");
			System.out.println("after query");
			//System.out.println(rs.getRow());
            if (rs.next()) {
            	//System.out.println("hi");
            	RequestDispatcher rd = request.getRequestDispatcher("JSP/RequestPage.jsp");
            	rd.forward(request,response);
            } else {
            	RequestDispatcher rd = request.getRequestDispatcher("JSP/NoRidesPage.jsp");
            	rd.forward(request,response);
            }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}

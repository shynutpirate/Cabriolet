package com.talentsprint.chariot;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.talentsprint.bean.DriverLogin;

/**
 * Servlet implementation class DriverOfflineController
 */
@WebServlet("/DriverOfflineController")
public class DriverOfflineController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverOfflineController() {
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
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		String offline = request.getParameter("offline");
		String emailId = (String)session.getAttribute("emailId") ;
		DriverLogin dl = new DriverLogin();
		dl.updatingStatusOffline(offline, emailId);
		RequestDispatcher rd = request.getRequestDispatcher("/DriverOnline.html");
		rd.forward(request, response);
	
		
	}

}

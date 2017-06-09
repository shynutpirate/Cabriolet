package com.talentsprint.chariot;

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

/**
 * Servlet implementation class DriverOnlineController
 */
@WebServlet("/DriverOnlineController")
public class DriverOnlineController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverOnlineController() {
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
		response.setContentType("text/html");
		
		
		HttpSession session = request.getSession();
			
		String emailId = (String)session.getAttribute("emailId");
		String check = request.getParameter("online");
		//String offline = request.getParameter("offline");
		DriverLogin dl = new DriverLogin();
		dl.updatingStatusOnline(check,emailId);
		
		if(check != null) {
			RequestDispatcher rd = request.getRequestDispatcher("MapPage.html");
			rd.forward(request, response);
		} 
	}
}
			
		

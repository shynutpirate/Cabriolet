package com.talentsprint.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.talentsprint.bean.RideHistory;

/**
 * Servlet implementation class RideHistoryController
 */
@WebServlet("/RideHistoryController")
public class RideHistoryController extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RideHistoryController() {
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
		RideHistory rhm = new RideHistory();
		ArrayList <RideHistory> rh = rhm.getHistory("8106794042");
	/*	for (Customer customer : customerList) {
            Object rowData[] = {customer.getId(), customer.getName(), customer.getAddress(), customer.getSalary()};
            tableModel.addRow(rowData);
        }*/
		request.setAttribute("rideList", rh);
		getServletConfig().getServletContext().getRequestDispatcher("JSP./DisplayHistory.jsp").forward(request,response);
		/*RequestDispatcher rd = request.getRequestDispatcher("DisplayHistory.jsp");
		rd.forward(request, response);*/
	/*	for (RideHistory r : rd) {
			System.out.println(r.getDriverId());
			System.out.println(r.getCustomerId());
			System.out.println(r.getSource());
			System.out.println(r.getDestination());
			System.out.println(r.getStatus());
			System.out.println(r.getAmount());
			System.out.println(r.getBookingTime());
		} */
	}

}


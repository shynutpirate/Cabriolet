package com.talentsprint.chariot;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.talentsprint.bean.DriverRegister;

/**
 * Servlet implementation class DriverRegisterController
 */
@WebServlet("/DriverRegisterController")
public class DriverRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverRegisterController() {
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
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String emailId = request.getParameter("emailID");
		String city = request.getParameter("city");
		String gender = request.getParameter("gender");
		String licenseNumber= request.getParameter("LicenseNumber");
		String dateOfBirth= request.getParameter("dateOfBirth");
		String mobileNumber= request.getParameter("mobileNumber");
		String carNumber = request.getParameter("carNumber");
		String carName = request.getParameter("carName");
		String carType = request.getParameter("carType");
		//int phoneNumber = Integer.parseInt(mobileNumber);
		
		DriverRegister dr = new DriverRegister();
		dr.setFirstName(firstName);
		dr.setLastName(lastName);
		dr.setEmailId(emailId);
		dr.setCity(city);
		dr.setLicenseNumber(licenseNumber);
		dr.setDateOfBirth(dateOfBirth);
		dr.setPhoneNumber(mobileNumber);
		dr.setGender(gender);
		dr.setCarNumber(carNumber);
		dr.setCarName(carName);
		dr.setCarType(carType);
		dr.saveData();
		RequestDispatcher rd = request.getRequestDispatcher("JSP/RegisterSuccess.jsp");
		rd.forward(request, response);
	}

}

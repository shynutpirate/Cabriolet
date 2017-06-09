package com.talentsprint.bean;

import java.sql.*;
import java.util.ArrayList;

import com.talentsprint.chariot.DataBaseUtility;

public class RideHistory {
	
	private String driverId;
	public String getDriverId() {
		return driverId;
	}
	public void setDriverId(String driverId) {
		this.driverId = driverId;
	}
	private String customerId,source,destination,bookingTime;
	private double amount;
	private double status;
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getBookingTime() {
		return bookingTime;
	}
	public void setBookingTime(String bookingTime) {
		this.bookingTime = bookingTime;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public double getStatus() {
		return status;
	}
	public void setStatus(double status) {
		this.status = status;
	}
	public ArrayList<RideHistory> getHistory(String phoneNumber) {
		RideHistory h = new RideHistory();
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		ArrayList <RideHistory> rd = new ArrayList<RideHistory>();
	//	phoneNumber = "8106794042";
		connection = DataBaseUtility.getConnection();
		
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery("select * from Ride where driverId = '"+phoneNumber+"'");
			while (resultSet.next()) {
				h.setDriverId(resultSet.getString(1));
				h.setCustomerId(resultSet.getString(2));
				h.setSource(resultSet.getString(3));
				h.setDestination(resultSet.getString(4));
				h.setStatus(resultSet.getInt(5));
				h.setAmount(resultSet.getDouble(6));
				h.setBookingTime(resultSet.getString(7));
				rd.add(h);
				
			}
			statement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return rd;
	}

}
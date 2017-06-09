package com.talentsprint.bean;

import java.sql.*;

import com.talentsprint.chariot.DataBaseUtility;

public class DriverLogin {
	private String  password,emailId;

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public  boolean validateCredentials(String emailId,String password){
		ResultSet resultSet = null;
		//DataBaseUtility databaseUtility = new DataBaseUtility();
		Connection connection = DataBaseUtility.getConnection();
		try {
			Statement statement = connection.createStatement();
			resultSet = statement.executeQuery("select * from driver where emailId = '"+emailId+"' AND password = MD5('"+password+"')" );
			if(resultSet.next()) 
				return true;
			//System.out.println(resultSet.getRow());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;		
	}
	
	public void updatingStatusOnline(String online,String emailId) {
		//ResultSet resultSet = null;
		Connection connection = DataBaseUtility.getConnection();
		try{
			connection = DataBaseUtility.getConnection();
			Statement statement = connection.createStatement();
			statement.executeUpdate("Update driver set status = 1 where emailId = '"+emailId+"' ");
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void updatingStatusOffline(String online,String emailId) {
		//ResultSet resultSet = null;
		Connection connection = DataBaseUtility.getConnection();
		try{
			connection = DataBaseUtility.getConnection();
			Statement statement = connection.createStatement();
			statement.executeUpdate("Update driver set status = 0 where emailId = '"+emailId+"' ");
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}



package com.talentsprint.bean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.talentsprint.chariot.DataBaseUtility;

public class DriverRegister {
     private String firstName,lastName,emailId,phoneNumber,gender,dateOfBirth,password,licenseNumber,city,status,carNumber,carName,carType;

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLicenseNumber() {
		return licenseNumber;
	}

	public void setLicenseNumber(String licenseNumber) {
		this.licenseNumber = licenseNumber;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCarNumber() {
		return carNumber;
	}

	public void setCarNumber(String carNumber) {
		this.carNumber = carNumber;
	}
	
	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}

	public String getCarType() {
		return carType;
	}

	public void setCarType(String carType) {
		this.carType = carType;
	}

	public void saveData() {
		Connection connection = null;
		try {
			connection = DataBaseUtility.getConnection();
			Statement statement = connection.createStatement();
			statement.executeUpdate("insert into driverapplicants(firstName,lastName,emailId,phoneNumber,gender,DOB,password,licenseNumber,city,carNumber,carName,carType) values('"+getFirstName()+"','"+getLastName()+"','"+getEmailId()+"','"+getPhoneNumber()+"','"+getGender()+"','"+getDateOfBirth()+"',MD5('"+getPassword()+"'),'"+getLicenseNumber()+"','"+getCity()+"','"+getCarNumber()+"','"+getCarName()+"','"+getCarType()+"')");
			
			
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	
	}
	
	public boolean registerDrivers() {
		Connection connection = null;
		ResultSet rs = null;
		DriverRegister dr = new DriverRegister();
		int cost = 0;
		try {
		//	System.out.println("In try");
			connection = DataBaseUtility.getConnection();
			Statement statement = connection.createStatement();
			
			rs = statement.executeQuery("select * from  driverapplicants");
			while(rs.next()) {
				System.out.println("o");
		     	dr.setFirstName(rs.getString(1));
				dr.setLastName(rs.getString(2));
				dr.setEmailId(rs.getString(3));
				dr.setPhoneNumber(rs.getString(4));
				dr.setGender(rs.getString(5));
				dr.setDateOfBirth(rs.getString(6));
				dr.setPassword(rs.getString(7));
				dr.setLicenseNumber(rs.getString(8));
				dr.setCity(rs.getString(9));
			    dr.setCarNumber(rs.getString(10));
			    dr.setCarName(rs.getString(11));
			    dr.setCarType(rs.getString(12));
			    if (dr.getCarType().equals("mini")){
					cost = 8;
				} else if(dr.getCarType().equals("sedan")) {
					cost = 10;
				} else
					cost = 18;
			    statement.executeUpdate("insert into cab values('"+dr.getCarNumber()+"','"+dr.getCarType()+"','"+dr.getCarName()+"','"+cost+"')");
				statement.executeUpdate("insert into driver values('"+dr.getFirstName()+"','"+dr.getLastName()+"','"+dr.getEmailId()+"','"+dr.getPhoneNumber()+"','"+dr.getGender()+"','"+dr.getDateOfBirth()+"',MD5('"+dr.getPassword()+"'),'"+dr.getLicenseNumber()+"','"+dr.getCity()+"','0','"+dr.getCarNumber()+"')");	
				statement.executeUpdate("delete from driverapplicants where emailId = '"+dr.getEmailId()+"'");
			//	System.out.println("e");
		}
			//System.out.println(rs.getRow());
		//	System.out.println("After while");
		
	//	System.out.println("insert into cab values('"+dr.getCarNumber()+"','"+dr.getCarType()+"','"+dr.getCarName()+"','"+cost+"')");
			
		return true;
	     }catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return false;
				
	}
}

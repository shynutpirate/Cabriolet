package com.talentsprint.dbconnection;

import java.sql.SQLException;
import java.sql.*;

import com.talentsprint.chariot.DataBaseUtility;

public class AdminDAO {
	Connection connection = DataBaseUtility.getConnection();
	ResultSet resultSet = null;
	public boolean validateCredentials(String emailId,String password) {
		
	try {
		Statement statement = connection.createStatement();
		resultSet = statement.executeQuery("select * from admin where emailId = '"+emailId+"' AND password = '"+ password+"'" );
		if(resultSet.next()) 
			return true;
		//System.out.println(resultSet.getRow());
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return false;
	}

}

package com.gated.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.gated.model.User;
import com.gated.utilities.Constants;
import com.gated.utilities.DBConnection;

public class UserDao {
	
	public void saveUser(User user) {
		Connection connection;
		try {
			connection = DBConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(Constants.INSERT_USER);
			statement.setString(1, user.getEmail());
			statement.setString(2, user.getPassword());
			
			statement.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	public boolean validateUser(User user) {
	    try (Connection connection = DBConnection.getConnection();
	         PreparedStatement statement = connection.prepareStatement(Constants.GET_USER)) {

	        statement.setString(1, user.getEmail());
	        statement.setString(2, user.getPassword());

	        try (ResultSet resultSet = statement.executeQuery()) {
	            return resultSet.next();                               // true if a row exists
	        }
	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace();
	    }
	    return false;
	}

	public void deleteComplaint(int complaintid) {
		try (Connection con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(Constants.DELETE_COMPLAINT_)) {
		 pst.setInt(1, complaintid);
           pst.executeUpdate();
    

       } catch (Exception e) {
           e.printStackTrace();
       }
		
	}
	
	
}

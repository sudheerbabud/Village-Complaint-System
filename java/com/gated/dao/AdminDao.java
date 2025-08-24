package com.gated.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gated.model.Admin;
import com.gated.model.Complaint;
import com.gated.utilities.Constants;
import com.gated.utilities.DBConnection;

public class AdminDao {

    public void saveAdmin(Admin admin) {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(Constants.INSERT_ADMIN)) {

            statement.setString(1, admin.getEmail());
            statement.setString(2, admin.getPassword());

            statement.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean validateAdmin(Admin admin) {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(Constants.GET_ADMIN)) {

            statement.setString(1, admin.getEmail());
            statement.setString(2, admin.getPassword());

            try (ResultSet resultSet = statement.executeQuery()) {
                return resultSet.next();
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public List<Complaint> getAllComplaints() {
        List<Complaint> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(Constants.GET_ALL_COMPLAINTS);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Complaint c = new Complaint();
                c.setComplaintId(rs.getInt("complaintid"));   
                c.setPersonName(rs.getString("personname")); 
                c.setEmail(rs.getString("email"));
                c.setFlatNumber(rs.getInt("flatnumber"));    
                c.setComplaints(rs.getString("complaints"));
                c.setPhoneNumber(rs.getString("phonenumber"));
                c.setStatus(rs.getString("status"));
                System.out.println(c);
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean updateComplaintStatus(int id, String status) {
        boolean updated = false;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pst = con.prepareStatement(Constants.UPDATE_COMPLAINT_STATUS)) {

            pst.setString(1, status);
            pst.setInt(2, id);

            int rows = pst.executeUpdate();
            if (rows > 0) {
                updated = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return updated;
    }

	public void deleteComplaint(int complaintid) {
		try (Connection con = DBConnection.getConnection();
	             PreparedStatement pst = con.prepareStatement(Constants.DELETE_COMPLAINT)) {
			 pst.setInt(1, complaintid);
	            pst.executeUpdate();
	     

	        } catch (Exception e) {
	            e.printStackTrace();
	        }


		
		
	}
  
   }



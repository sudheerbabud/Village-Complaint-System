package com.gated.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.gated.model.Complaint;
import com.gated.utilities.Constants;
import com.gated.utilities.DBConnection;

public class ComplaintDao {

    // Insert complaint
    public boolean insertComplaint(String personName, String email, int flatNumber, String complaints, String phoneNumber) {
        boolean success = false;
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(Constants.INSERT_COMPLAINT)) {

            ps.setString(1, personName);
            ps.setString(2, email);
            ps.setInt(3, flatNumber);
            ps.setString(4, complaints);
            ps.setString(5, phoneNumber);
            ps.setString(6, "Pending");            
            int rows = ps.executeUpdate();
            if (rows > 0) success = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

 // Fetch complaints for logged-in user
    public List<Complaint> getUserComplaints(String email) {
        List<Complaint> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(Constants.GET_USER_COMPLAINTS)) {

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Complaint c = new Complaint();
                c.setComplaintId(rs.getInt("complaintid"));
                c.setPersonName(rs.getString("personname"));
                c.setEmail(rs.getString("email"));
                c.setFlatNumber(rs.getInt("flatnumber"));
                c.setComplaints(rs.getString("complaints"));
                c.setPhoneNumber(rs.getString("phonenumber"));
                c.setStatus(rs.getString("status"));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Update complaint
    public int updateComplaint(int complaintId, String email, String newText) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(Constants.UPDATE_COMPLAINT)) {

            ps.setString(1, newText);
            ps.setInt(2, complaintId);
            ps.setString(3, email);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
		return complaintId;
    }

    // Cancel complaint
    public int cancelComplaint(int complaintId, String email) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(Constants.CANCEL_COMPLAINT)) {

            ps.setInt(1, complaintId);
            ps.setString(2, email);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
		return complaintId;
    }

    
    public List<Complaint> getComplaintHistory(String email) {
        List<Complaint> complaints = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(Constants.GET_COMPLAINT_HISTORY)) {

            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Complaint c = new Complaint();
                    c.setComplaintId(rs.getInt("complaintid"));
                    c.setPersonName(rs.getString("personname"));
                    c.setEmail(rs.getString("email"));
                    c.setFlatNumber(rs.getInt("flatnumber"));
                    c.setComplaints(rs.getString("complaints"));
                    c.setPhoneNumber(rs.getString("phonenumber"));
                    c.setStatus(rs.getString("status"));
                    complaints.add(c);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return complaints;
    }

    public void updateComplaintStatus(int id, String status) {
    	  try (Connection con = DBConnection.getConnection();
    	  PreparedStatement ps = con.prepareStatement(Constants.UPDATE_COMPLAINT_STATUS)) {
            
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    } 
}

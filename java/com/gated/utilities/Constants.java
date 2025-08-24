package com.gated.utilities;


public class Constants {

    public static final String URL = "jdbc:mysql://localhost:3306/apartment_system";
    public static final String USERNAME = "root";
    public static final String PASSWORD = "root";

    // User
    public static final String INSERT_USER = "INSERT INTO user (email, password) VALUES (?, ?)";
    public static final String GET_USER = "SELECT * FROM user WHERE email=? AND password=?";
 	public static final String DELETE_COMPLAINT_ = "DELETE from complaint where complaintid =?";

    
    // Complaint
    public static final String INSERT_COMPLAINT = "INSERT INTO complaint (personname, email, flatnumber, complaints, phonenumber, status) VALUES (?,?,?,?,?,?)";
    public static final String GET_USER_COMPLAINTS = "SELECT * FROM complaint WHERE email=?";
    public static final String UPDATE_COMPLAINT = "UPDATE complaint SET complaints=? WHERE complaintid=? AND email=? AND status='pending'";
    public static final String GET_COMPLAINT_HISTORY = "SELECT * FROM complaint WHERE email=? ";
    public static final String CANCEL_COMPLAINT = "UPDATE complaint SET status='Cancelled' WHERE complaintid=? AND email=? AND status='pending'";

    
    //admin
    public static final String INSERT_ADMIN = "INSERT INTO admin (email, password) VALUES (?, ?)";
    public static final String GET_ADMIN = "SELECT * FROM admin WHERE email=? AND password=?";
    public static final String GET_ALL_COMPLAINTS = "SELECT * FROM complaint ORDER BY complaintid ASC";
    public static final String UPDATE_COMPLAINT_STATUS = "UPDATE complaint SET status = ? WHERE complaintid = ?";
    	public static final String DELETE_COMPLAINT = "DELETE from complaint where complaintid =?";

}

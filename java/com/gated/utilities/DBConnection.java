package com.gated.utilities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	Connection con;
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/apartment_system","root","root");
        return con;
    }
}

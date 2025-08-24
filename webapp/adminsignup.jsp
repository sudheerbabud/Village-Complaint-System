<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    String userEmail = (String) session.getAttribute("userEmail");
    if (userEmail == null) {
        response.sendRedirect("userlogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <style>
        .top-banner {
            width: 110%;              
            background-color: royalblue;  
            color: white;
            font-weight: bold;
            font-size: 20px;          
            padding: 10px 0;        
            overflow: hidden;
            white-space: nowrap;
            box-sizing: border-box;
            position: fixed;          
            top: 0;
            left: -5%;               
            z-index: 1000;
            text-align: center;
        }

        /* scrolling text animation */
        .top-banner span {
            display: inline-block;
            padding-left: 100%; 
            animation: scroll 15s linear infinite;
        }

        @keyframes scroll {
            0% { transform: translateX(0); }
            100% { transform: translateX(-100%); }
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #bde18e; /* same light green */
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            align-items: center;
            justify-content: center;
            color: #333;
        }

        .dashboard {
            background: rgba(255, 255, 255, 0.9);
            padding: 25px 30px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            width: 90%;
            max-width: 320px; /* compact size */
            text-align: center;
        }

        h2 {
            margin-bottom: 15px;
            font-size: 18px;
            color: #006064;
        }

        .links {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .link-box {
            background: #00acc1;
            padding: 6px;
            border-radius: 5px;
            font-weight: bold;
            text-decoration: none;
            color: white;
            font-size: 12px;
            transition: background 0.3s ease;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        .link-box:hover {
            background: #00838f;
        }

        /* logout/back style */
        .logout-btn {
            background: #e53935;
            padding: 6px;
            border-radius: 5px;
            font-size: 12px;
            font-weight: bold;
            text-decoration: none;
            color: white;
            display: block;
            margin-top: 12px;
            transition: background 0.3s ease;
        }

        .logout-btn:hover {
            background: #b71c1c;
        }
    </style>
</head>
<body>

    <div class="top-banner">
        <span>Village - Complaint Management</span>
    </div>

    <div class="dashboard">
        <h2>Welcome, <%= userEmail %></h2>
        <div class="links">
            <a class="link-box" href="submitComplaint.jsp">Submit Complaint</a>
            <a class="link-box" href="viewComplaints">View Status</a>
            <a class="link-box" href="updateComplaint.jsp">Update / Cancel</a>
            <a class="link-box" href="complaintHistory">History</a>
        </div>
        <a href="adminlogout.jsp" class="logout-btn">Logout</a>
    </div>

</body>
</html>

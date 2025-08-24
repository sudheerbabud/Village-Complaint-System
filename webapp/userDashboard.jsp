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
    font-size: 24px;          
    padding: 12px 0;        
    overflow: hidden;
    white-space: nowrap;
    box-sizing: border-box;
    position: fixed;          
    top: 0;
    left: -5%;               
    z-index: 1000;
}

/* scrolling text animation */
.top-banner span {
    display: inline-block;
    padding-left: 100%; /* start from right */
    animation: scroll 15s linear infinite;
}

@keyframes scroll {
    0% { transform: translateX(0); }
    100% { transform: translateX(-100%); }
}
        body {
            font-family: Arial, sans-serif;
            background-color: #bde18e; /* lighter aqua gradient */
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            align-items: center;
            justify-content: center;
            color: #333;
        }

/* Optional: make the dashboard slightly transparent on top of sky blue */
.dashboard {
    background: rgba(255, 255, 255, 0.8); /* slightly transparent white */
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 4px 30px rgba(0,0,0,0.1);
    width: 90%;
    max-width: 400px;
    text-align: center;
     }

        h2 {
            margin-bottom: 25px;
            color: #2e7d32;
        }
        .links {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        .link-box {
            background: rgba(255, 255, 255, 0.6);
            padding: 10px;
            border-radius: 4px;
            font-weight: bold;
            text-decoration: none;
            color: #2e7d32;
            transition: 0.3s ease;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        .link-box:hover {
            background-color: #ff6f6f;
            transform: translateY(-3px);
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
            <a class="link-box" href="complaintHistory">History of Complaints</a>
        </div>
    </div>

</body>
</html>

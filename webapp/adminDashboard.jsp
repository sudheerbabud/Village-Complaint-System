<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    String adminEmail = (String) session.getAttribute("adminEmail");
    if (adminEmail == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #bde18e; /* same as login */
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
            padding: 20px 25px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            width: 90%;
            max-width: 320px; /* compact like login */
            text-align: center;
        }

        h2 {
            margin-bottom: 15px;
            font-size: 18px; /* smaller */
            color: #006064;
        }

        .links {
            display: flex;
            flex-direction: column;
            gap: 10px; /* less spacing */
        }

        .link-box {
            background: #00acc1;
            color: white;
            padding: 6px;              /* smaller height */
            border-radius: 5px;
            font-size: 12px;           /* smaller text */
            font-weight: bold;
            text-decoration: none;
            transition: background 0.3s ease;
            display: block;
            width: 80%;                /* smaller width */
            margin: 0 auto;
        }

        .link-box:hover {
            background: #00838f;
        }

        /* Back to Home Button */
        .home-btn {
            display: block;
            width: 80%;
            text-align: center;
            background: #e53935;
            color: white;
            padding: 6px;
            border-radius: 5px;
            margin: 12px auto 0;
            font-size: 12px;
            font-weight: bold;
            text-decoration: none;
            transition: background 0.3s ease;
        }

        .home-btn:hover {
            background: #b71c1c;
        }
    </style>
</head>
<body>

    <div class="dashboard">
        <h2>Welcome, <%= adminEmail %></h2>
        <div class="links">
            <a class="link-box" href="adminViewComplaints">View Complaints</a>
           <!--   <a class="link-box" href="adminUpdateComplaint">Update Status</a>
            <a class="link-box" href="adminAssignComplaints">Assign Complaint</a>-->
        </div>

        <!-- Back to Home Button -->
        <a href="index.html" class="home-btn">Back to Home</a>
    </div>

</body>
</html>

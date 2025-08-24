<%@ page import="java.util.*,com.gated.model.Complaint"%>
<%@ page session="true"%>
<%
String userEmail = (String) session.getAttribute("userEmail");
if (userEmail == null) {
    response.sendRedirect("userlogin.jsp");
    return;
}
List<Complaint> complaints = (List<Complaint>) request.getAttribute("complaints");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Complaint History</title>
<style>
/* Top Banner */
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
}
.top-banner span {
    display: inline-block;
    padding-left: 100%;
    animation: scroll 15s linear infinite;
}
@keyframes scroll {
    0% { transform: translateX(0); }
    100% { transform: translateX(-100%); }
}

/* Body and Container */
body {
    font-family: Arial, sans-serif;
    background-color: #bde18e;  /* light green theme */
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: flex-start;
    min-height: 100vh;
    color: #333;
}
.container {
    background: rgba(255, 255, 255, 0.9);
    margin-top: 70px;
    padding: 20px 25px;
    border-radius: 10px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.1);
    width: 95%;
    max-width: 800px;
}

/* Heading */
h2 {
    text-align: center;
    margin-bottom: 15px;
    font-size: 18px;
    color: #006064;
}

/* Table */
table {
    width: 100%;
    border-collapse: collapse;
    background: #fff;
    font-size: 12px;
    border-radius: 8px;
    overflow: hidden;
}
th, td {
    padding: 6px 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}
th {
    background: #00acc1;
    color: white;
    font-size: 12px;
}
tr:nth-child(even) { background: #f9f9f9; }
tr:hover { background: #e0f7fa; }

/* Back button */
.back-link {
    display: block;
    width: 20%;
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
.back-link:hover {
    background: #b71c1c;
}
</style>
</head>
<body>

<div class="top-banner">
    <span>Village - Complaint Management</span>
</div>

<div class="container">
    <h2>My Complaint History</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Complaint</th>
            <th>Status</th>
            <th>Flat Number</th>
            <th>Name</th>
            <th>Phone</th>
        </tr>
        <%
        if (complaints != null && !complaints.isEmpty()) {
            for (Complaint c : complaints) {
        %>
        <tr>
            <td><%=c.getComplaintId()%></td>
            <td><%=c.getComplaints()%></td>
            <td><%=c.getStatus()%></td>
            <td><%=c.getFlatNumber()%></td>
            <td><%=c.getPersonName()%></td>
            <td><%=c.getPhoneNumber()%></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6" style="text-align: center; font-style: italic;">No complaints found</td>
        </tr>
        <% } %>
    </table>
    <a href="userDashboard.jsp" class="back-link">Back to Dashboard</a>
</div>

</body>
</html>

<%@ page import="java.util.*, com.gated.model.Complaint"%>
<%@ page session="true" %>
<%
    String adminEmail = (String) session.getAttribute("adminEmail");
    if (adminEmail == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }

    List<Complaint> complaints = (List<Complaint>) request.getAttribute("complaints");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard - Complaints</title>
<style>
/* Top scrolling banner */
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

/* Body styling */
body {
    font-family: Arial, sans-serif;
    background-color: #bde18e;
    margin: 0;
    padding: 80px 10px 20px; /* space for banner */
    color: #333;
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
    width: 95%;
    margin: auto;
    border-collapse: collapse;
    background: rgba(255,255,255,0.95);
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 4px 20px rgba(0,0,0,0.1);
}
th, td {
    padding: 8px;
    border: 1px solid #ccc;
    font-size: 12px;
    text-align: center;
}
th {
    background-color: #006064;
    color: white;
    font-size: 13px;
}
tr:nth-child(even) { background: #f9f9f9; }

/* Status dropdown */
select {
    padding: 4px;
    border-radius: 5px;
    border: 1px solid #aaa;
    font-size: 12px;
    font-weight: bold;
    color: white;
}

/* Update button */
button {
    padding: 4px 8px;
    border: none;
    border-radius: 5px;
    background: #00acc1;
    color: white;
    font-size: 12px;
    font-weight: bold;
    cursor: pointer;
    transition: background 0.3s ease;
}
button:hover { background: #00838f; }
.hello {
    padding: 4px 8px;
    border: none;
    border-radius: 5px;
    background-color: #aa0000;
    color: white;
    font-size: 12px;
    font-weight: bold;
    cursor: pointer;
    transition: background 0.3s ease;
}
.hello:hover { background: #aa0000; }

/* Exit button */
.exit-btn {
    display: block;
    width: 200px;
    margin: 20px auto;
    padding: 8px;
    background: #e53935;
    color: white;
    text-decoration: none;
    text-align: center;
    border-radius: 5px;
    font-size: 12px;
    font-weight: bold;
    transition: background 0.3s ease;
}
.exit-btn:hover { background: #b71c1c; }
</style>
</head>
<body>

<!-- Top Banner -->
<div class="top-banner">
    <span>Village - Complaint Management (Admin Dashboard)</span>
</div>

<h2>All User Complaints</h2>

<table>
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Flat Number</th>
    <th>Complaint</th>
    <th>Phone</th>
    <th>Status</th>
    <th>Action</th>
</tr>

<%
if (complaints != null && !complaints.isEmpty()) {
    for (Complaint c : complaints) {
%>
<tr>
    <td><%=c.getComplaintId()%></td>
    <td><%=c.getPersonName()%></td>
    <td><%=c.getEmail()%></td>
    <td><%=c.getFlatNumber()%></td>
    <td><%=c.getComplaints()%></td>
    <td><%=c.getPhoneNumber()%></td>
    <td><%=c.getStatus()%></td>
    <td>
        <form action="adminUpdateComplaint" method="post" style="display:inline;">
            <input type="hidden" name="complaintId" value="<%=c.getComplaintId()%>">

            <select name="status"
                onchange="this.style.backgroundColor =
                    this.value === 'Pending' ? '#dc3545' :
                    this.value === 'In Progress' ? '#007bff' :
                    this.value === 'Resolved' ? '#28a745' : '#ffffff';"
                style="font-size:12px;
                       <%= "Pending".equals(c.getStatus()) ? "background-color:#dc3545;" : "" %>
                       <%= "In Progress".equals(c.getStatus()) ? "background-color:#007bff;" : "" %>
                       <%= "Resolved".equals(c.getStatus()) ? "background-color:#28a745;" : "" %>">

                <option value="Pending" <%= "Pending".equals(c.getStatus()) ? "selected" : "" %>>Pending</option>
                <option value="In Progress" <%= "In Progress".equals(c.getStatus()) ? "selected" : "" %>>In Progress</option>
                <option value="Resolved" <%= "Resolved".equals(c.getStatus()) ? "selected" : "" %>>Resolved</option>
            </select>

            <button type="submit">Update</button>
        </form>
        <form action="adminDeleteComplaint" method="post" style="display:inline;">
            <input type="hidden" name="complaintId" value="<%=c.getComplaintId()%>">
            <button class="hello" type="submit">Delete</button>
        </form>
    </td>
</tr>
<%
    }
} else {
%>
<tr><td colspan="8" style="text-align:center;">No complaints found</td></tr>
<% } %>
</table>

<!-- Exit button -->
<a href="adminlogout.jsp" class="exit-btn">Exit</a>

</body>
</html>

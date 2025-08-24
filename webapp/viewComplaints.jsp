<%@ page import="java.util.*,com.gated.model.Complaint"%>
<%@ page session="true"%>
<%
    // Check session
    String userEmail = (String) session.getAttribute("userEmail");
    if (userEmail == null) {
        response.sendRedirect("userlogin.jsp");
        return;
    }

    // Get complaints
    List<Complaint> complaints = (List<Complaint>) request.getAttribute("complaints");
    if (complaints == null) {
        complaints = new ArrayList<>();
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Complaints</title>
<style>
/* Top banner */
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
    padding: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    min-height: 100vh;
    color: #333;
    padding-top: 60px; /* space for top banner */
}

/* Table container */
.table-container {
    background: rgba(255, 255, 255, 0.9);
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.1);
    width: 95%;
    max-width: 900px;
    overflow-x: auto;
}

/* Table */
table {
    width: 100%;
    border-collapse: collapse;
    font-size: 13px;
}
th, td {
    padding: 8px;
    text-align: center;
    border: 1px solid #ddd;
}
th {
    background-color: #00acc1;
    color: white;
    font-size: 13px;
}
tr:hover {
    background-color: #f1f1f1;
}

/* Heading */
h2 {
    text-align: center;
    color: #006064;
    margin-bottom: 15px;
    font-size: 18px;
}

/* Exit button */
.btn {
    display: block;
    width: 80%;
    max-width: 200px;
    margin: 15px auto;
    padding: 6px;
    background: #e53935;
    color: white;
    text-decoration: none;
    text-align: center;
    border-radius: 5px;
    font-size: 12px;
    font-weight: bold;
    transition: background 0.3s ease;
}
.btn:hover {
    background: #b71c1c;
}
</style>
</head>
<body>
    <!-- Top banner -->
    <div class="top-banner">
        <span>Village - Complaint Management</span>
    </div>

    <div class="table-container">
        <h2>My Complaints</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Flat Number</th>
                <th>Complaint</th>
                <th>Phone</th>
                <th>Status</th>
            </tr>
            <%
                if (!complaints.isEmpty()) {
                    for (Complaint c : complaints) {
            %>
            <tr>
                <td><%= c.getComplaintId() %></td>
                <td><%= c.getPersonName() %></td>
                <td><%= c.getEmail() %></td>
                <td><%= c.getFlatNumber() %></td>
                <td><%= c.getComplaints() %></td>
                <td><%= c.getPhoneNumber() %></td>
                <td style="color:<%= c.getStatus().equalsIgnoreCase("Resolved") ? "green" : "red" %>;">
                    <%= c.getStatus() %>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="7" style="text-align:center;">No complaints found</td>
            </tr>
            <% } %>
        </table>

        <!-- Exit button -->
        <a href="logout.jsp" class="btn">Exit</a>
    </div>
</body>
</html>

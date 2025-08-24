<%
    String id = request.getParameter("complaintid");
%>
<html>
<head>
<title>Update Complaint</title>
</head>
<body>
<h2>Update Complaint Status</h2>
<form action="AdminUpdateComplaintServlet" method="post">
    <input type="hidden" name="complaintid" value="<%= id %>">
    <label>Status: </label>
    <select name="status">
        <option value="Pending">Pending</option>
        <option value="In Progress">In Progress</option>
        <option value="Resolved">Resolved</option>
    </select>
    <input type="submit" value="Update">
</form>
<form action="AdminDeleteComplaintServlet" method="post">
    <input type="hidden" name="complaintid" value="<%= id %>">
    <input type="submit" value="Delete">
</form>
</body>
</html>

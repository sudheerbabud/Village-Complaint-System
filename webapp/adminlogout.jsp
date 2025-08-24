<%@ page session="true"%>
<%
    session.invalidate(); // End session
    response.sendRedirect("adminlogin.jsp"); // Back to login
%>

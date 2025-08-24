<%@ page session="true"%>
<%
    session.invalidate(); // End session
    response.sendRedirect("userlogin.jsp"); // Back to login
%>

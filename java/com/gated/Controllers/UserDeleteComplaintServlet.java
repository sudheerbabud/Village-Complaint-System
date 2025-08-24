package com.gated.Controllers;

import java.io.IOException;

import com.gated.dao.UserDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/userdeleteComplaint")
public class UserDeleteComplaintServlet extends HttpServlet {
	  private static final long serialVersionUID = 1L;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       int id = Integer.parseInt(request.getParameter("complaintId"));
       
        UserDao dao = new UserDao();
		dao.deleteComplaint(id);

        response.sendRedirect("viewComplaints");
    }
}

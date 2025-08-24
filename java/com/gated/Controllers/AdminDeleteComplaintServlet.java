package com.gated.Controllers;

import java.io.IOException;

import com.gated.dao.AdminDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminDeleteComplaint")
public class AdminDeleteComplaintServlet extends HttpServlet {
	  private static final long serialVersionUID = 1L;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       int id = Integer.parseInt(request.getParameter("complaintId"));
       
        AdminDao dao = new AdminDao();
		dao.deleteComplaint(id);

        response.sendRedirect("adminViewComplaints");
    }
}

package com.gated.Controllers;


import java.io.IOException;
import java.util.List;

import com.gated.dao.AdminDao;
import com.gated.model.Complaint;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminViewComplaints")
public class AdminViewComplaintsServlet extends HttpServlet {
	  private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        AdminDao dao = new AdminDao();
        List<Complaint> complaints = dao.getAllComplaints();
        request.setAttribute("complaints", complaints);
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminViewComplaints.jsp");
        dispatcher.forward(request, response);
        

    }

}

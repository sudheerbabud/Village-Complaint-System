package com.gated.Controllers;

import java.io.IOException;

import com.gated.dao.ComplaintDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateComplaint")
public class UpdateComplaintServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("userEmail");

        try {
            int complaintId = Integer.parseInt(request.getParameter("complaintid"));
            String newText = request.getParameter("complaint");   
            String action = request.getParameter("action");

            ComplaintDao dao = new ComplaintDao();

            if ("update".equalsIgnoreCase(action)) {
                if (newText != null && !newText.trim().isEmpty()) {
                    int rows = dao.updateComplaint(complaintId, email, newText.trim());
                    System.out.println("Update rows count: " + rows);
                }
            } else if ("delete".equalsIgnoreCase(action)) {
              dao.cancelComplaint(complaintId, email);
             
            }

            response.sendRedirect("viewComplaints.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}

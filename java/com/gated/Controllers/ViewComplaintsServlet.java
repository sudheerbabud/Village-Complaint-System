package com.gated.Controllers;

import java.io.IOException;
import java.util.List;

import com.gated.dao.ComplaintDao;
import com.gated.model.Complaint;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/viewComplaints")
public class ViewComplaintsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("userEmail");

        ComplaintDao dao = new ComplaintDao();
        List<Complaint> complaints = dao.getUserComplaints(email);

        request.setAttribute("complaints", complaints);
        request.getRequestDispatcher("viewComplaints.jsp").forward(request, response);
    }
}

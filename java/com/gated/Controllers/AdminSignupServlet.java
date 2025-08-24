package com.gated.Controllers;


import java.io.IOException;

import com.gated.dao.AdminDao;
import com.gated.model.Admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminsignup")
public class AdminSignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Admin admin = new Admin(email, password);
        AdminDao adminDao = new AdminDao();
        adminDao.saveAdmin(admin);

        RequestDispatcher dispatcher = request.getRequestDispatcher("adminlogin.jsp");
        dispatcher.forward(request, response);
    }
}

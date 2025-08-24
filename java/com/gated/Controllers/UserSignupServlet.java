package com.gated.Controllers;


import java.io.IOException;

import com.gated.dao.UserDao;
import com.gated.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/usersignup")
public class UserSignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User user = new User(email,password);
		UserDao userDao = new UserDao();
		userDao.saveUser(user);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("userlogin.jsp");
		requestDispatcher.forward(request, response);
	}

}
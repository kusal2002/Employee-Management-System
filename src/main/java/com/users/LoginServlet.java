package com.users;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DBConnect;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static Connection con = null;
	private static PreparedStatement pst = null;
	private static ResultSet rs = null;
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uemail = request.getParameter("username");
		String upwd = request.getParameter("password");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;

		try {
			con = DBConnect.getConnection();
		
			pst = con.prepareStatement("select * from users where username = ? and password = ?");
			pst.setString(1, uemail);
			pst.setString(2, upwd);

			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				int role = rs.getInt("role");
				session.setAttribute("name", rs.getString("username"));
				session.setAttribute("id", rs.getString("user_id"));
				session.setAttribute("role", role); 

				if (role == 1) {
					request.setAttribute("status", "success");
					dispatcher = request.getRequestDispatcher("admin/index.jsp"); 

				} else if (role == 2) {
					request.setAttribute("status", "success");
					dispatcher = request.getRequestDispatcher("gmanager/index.jsp"); 
					

				} else if (role == 3) {
					request.setAttribute("status", "success");
					dispatcher = request.getRequestDispatcher("hrmanager/index.jsp");
					

				}else if (role == 4) {
					session.setAttribute("status", "success");
					dispatcher = request.getRequestDispatcher("employee/index.jsp");

				} else {
					request.setAttribute("status", "failed");
					dispatcher = request.getRequestDispatcher("/Employee_Management_System/login.jsp");
				}
			} else {
				session.setAttribute("status", "failed");
			    response.sendRedirect("/Employee_Management_System/login.jsp");
			}

			dispatcher.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

package com.users;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uname = request.getParameter("username");
		String uemail = request.getParameter("email");
		String upwd = request.getParameter("password");
		
		RequestDispatcher dispatcher = null;
		Connection con =null;
		
//		PrintWriter out = response.getWriter();
//		out.print(uname);
//		out.print(uemail);
//		out.print(upwd);	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management_system?useSSL=false","root","Saparamadu@123");
			PreparedStatement pst = con.prepareStatement("insert into users(username, password, email) values(?,?,?)");
			pst.setString(1, uname);
			pst.setString(2, uemail);
			pst.setString(3, upwd);
			
			int rowCount = pst.executeUpdate();
			
			dispatcher = request.getRequestDispatcher("/Employee_Management_System/register.jsp");
			if(rowCount > 0 ) {
				
				response.sendRedirect("/Employee_Management_System/index.jsp");
				//request.setAttribute("status", "success");
				
			}else {
				request.setAttribute("status", "failed");
				request.getRequestDispatcher("/Employee_Management_System/register.jsp").forward(request, response);
			}
			
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				con.close();	
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}

}

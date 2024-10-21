package com.employee;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertServlet
 */
@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String role = request.getParameter("role");
		
		boolean isTrue;
		
		isTrue = EmployeeController.insertdata(username, password, email, role);
		
		if(isTrue == true) {
			String alertMessage = "Data insert successful";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='/Employee_Management_System/admin/display.jsp'</script>");
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}

	}

}

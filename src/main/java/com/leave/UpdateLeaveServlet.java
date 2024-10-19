package com.leave;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateLeaveServlet")
public class UpdateLeaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// Handle GET requests
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// No implementation here
	}

	// Handle POST requests
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String attendanceId = request.getParameter("attendance_id");
		String attendanceDate = request.getParameter("attendance_date");
		String status = request.getParameter("status");
		String leaveType = request.getParameter("leave_type");
		String leaveReason = request.getParameter("leave_reason");
		
		boolean isTrue;
		isTrue = LeaveController.updateData(Integer.parseInt(attendanceId), attendanceDate, status, leaveType, leaveReason);
		
		if(isTrue == true) {
			// Get updated details by attendance ID
			List<LeaveModel> leaveDetails = LeaveController.getById(attendanceId);
			request.setAttribute("leaveDetails", leaveDetails);
			
			String alertMessage = "Data update successful";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='/Employee_Management_System/hrmanager/leaverecordsdisplay.jsp'</script>");
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
	}
}

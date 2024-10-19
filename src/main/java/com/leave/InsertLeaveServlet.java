package com.leave;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/InsertLeaveServlet")
public class InsertLeaveServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the data from the request (parameters)
        String employeeId = request.getParameter("employee_id");
        String attendanceDate = request.getParameter("attendance_date");
        String status = request.getParameter("status");
        String leaveType = request.getParameter("leave_type");
        String leaveReason = request.getParameter("leave_reason");
        
        boolean isTrue;
        
        // Insert data into the LeaveModel (assuming insertData method in LeaveController)
        isTrue = LeaveController.insertData(Integer.parseInt(employeeId), attendanceDate, status, leaveType, leaveReason);
        
        // If insertion is successful
        if(isTrue == true) {
            String alertMessage = "Data insert successful";
            response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href='/Employee_Management_System/hrmanager/leaverecordsdisplay.jsp'</script>");
        } 
        // If insertion fails, redirect to the error page
        else {
            RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
            dis2.forward(request, response);
        }
    }
}

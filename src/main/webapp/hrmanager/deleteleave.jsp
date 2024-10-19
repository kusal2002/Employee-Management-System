<%@page import="com.leave.LeaveController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    int AttendanceID = Integer.parseInt(request.getParameter("attendance_id"));
    LeaveController leaveDB = new LeaveController();
    boolean isDeleted = leaveDB.deleteData(AttendanceID);

    if (isDeleted) {
        response.sendRedirect("/Employee_Management_System/hrmanager/leaverecordsdisplay.jsp"); // Redirect to task list after deletion
    } else {
        out.println("Failed to delete task.");
    }
%>

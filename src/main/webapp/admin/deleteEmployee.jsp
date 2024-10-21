<%@page import="com.employee.EmployeeController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.task.TaskDBUtil"%>

<%
int employeeId = Integer.parseInt(request.getParameter("employee_id"));
EmployeeController employeedb = new EmployeeController();
boolean isDeleted = employeedb.deletedata(employeeId);

if (isDeleted) {
	response.sendRedirect("/Employee_Management_System/admin/display.jsp");
} else {
	out.println("Failed to delete task.");
}
%>
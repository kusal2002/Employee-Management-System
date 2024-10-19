<%@page import="com.payroll.PayrollController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    int payrollId = Integer.parseInt(request.getParameter("payrollID"));
    PayrollController payrolldatabase = new PayrollController();
    boolean isDeleted = payrolldatabase.deletePayrollData(payrollId);

    if (isDeleted) {
        response.sendRedirect("payrolldisplay.jsp"); // Redirect to task list after deletion
    } else {
        out.println("Failed to delete task.");
    }
%>

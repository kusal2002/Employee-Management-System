<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.task.TaskDBUtil"%>

<%
    int taskId = Integer.parseInt(request.getParameter("task_id"));
    TaskDBUtil taskdb = new TaskDBUtil();
    boolean isDeleted = taskdb.deleteTask(taskId);

    if (isDeleted) {
        response.sendRedirect("taskdisplay.jsp"); // Redirect to task list after deletion
    } else {
        out.println("Failed to delete task.");
    }
%>

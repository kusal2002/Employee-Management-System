package com.task;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TaskServlet
 */
@WebServlet("/TaskServlet")
public class TaskInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Task task = new Task();
		task.setTaskname(request.getParameter("taskName"));
		task.setDescription(request.getParameter("description"));
		task.setStatus(request.getParameter("status"));
		task.setDueDate(request.getParameter("dueDate"));
		task.setUserId(Integer.parseInt(request.getParameter("user_id")));

		TaskDBUtil taskservice = new TaskDBUtil();
		taskservice.insertTask(task);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/employee/taskdisplay.jsp");
		dispatcher.forward(request, response);

	}

}

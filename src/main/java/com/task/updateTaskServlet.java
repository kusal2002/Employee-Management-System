package com.task;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class updateTaskServlet
 */
@WebServlet("/updateTaskServlet")
public class updateTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int taskId = Integer.parseInt(request.getParameter("task_id"));
        String taskname = request.getParameter("taskName");
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        String dueDate = request.getParameter("due_date");
        int userId = Integer.parseInt(request.getParameter("user_id"));

        
        Task task = new Task(taskId, taskname, description, status, dueDate, userId);
        TaskDBUtil taskdb = new TaskDBUtil();
        boolean isUpdated = taskdb.updateTask(task);
        
        if (isUpdated) {
            response.sendRedirect("/Employee_Management_System/employee/taskdisplay.jsp");
        } else {
            response.getWriter().write("Failed to update task");
        }
	}

}

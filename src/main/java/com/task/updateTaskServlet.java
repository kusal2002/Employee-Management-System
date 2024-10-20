package com.task;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class updateTaskServlet
 */
@WebServlet("/updateTaskServlet")
public class updateTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();

		
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
        	String alertMessage = "Task data insert successful";
            response.getWriter().println("<script> alert('" + alertMessage + "'); window.location.href='/Employee_Management_System/gmanager/payrolldisplay.jsp'</script>");
//    		session.setAttribute("taskstatus", "success");
//            response.sendRedirect("/Employee_Management_System/employee/taskdisplay.jsp");
        } else {
    		session.setAttribute("taskstatus", "failed");
            response.sendRedirect("/Employee_Management_System/employee/updatetask.jsp");
        }
	}

}

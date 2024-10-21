package com.task;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnect;

public class TaskDBUtil implements TaskDAO{
	Connection con = null;
	Statement stmt = null;

	public void insertTask(Task task) {
		try {
			String sql = "INSERT INTO tasks (title, description, status, due_date, user_id) VALUES ('"
					+ task.getTaskname() + "', '" + task.getDescription() + "', '" + task.getStatus() + "', '"
					+ task.getDueDate() + "', '" + task.getUserId() + "')";

			con = DBConnect.getConnection();
			stmt = con.createStatement();
			stmt.executeUpdate(sql);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public List<Task> getAll(int userId) {
	    List<Task> tasks = new ArrayList<>();

	    try {
	        String sql = "SELECT * FROM tasks WHERE user_id = ? ORDER BY created_at ASC";
	        con = DBConnect.getConnection();
	        PreparedStatement stmt = con.prepareStatement(sql);
	        stmt.setInt(1, userId);
	        ResultSet rs = stmt.executeQuery();

	        // Iterate through the result set
	        while (rs.next()) {
	            Task task = new Task();
	            task.setTaskid(rs.getInt("task_id"));
	            task.setTaskname(rs.getString("title"));
	            task.setDescription(rs.getString("description"));
	            task.setStatus(rs.getString("status"));
	            task.setDueDate(rs.getString("due_date"));
	            task.setUserId(rs.getInt("user_id"));
	            tasks.add(task); // Add each task to the list
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (stmt != null) stmt.close();
	            if (con != null) con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return tasks;
	}



	public Task getTaskById(int taskId) {
		Task task = null;
		try {
			String sql = "SELECT * FROM tasks WHERE task_id = " + taskId;

			con = DBConnect.getConnection();
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			if (rs.next()) {
				task = new Task();
				task.setTaskid(rs.getInt("task_id"));
				task.setTaskname(rs.getString("title"));
				task.setDescription(rs.getString("description"));
				task.setStatus(rs.getString("status"));
				task.setDueDate(rs.getString("due_date"));
				task.setUserId(rs.getInt("user_id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return task;
	}

	public boolean updateTask(Task task) {

		try {
			String sql = "UPDATE tasks SET title = ?, description = ?, status = ?, due_date = ? WHERE task_id = ?";
			con = DBConnect.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, task.getTaskname());
			stmt.setString(2, task.getDescription());
			stmt.setString(3, task.getStatus());
			stmt.setString(4, task.getDueDate());
			stmt.setInt(5, task.getTaskid());

			int rowsUpdated = stmt.executeUpdate();
			return rowsUpdated > 0;

		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean deleteTask(int taskId) {
		try {
			String sql = "DELETE FROM tasks WHERE task_id = ?";
			con = DBConnect.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, taskId);
			int rowsDeleted = stmt.executeUpdate();
			return rowsDeleted>0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}

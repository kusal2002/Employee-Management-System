package com.task;

public class Task {
	int taskid;
	String taskname;
	String description;
	String status;
	String dueDate;
	int userId;
	
	public Task() {}

	public Task(int taskid, String taskname, String description, String status, String dueDate, int userId) {
		super();
		this.taskid = taskid;
		this.taskname = taskname;
		this.description = description;
		this.status = status;
		this.dueDate = dueDate;
		this.userId = userId;
	}

	public int getTaskid() {
		return taskid;
	}

	public void setTaskid(int taskid) {
		this.taskid = taskid;
	}

	public String getTaskname() {
		return taskname;
	}

	public void setTaskname(String taskname) {
		this.taskname = taskname;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDueDate() {
		return dueDate;
	}

	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

}

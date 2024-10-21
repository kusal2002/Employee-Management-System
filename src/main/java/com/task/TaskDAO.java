package com.task;

import java.util.List;

public interface TaskDAO {
    void insertTask(Task task);
    List<Task> getAll(int userId);
    Task getTaskById(int taskId);
    boolean updateTask(Task task);
    boolean deleteTask(int taskId);
}

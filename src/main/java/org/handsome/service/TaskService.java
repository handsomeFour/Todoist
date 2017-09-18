package org.handsome.service;

import org.handsome.entity.Task;

import java.util.List;

/**
 * Created by June on 2017/5/28.
 */

public interface TaskService {
    List<Task> findAll();
    int addTask(Task task);
    int delTask(int id);
    Task findById(int id);
    int update(Task task);
}

package com.tao.service;

import java.util.List;

import com.tao.entity.Task;

public interface TaskService extends BaseService<Task>{

	public List<Task> selectTaskList(Task t);
}

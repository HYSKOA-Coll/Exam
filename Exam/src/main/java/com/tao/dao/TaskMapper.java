package com.tao.dao;

import java.util.List;

import com.tao.entity.Task;

public interface TaskMapper extends BaseMapper<Task>{

	public List<Task> selectTaskList(Task t);
}

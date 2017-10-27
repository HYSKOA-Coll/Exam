package com.tao.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tao.entity.Task;
import com.tao.entity.Task_package;
import com.tao.service.TaskService;

@Service
public class TaskServiceImpl extends BaseServiceImpl<Task> implements TaskService{

	public List<Task> selectTaskList(Task t){
		
		return taskMapper.selectTaskList(t);
	}
}

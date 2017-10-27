package com.tao.service;

import java.util.List;
import java.util.Map;

import com.tao.entity.Task_execute;
import com.tao.page.PageBean;

public interface Task_executeService extends BaseService<Task_execute>{

	public List<Task_execute> select_answer(Task_execute t);
	
	public int insertTask(Task_execute taskExecute);
}

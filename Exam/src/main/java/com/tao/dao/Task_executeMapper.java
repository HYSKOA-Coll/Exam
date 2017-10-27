package com.tao.dao;

import java.util.List;
import java.util.Map;

import com.tao.entity.Info;
import com.tao.entity.Task_execute;
import com.tao.page.PageBean;

public interface Task_executeMapper extends BaseMapper<Task_execute>{

	public List<Task_execute> select_answer(Task_execute t);
	
	
	/**
	 * 课后布置作业
	 */
	public List<Info> selectInfoId(int clazz_id);
	public int insertInstanceTask(Task_execute taskExecute);
}

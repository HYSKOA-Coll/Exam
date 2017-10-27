package com.tao.dao;


import com.tao.entity.Task_package;

public interface Task_packageMapper extends BaseMapper<Task_package>{

	public Task_package select_n(Task_package t);
}

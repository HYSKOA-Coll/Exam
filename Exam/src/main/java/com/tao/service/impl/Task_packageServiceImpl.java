package com.tao.service.impl;

import org.springframework.stereotype.Service;

import com.tao.entity.Major;
import com.tao.entity.Task_package;
import com.tao.service.Task_packageService;

@Service
public class Task_packageServiceImpl extends BaseServiceImpl<Task_package> implements Task_packageService{

	@Override
	public Task_package select_n(Task_package t) {
		// TODO Auto-generated method stub
		return task_packageMapper.select_n(t);
	}

	

}

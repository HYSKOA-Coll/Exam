package com.tao.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.tao.entity.Info;
import com.tao.entity.Task_execute;
import com.tao.page.PageBean;
import com.tao.service.Task_executeService;

@Service
public class Task_executeServiceImpl extends BaseServiceImpl<Task_execute> implements Task_executeService{

	@Override
	public List<Task_execute> select_answer(Task_execute t){
		// TODO Auto-generated method stub
		return task_executeMapper.select_answer(t);
	}

	
	@Override
	public int insertTask(Task_execute taskExecute) {
		List<Info> infoList = task_executeMapper.selectInfoId(taskExecute.getClazz_id());
		System.out.println("infoList---"+infoList);
		
		for (Info info : infoList) {
			System.out.println("info_id---"+info.getInfo_id());
			taskExecute.setInfo_id(info.getInfo_id());
			task_executeMapper.insertInstanceTask(taskExecute);
		}
		
		return 1;
	}

}

package com.tao.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ModelDriven;
import com.tao.entity.Task_answer;
import com.tao.entity.Task_execute;
import com.tao.service.Task_answerService;
import com.tao.service.Task_executeService;

public class Task_answerAction implements ModelDriven<Task_answer>{
	
	@Resource
	private Task_answerService task_answerService;
	@Resource
	private Task_executeService task_executeService;

	Task_answer t = new Task_answer();
	Task_execute task_execute = new Task_execute();
	@Override
	public Task_answer getModel() {
		// TODO Auto-generated method stub
		return t;
	}
	
	private Object ResponseJSON;
	public Object getResponseJSON() {
		return ResponseJSON;
	}
	public void setResponseJSON(Object responseJSON) {
		ResponseJSON = responseJSON;
	}
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	
	public String save_draft() throws ParseException{
		System.out.println("----Task_executeAction----save_draft----------"+t);
		
		String answer = request.getParameter("answer");
		int task_execute_id = Integer.parseInt( request.getParameter("task_execute_id"));
		System.out.println("task_execute_id"+task_execute_id);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String time = sdf.format(date);
		System.out.println("date-----"+date);
		Task_answer t2 = task_answerService.select(t);
		if (t2 == null) {
			t.setTask_answer_answer(answer);
			t.setTask_answer_time(time);
			System.out.println(t);
			int a = task_answerService.insert(t);
			System.out.println("task_execute_id"+task_execute_id);
			System.out.println("task_execute"+task_execute);
			task_execute.setTask_execute_id(task_execute_id);
			task_execute.setTask_execute_finish(2);
			System.out.println(task_execute);
			int b = task_executeService.update(task_execute);
			if(a == 1 && b==1){
				setResponseJSON("success");
				return "success";
			}else{
				setResponseJSON("repeat");
				return "success";
			}
		}else if(t2 != null){
			t2.setTask_answer_answer(answer);
			t2.setTask_answer_time(time);
			System.out.println(t2);
			int a = task_answerService.update(t2);
			task_execute.setTask_execute_id(task_execute_id);
			task_execute.setTask_execute_finish(2);
			System.out.println(task_execute);
			int b = task_executeService.update(task_execute);
			if(a == 1 && b==1){
				setResponseJSON("success");
				return "success";
			}else{
				setResponseJSON("repeat");
				return "success";
			}
		
	}
		setResponseJSON("repeat");
		return "success";
	}
	
	
	public String save() throws ParseException{
		System.out.println("----Task_executeAction----save----------"+t);
		
		String answer = request.getParameter("answer");
		int task_execute_id = Integer.parseInt( request.getParameter("task_execute_id"));
		System.out.println("task_execute_id"+task_execute_id);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String time = sdf.format(date);
		System.out.println("date-----"+date);
		Task_answer t2 = task_answerService.select(t);
		if (t2 == null) {
			t.setTask_answer_answer(answer);
			t.setTask_answer_time(time);
			System.out.println(t);
			int a = task_answerService.insert(t);
			System.out.println("task_execute_id"+task_execute_id);
			System.out.println("task_execute"+task_execute);
			task_execute.setTask_execute_id(task_execute_id);
			task_execute.setTask_execute_finish(1);
			System.out.println(task_execute);
			int b = task_executeService.update(task_execute);
			if(a == 1 && b==1){
				setResponseJSON("success");
				return "success";
			}else{
				setResponseJSON("repeat");
				return "success";
			}
		}else if(t2 != null){
			t2.setTask_answer_answer(answer);
			t2.setTask_answer_time(time);
			System.out.println(t2);
			int a = task_answerService.update(t2);
			task_execute.setTask_execute_id(task_execute_id);
			task_execute.setTask_execute_finish(1);
			System.out.println(task_execute);
			int b = task_executeService.update(task_execute);
			if(a == 1 && b==1){
				setResponseJSON("success");
				return "success";
			}else{
				setResponseJSON("repeat");
				return "success";
			}
		
	}
		setResponseJSON("repeat");
		return "success";
	}
	
	
}
package com.tao.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.JSONException;
import org.apache.struts2.json.JSONUtil;

import com.opensymphony.xwork2.ModelDriven;
import com.tao.entity.Task;
import com.tao.entity.Task_package;
import com.tao.service.TaskService;
import com.tao.service.Task_packageService;

public class TaskAction implements ModelDriven<Task>{

	@Resource
	private TaskService taskService;
	@Resource
	private Task_packageService task_packageService;
	
	Task t = new Task();
	@Override
	public Task getModel() {
		// TODO Auto-generated method stub
		return t;
	}

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession(); 
	
	private Object ResponseJSON;
	public Object getResponseJSON() {
		return ResponseJSON;
	}
	public void setResponseJSON(Object responseJSON) {
		ResponseJSON = responseJSON;
	}
	
	
	public String task;
	public String getQuestion() {
		return task;
	}
	public void setQuestion(String task) {
		this.task = task;
	}

	
	public String insert() throws JSONException{
		
		System.out.println("---------TaskAction---insert--------");
		
//		String task_package_name = (String)request.getParameter("task_package_name");
//		System.out.println(task_package_name);
//		Task_package task_package2 = new Task_package();
//		
//		System.out.println("task_package2----"+task_package2);
//		task_package2 = task_packageService.select(task_package2);
//		System.out.println("task_package2----"+task_package2);
//		int id = task_package2.getTask_package_id();
//		int info_id = (int) session.getAttribute("teacher_id");
//		
//		Object obj = JSONUtil.deserialize(task);
//		System.out.println(obj.toString());
//		ArrayList arrlists = (ArrayList) obj;
//		ArrayList packetlist =(ArrayList) arrlists.get(0);
//		for (Object packetmap : packetlist) {
//			HashMap packmap = (HashMap) packetmap;
//			t.setTask_name(packmap.get("task_name").toString());
//			t.setTask_option(packmap.get("task_option").toString());
//			t.setTask_correct(packmap.get("task_correct").toString());
//			t.setTask_package_id(id);
//			t.setTask_type(packmap.get("task_type").toString());
//			t.setInfo_id(info_id);
//			taskService.insert(t);
//		}
		return "success";
	}
	
	
	public String selectList(){
		
		System.out.println("-----TaskAction-------selectList--------");
		System.out.println(t);
		List<Task> list = taskService.selectTaskList(t);
		System.out.println("list---"+list);
		session.setAttribute("list", list);
		setResponseJSON(list);
		
//		setResponseJSON("success");
		return "success";
	}
}

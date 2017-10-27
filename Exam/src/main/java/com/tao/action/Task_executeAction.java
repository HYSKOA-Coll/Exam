package com.tao.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.tao.entity.Task_execute;
import com.tao.page.PageBean;
import com.tao.service.TaskService;
import com.tao.service.Task_executeService;


public class Task_executeAction implements ModelDriven<Task_execute>{

	@Resource
	protected Task_executeService task_executeService;
	@Resource
	protected TaskService taskService;
	
	
	Task_execute task_execute = new Task_execute();
	@Override
	public Task_execute getModel() {
		// TODO Auto-generated method stub
		return task_execute;
	}
	
	
	private Object ResponseJSON;
	public Object getResponseJSON() {
		return ResponseJSON;
	}
	public void setResponseJSON(Object responseJSON) {
		ResponseJSON = responseJSON;
	}
	
	public int pageNow = 1;
	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	public String select(){
		System.out.println("------Task_executeAction------select---------------");
		
		PageBean<Task_execute> pageBean = new PageBean<Task_execute>();
		
		if(pageNow==0){
			pageNow=1;
		}
		
		pageBean.setPageNow(pageNow);
		
		Map<String,Object> nmap=new HashMap<String,Object>();
		nmap.put("info_id", task_execute.getInfo_id());
		System.out.println(task_execute.getInfo_id());
		nmap.put("task_execute_finish", task_execute.getTask_execute_finish());
		pageBean.setParams(nmap);
		System.out.println("nmap-------"+nmap);
		System.out.println(pageBean.getParams());
		
		task_executeService.selectPage(pageBean);
		
		Map<String, Object> map = ActionContext.getContext().getContextMap();
		System.out.println("pageBean---------"+pageBean);
		map.put("pageBean", pageBean);
		
		return "success";
	}
	
	
	
	public String select_answer(){
		System.out.println("----Task_executeAction----select_task----------"+task_execute);
		
		
		List list= task_executeService.select_answer(task_execute);
		session.setAttribute("task_execute_id", task_execute.getTask_execute_id());
		session.setAttribute("token", task_execute.getToken());
		session.setAttribute("list", list);
		setResponseJSON("success");
		return "success";
	}
	
	
	
	/**
	 * 添加课后作业
	 */
	public String instanceTask() {
		System.out.println("-------PlanInstanceAction---------instanceTask-------"+task_execute);
		
		task_execute.setTask_execute_finish(0);
		int count = task_executeService.insertTask(task_execute);
		System.out.println("count ---"+count);
		setResponseJSON("success");
		return "success";
		
	}
	
	
}

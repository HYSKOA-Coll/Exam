package com.tao.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.JSONException;
import org.apache.struts2.json.JSONUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.tao.entity.Info;
import com.tao.entity.Task;
import com.tao.entity.Task_package;
import com.tao.page.PageBean;
import com.tao.service.TaskService;
import com.tao.service.Task_packageService;

public class Task_packageAction implements ModelDriven<Task_package>{

	@Resource
	private Task_packageService task_packageService;
	@Resource
	private TaskService taskService;
	
	Task_package t = new Task_package();
	@Override
	public Task_package getModel() {
		// TODO Auto-generated method stub
		return t;
	}
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session =  request.getSession();
	
	private Object ResponseJSON;

	public Object getResponseJSON() {
		return ResponseJSON;
	}

	public void setResponseJSON(Object responseJSON) {
		ResponseJSON = responseJSON;
	}
	
	private List ResponseJSON1;
	

	public List getResponseJSON1() {
		return ResponseJSON1;
	}

	public void setResponseJSON1(List responseJSON1) {
		ResponseJSON1 = responseJSON1;
	}
	
	public String task;
	public String getQuestion() {
		return task;
	}
	public void setQuestion(String task) {
		this.task = task;
	}
	
//分页查询
	private int pageNow = 1;

	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
		System.out.println("-------setPageNow---");
		
	}
	
	public String getTask_pack(){
		System.out.println("----Task_packageAction-------getTask_pack-------------");
		HttpServletRequest request = ServletActionContext.getRequest();
		String info_id = request.getParameter("info_id");
		String nameOrapply = request.getParameter("nameOrapply");
		Map<String, Object> map = new HashMap<String, Object>();
		if (info_id == null || info_id =="" || info_id == "null") {
			info_id = "0";
		}
		map.put("info_id", info_id);
		if (nameOrapply != null && nameOrapply !="" && nameOrapply != "null") {
			map.put("nameOrapply", nameOrapply);
		}
		map.put("info_id", info_id);
		
		System.out.println("info_id"+info_id);
		request.setAttribute("info_id",info_id);
		
		PageBean<Task_package> pageBean = new PageBean<Task_package>();
		pageBean.setConditions2(map);
		if(pageNow==0){
			pageNow=1;
		}
		pageBean.setPageNow(pageNow);
		PageBean<Task_package> datas = task_packageService.selectPage(pageBean);
		
		
		System.out.println("datas---------------"+datas);
		Map<String, Object> cmMap = pageBean.getConditions2();
		System.out.println("---cmMap-------------"+cmMap);
		
		
		
		System.out.println("pageBean----------"+pageBean);
		
		System.out.println(pageBean.getDatas());
		request.setAttribute("pageBean", pageBean);
		return "success";
		
	}

	public String del_Task_pack(){
		
		System.out.println("----Task_packageAction-------del_Task_pack-------------");
		
		Task_package t2 = task_packageService.select(t);
		System.out.println("t2"+t2);
		int teacher_id = (int) session.getAttribute("teacher_id");
		System.out.println(teacher_id);
		if(t2.getInfo_id() != teacher_id){
			setResponseJSON("repeat");
			return "success";
		}else {
			task_packageService.delete(t);
			setResponseJSON("success");
			return "success";
		}
	}
	
	public String insert() throws JSONException, ParseException{
		
		System.out.println("-------Task_packageAction-----insert-------");
		
		Object info_id = session.getAttribute("teacher_id");
		System.out.println(info_id);
		int b = Integer.parseInt(info_id.toString()); 
		t.setInfo_id(b);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date date = sdf.parse(sdf.format(new Date()));
		t.setTask_package_time(date);
//		Task_package t2 = task_packageService.select_n(t);
//		System.out.println(t);
//		if (t2 == null) {
			int a = task_packageService.insert(t);
			if(a != 0){
				Task_package tt = task_packageService.select_n(t);
				System.out.println(tt);
				Task task2 = new Task();
				Task_package task_package2 = new Task_package();
				
				/*System.out.println("task_package2----"+task_package2);
				task_package2 = task_packageService.select(task_package2);
				System.out.println("task_package2----"+task_package2);*/
				int id = tt.getTask_package_id();
				int info_id2 = (int) session.getAttribute("teacher_id");
				
				Object obj = JSONUtil.deserialize(task);
				System.out.println("objjjjjjjjjjjjjjjjjjjjjjjj"+obj.toString());
				ArrayList arrlists = (ArrayList) obj;
				
				for(int i=0; i< arrlists.size();i++){
					ArrayList packetlist =(ArrayList) arrlists.get(i);
					System.out.println("packetlist========="+packetlist.toString());
				
				for (Object packetmap : packetlist) {
					HashMap packmap = (HashMap) packetmap;
					
					task2.setTask_name(packmap.get("task_name").toString());
					task2.setTask_option(packmap.get("task_option").toString());
					task2.setTask_correct(packmap.get("task_correct").toString());
					task2.setTask_package_id(id);
					task2.setTask_type(packmap.get("task_type").toString());
					task2.setInfo_id(info_id2);
					taskService.insert(task2);
				}
				}
				setResponseJSON("success");
				return "success";
			}else{
				setResponseJSON("repeat");
				return "success";
			}
			
//		}else{
//			setResponseJSON("repeat");
//			return "success";
//		}
		
	}
	
	
	
}

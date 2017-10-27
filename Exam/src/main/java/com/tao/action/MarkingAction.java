package com.tao.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tao.dao.MarkingMapper;
import com.tao.entity.Clazz;
import com.tao.entity.Marking;
import com.tao.service.ClazzService;
import com.tao.service.MarkingService;

/**
 *
 * 作业批阅相关action
 * 
 **/
public class MarkingAction extends ActionSupport implements ModelDriven<Marking>{

	@Resource
	private MarkingService markingService;
	private Marking marking = new Marking() ;
	@Resource
	private ClazzService clazzService;
	private Clazz clazz = new Clazz();
	@Override
	public Marking getModel() {
		// TODO Auto-generated method stub
		return marking;
	}
	
	private Object ResponseJSON;
	public Object getResponseJSON() {
		return ResponseJSON;
	}
	public void setResponseJSON(Object responseJSON) {
		ResponseJSON = responseJSON;
	}
	
//页面查询select中的选项  班级id 名字
	
	public String selectplayclazz(){
		System.out.println("-------Marking------selecthomeworkclazz-----------");	
		List list = clazzService.selectclazzlist(clazz);
		System.out.println(list);
		setResponseJSON(list);
		return "success";
	}
	//进入页面直接查询全部的学生作业
	public String selecthwlist(){
		System.out.println("-------Marking------selecthwlist-----------");
		List list = markingService.selecthwlist();
		System.out.println(list);
		ActionContext ac=ActionContext.getContext();
		 Map<String, Object> session=ac.getSession();
	        session.put("hwlist",list);
		setResponseJSON("success");
		return "success";
	}
	
	//根据选项的id 班级名字 查询 作业列表
	public String homeworklist(){
		System.out.println("-------Marking------homeworklist-----------");	
		String clazzid = ServletActionContext.getRequest().getParameter("clazz_id");
		if(clazzid != "全部班级"||clazzid.equals("全部")){
			String clazz_id = clazzid;
			String clazz_name = ServletActionContext.getRequest().getParameter("clazz_name");
			String Markingname = ServletActionContext.getRequest().getParameter("inpu");
			System.out.println("clazz_id---"+clazz_id+"clazz_name"+clazz_name+"Markingname"+Markingname);
			List list = markingService.selecthomeworklist(clazz);
			System.out.println(list);
			setResponseJSON("success");
		}else{
			int clazz_id = Integer.parseInt(clazzid);
		String clazz_name = ServletActionContext.getRequest().getParameter("clazz_name");
		String Markingname = ServletActionContext.getRequest().getParameter("inpu");
		System.out.println("clazz_id---"+clazz_id+"clazz_name"+clazz_name+"Markingname"+Markingname);
		List list = markingService.selecthomeworklist(clazz);
		System.out.println(list);
		setResponseJSON("success");
		}
		return "success";
		
	}
	
}

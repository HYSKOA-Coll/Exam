package com.tao.entity;

import java.sql.Timestamp;
import java.util.Date;


public class Task_package {

	private int task_package_id;
	private String task_package_name;	//作业名
	private Date task_package_time;		//创建时间
	private int plan_id;						//教学计划id
	private int info_id;						//创建老师id
	
	private String plan_name;				//教学计划名称
	private String plan_apply;				//教学计划适用学科
	private Timestamp plan_time;			//教学计划创建时间
	private String info_name;				//老师姓名
	
	public Task_package() {
		super();
	}
	
	public Task_package(int task_package_id, String task_package_name, Date task_package_time, int plan_id,
			int info_id) {
		super();
		this.task_package_id = task_package_id;
		this.task_package_name = task_package_name;
		this.task_package_time = task_package_time;
		this.plan_id = plan_id;
		this.info_id = info_id;
	}

	@Override
	public String toString() {
		return "Task_package [task_package_id=" + task_package_id + ", task_package_name=" + task_package_name
				+ ", task_package_time=" + task_package_time + ", plan_id=" + plan_id + ", info_id=" + info_id
				+ ", plan_name=" + plan_name + ", plan_apply=" + plan_apply + ", plan_time=" + plan_time
				+ ", info_name=" + info_name + "]";
	}

	public int getTask_package_id() {
		return task_package_id;
	}

	public void setTask_package_id(int task_package_id) {
		this.task_package_id = task_package_id;
	}

	public String getTask_package_name() {
		return task_package_name;
	}

	public void setTask_package_name(String task_package_name) {
		this.task_package_name = task_package_name;
	}

	public Date getTask_package_time() {
		return task_package_time;
	}

	public void setTask_package_time(Date task_package_time) {
		this.task_package_time = task_package_time;
	}

	public int getPlan_id() {
		return plan_id;
	}

	public void setPlan_id(int plan_id) {
		this.plan_id = plan_id;
	}

	public int getInfo_id() {
		return info_id;
	}

	public void setInfo_id(int info_id) {
		this.info_id = info_id;
	}

	public String getPlan_name() {
		return plan_name;
	}

	public void setPlan_name(String plan_name) {
		this.plan_name = plan_name;
	}

	public String getPlan_apply() {
		return plan_apply;
	}

	public void setPlan_apply(String plan_apply) {
		this.plan_apply = plan_apply;
	}

	public Timestamp getPlan_time() {
		return plan_time;
	}

	public void setPlan_time(Timestamp plan_time) {
		this.plan_time = plan_time;
	}

	public String getInfo_name() {
		return info_name;
	}

	public void setInfo_name(String info_name) {
		this.info_name = info_name;
	}
	
}

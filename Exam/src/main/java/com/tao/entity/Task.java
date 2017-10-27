package com.tao.entity;

public class Task {

	private int task_id;
	private String task_name;		//作业名
	private String task_option;	//作业内容（json）
	private String task_correct;	//正确答案
	private int info_id;				//老师id
	private int task_package_id;	//作业包id
	private String task_type;			//作业类型（1文字  2语音）
	

	private String task_package_name;
	
	public Task() {
		super();
	}
	
	public Task(int task_id, String task_name, String task_option, String task_correct, int info_id,
			int task_package_id,String task_type) {
		super();
		this.task_id = task_id;
		this.task_name = task_name;
		this.task_option = task_option;
		this.task_correct = task_correct;
		this.info_id = info_id;
		this.task_package_id = task_package_id;
		this.task_type = task_type;
	}

	@Override
	public String toString() {
		return "Task [task_id=" + task_id + ", task_name=" + task_name + ", task_option=" + task_option
				+ ", task_correct=" + task_correct + ", info_id=" + info_id + ", task_package_id=" + task_package_id
				+ ", task_type=" + task_type + "]";
	}

	public int getTask_id() {
		return task_id;
	}
	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}
	public String getTask_name() {
		return task_name;
	}
	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}
	public String getTask_option() {
		return task_option;
	}
	public void setTask_option(String task_option) {
		this.task_option = task_option;
	}
	public String getTask_correct() {
		return task_correct;
	}
	public void setTask_correct(String task_correct) {
		this.task_correct = task_correct;
	}
	public int getInfo_id() {
		return info_id;
	}
	public void setInfo_id(int info_id) {
		this.info_id = info_id;
	}
	public int getTask_package_id() {
		return task_package_id;
	}
	public void setTask_package_id(int task_package_id) {
		this.task_package_id = task_package_id;
	}
	public String getTask_type() {
		return task_type;
	}

	public void setTask_type(String task_type) {
		this.task_type = task_type;
	}
	public String getTask_package_name() {
		return task_package_name;
	}

	public void setTask_package_name(String task_package_name) {
		this.task_package_name = task_package_name;
	}
	
}

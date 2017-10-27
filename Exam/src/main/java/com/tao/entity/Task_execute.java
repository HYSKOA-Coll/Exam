package com.tao.entity;

public class Task_execute {

	private int task_execute_id;		
	private int task_package_id;		//作业包名称
	private String token;				//课堂 id
	private int info_id;					//学生id
	private int task_execute_finish;	//是否完成( 0未完成，1完成，2草稿)
	private String task_package_name;
	private String info_name;
	private String plan_name;
	private String start_time;
	private String task_name;
	private int task_id;
	private String task_option;
	private String task_answer_answer;
	private int clazz_id;
	
	public Task_execute() {
		super();
	}

	public Task_execute(int task_execute_id, int task_package_id, String token, int info_id, int task_execute_finish,
			String task_package_name, String info_name, String plan_name, String start_time, String task_name,
			int task_id, String task_option, String task_answer_answer, int clazz_id) {
		super();
		this.task_execute_id = task_execute_id;
		this.task_package_id = task_package_id;
		this.token = token;
		this.info_id = info_id;
		this.task_execute_finish = task_execute_finish;
		this.task_package_name = task_package_name;
		this.info_name = info_name;
		this.plan_name = plan_name;
		this.start_time = start_time;
		this.task_name = task_name;
		this.task_id = task_id;
		this.task_option = task_option;
		this.task_answer_answer = task_answer_answer;
		this.clazz_id = clazz_id;
	}

	@Override
	public String toString() {
		return "Task_execute [task_execute_id=" + task_execute_id + ", task_package_id=" + task_package_id + ", token="
				+ token + ", info_id=" + info_id + ", task_execute_finish=" + task_execute_finish
				+ ", task_package_name=" + task_package_name + ", info_name=" + info_name + ", plan_name=" + plan_name
				+ ", start_time=" + start_time + ", task_name=" + task_name + ", task_id=" + task_id + ", task_option="
				+ task_option + ", task_answer_answer=" + task_answer_answer + ", clazz_id=" + clazz_id + "]";
	}

	public int getTask_execute_id() {
		return task_execute_id;
	}

	public void setTask_execute_id(int task_execute_id) {
		this.task_execute_id = task_execute_id;
	}

	public int getTask_package_id() {
		return task_package_id;
	}

	public void setTask_package_id(int task_package_id) {
		this.task_package_id = task_package_id;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public int getInfo_id() {
		return info_id;
	}

	public void setInfo_id(int info_id) {
		this.info_id = info_id;
	}

	public int getTask_execute_finish() {
		return task_execute_finish;
	}

	public void setTask_execute_finish(int task_execute_finish) {
		this.task_execute_finish = task_execute_finish;
	}

	public String getTask_package_name() {
		return task_package_name;
	}

	public void setTask_package_name(String task_package_name) {
		this.task_package_name = task_package_name;
	}

	public String getInfo_name() {
		return info_name;
	}

	public void setInfo_name(String info_name) {
		this.info_name = info_name;
	}

	public String getPlan_name() {
		return plan_name;
	}

	public void setPlan_name(String plan_name) {
		this.plan_name = plan_name;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getTask_name() {
		return task_name;
	}

	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}

	public int getTask_id() {
		return task_id;
	}

	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}

	public String getTask_option() {
		return task_option;
	}

	public void setTask_option(String task_option) {
		this.task_option = task_option;
	}

	public String getTask_answer_answer() {
		return task_answer_answer;
	}

	public void setTask_answer_answer(String task_answer_answer) {
		this.task_answer_answer = task_answer_answer;
	}

	public int getClazz_id() {
		return clazz_id;
	}

	public void setClazz_id(int clazz_id) {
		this.clazz_id = clazz_id;
	}
	
}

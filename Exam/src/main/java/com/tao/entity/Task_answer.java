package com.tao.entity;

import java.util.Date;

public class Task_answer {

	private int task_answer_id;
	private String task_answer_answer;
	private String task_answer_score;
	private String task_answer_time;
	private String token;
	private int task_package_id;
	private int task_id;
	private int info_id;
	
	public Task_answer() {
		super();
	}

	public Task_answer(int task_answer_id, String task_answer_answer, String task_answer_score, String task_answer_time,
			String token, int task_package_id, int task_id, int info_id) {
		super();
		this.task_answer_id = task_answer_id;
		this.task_answer_answer = task_answer_answer;
		this.task_answer_score = task_answer_score;
		this.task_answer_time = task_answer_time;
		this.token = token;
		this.task_package_id = task_package_id;
		this.task_id = task_id;
		this.info_id = info_id;
	}

	@Override
	public String toString() {
		return "Task_answer [task_answer_id=" + task_answer_id + ", task_answer_answer=" + task_answer_answer
				+ ", task_answer_score=" + task_answer_score + ", task_answer_time=" + task_answer_time + ", token="
				+ token + ", task_package_id=" + task_package_id + ", task_id=" + task_id + ", info_id=" + info_id
				+ "]";
	}

	public int getTask_answer_id() {
		return task_answer_id;
	}

	public void setTask_answer_id(int task_answer_id) {
		this.task_answer_id = task_answer_id;
	}

	public String getTask_answer_answer() {
		return task_answer_answer;
	}

	public void setTask_answer_answer(String task_answer_answer) {
		this.task_answer_answer = task_answer_answer;
	}

	public String getTask_answer_score() {
		return task_answer_score;
	}

	public void setTask_answer_score(String task_answer_score) {
		this.task_answer_score = task_answer_score;
	}

	public String getTask_answer_time() {
		return task_answer_time;
	}

	public void setTask_answer_time(String task_answer_time) {
		this.task_answer_time = task_answer_time;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public int getTask_package_id() {
		return task_package_id;
	}

	public void setTask_package_id(int task_package_id) {
		this.task_package_id = task_package_id;
	}

	public int getTask_id() {
		return task_id;
	}

	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}

	public int getInfo_id() {
		return info_id;
	}

	public void setInfo_id(int info_id) {
		this.info_id = info_id;
	}
	
}

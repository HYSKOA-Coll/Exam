package com.tao.entity;

import java.util.Date;

/**
 * 作业批阅实体类
 * @author dx
 *
 */
public class Marking {
int task_package_id; //作业编号
String task_package_name;	//作业名称
Date task_package_time;	//作业创建数间
int clazznum;	//班级id
String clazzname;	//班级名称
int playnum; //提交人数
int playsup;	//提交分数
int plan_id;  //教学计划id
int info_id;  //教师id

public void HomeWorkplay(){
	
}

public void HomeWorkplay(int task_package_id,String task_package_name,Date task_package_time,int clazznum,String clazzname,int playnum,int playsup,int plan_id,int info_id){
	this.task_package_id=task_package_id;
	this.task_package_name=task_package_name;
	this.task_package_time=task_package_time;
	this.clazznum=clazznum;
	this.clazzname=clazzname;
	this.playnum=playnum;
	this.playsup=playsup;
	this.plan_id=plan_id;
	this.info_id=info_id;
	
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

public int getClazznum() {
	return clazznum;
}

public void setClazznum(int clazznum) {
	this.clazznum = clazznum;
}

public String getClazzname() {
	return clazzname;
}

public void setClazzname(String clazzname) {
	this.clazzname = clazzname;
}

public int getPlaynum() {
	return playnum;
}

public void setPlaynum(int playnum) {
	this.playnum = playnum;
}

public int getPlaysup() {
	return playsup;
}

public void setPlaysup(int playsup) {
	this.playsup = playsup;
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

@Override
public String toString() {
	return "Marking [task_package_id=" + task_package_id + ", task_package_name=" + task_package_name
			+ ", task_package_time=" + task_package_time + ", clazznum=" + clazznum + ", clazzname=" + clazzname
			+ ", playnum=" + playnum + ", playsup=" + playsup + ", plan_id=" + plan_id + ", info_id=" + info_id + "]";
}


	
}

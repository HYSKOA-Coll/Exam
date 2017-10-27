package com.tao.entity;
/**
 * 
 * 
 * 有关班级列表的实体类
 * @author dx
 *
 */
//create table studentlist (college_id int not null,college_name varchar(64) not null,major_id int not null,major_name varchar(64) not null,clazz_id int not null,clazz_name varchar(64) not null unique);
public class Studentlist {
private int college_id;
private String college_name;
private int major_id;
private String major_name;
private int clazz_id;
private String clazz_name;
private int count;


public Studentlist(){
	
}

public Studentlist(int college_id,String college_name,int major_id,String major_name,int clazz_id,String clazz_name,int count){
	this.college_id=college_id;
	this.college_name = college_name;
	this.major_id = major_id;
	this.major_name= major_name;
	this.clazz_id = clazz_id;
	this.clazz_name = clazz_name;
	this.count =  count;
	
}

public int getCollege_id() {
	return college_id;
}

public void setCollege_id(int college_id) {
	this.college_id = college_id;
}

public String getCollege_name() {
	return college_name;
}

public void setCollege_name(String college_name) {
	this.college_name = college_name;
}

public int getMajor_id() {
	return major_id;
}

public void setMajor_id(int major_id) {
	this.major_id = major_id;
}

public String getMajor_name() {
	return major_name;
}

public void setMajor_name(String major_name) {
	this.major_name = major_name;
}

public int getClazz_id() {
	return clazz_id;
}

public void setClazz_id(int clazz_id) {
	this.clazz_id = clazz_id;
}

public String getClazz_name() {
	return clazz_name;
}

public void setClazz_name(String clazz_name) {
	this.clazz_name = clazz_name;
}

public int getCount() {
	return count;
}

public void setCount(int count) {
	this.count = count;
}

@Override
public String toString() {
	return "Studentlist [college_id=" + college_id + ", college_name=" + college_name + ", major_id=" + major_id
			+ ", major_name=" + major_name + ", clazz_id=" + clazz_id + ", clazz_name=" + clazz_name + ", count="
			+ count + "]";
}




	
	
}

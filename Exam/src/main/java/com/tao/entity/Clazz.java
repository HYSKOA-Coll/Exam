package com.tao.entity;

import java.util.HashMap;
import java.util.Map;

public class Clazz {
private int did;
private String dname;
private int mid;
private int college_id;
private String major_name;
private int clazz_id;
private String clazz_name;
private int major_id;
private Map<String,Object> params =new HashMap<String,Object>();

public void Clazz(){
	
	
}
                                                                                                   
public void Clazz(int did,String dname,int mid,int college_id,String major_name,int clazz_id,String clazz_name,int major_id,Map<String,Object> params){
	this.did=did;
	this.dname=dname;
	this.mid=mid;
	this.college_id=college_id;
	this.major_name=major_name;
	this.clazz_id=clazz_id;
	this.clazz_name=clazz_name;
	this.major_id=major_id;
	this.params = params;
}

public int getDid() {
	return did;
}

public void setDid(int did) {
	this.did = did;
}

public String getDname() {
	return dname;
}

public void setDname(String dname) {
	this.dname = dname;
}

public int getMid() {
	return mid;
}

public void setMid(int mid) {
	this.mid = mid;
}

public int getCollege_id() {
	return college_id;
}

public void setCollege_id(int college_id) {
	this.college_id = college_id;
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

public int getMajor_id() {
	return major_id;
}

public void setMajor_id(int major_id) {
	this.major_id = major_id;
}

public Map<String, Object> getParams() {
	return params;
}

public void setParams(Map<String, Object> params) {
	this.params = params;
}

@Override
public String toString() {
	return "Clazz [did=" + did + ", dname=" + dname + ", mid=" + mid + ", college_id=" + college_id + ", major_name="
			+ major_name + ", clazz_id=" + clazz_id + ", clazz_name=" + clazz_name + ", major_id=" + major_id
			+ ", params=" + params + "]";
}



}

package com.tao.entity;

import java.util.HashMap;
import java.util.Map;

/**
 * 学生表
 * @author dx
 *
 */
public class Studentman {
	private int info_id;
	private int info_num;  //学号
	private String info_name; 	//姓名
	private String info_pwd;	//密码	
	private String info_gender; 	 //性别
	private String info_phone; //电话
	private int info_judge;	//判断类型
	private int clazz_id;  //班级id
	private Map<String,Object> params =new HashMap<String,Object>();
	
	public Studentman(){
		
		
	}
	public Studentman(int info_id,int info_num,String info_name,String info_pwd,String info_gender,String info_phone,int info_judge,int clazz_id,Map<String,Object> params){
		this.info_id=info_id;
		this.info_num=info_num;
		this.info_name=info_name;
		this.info_pwd=info_pwd;
		this.info_gender=info_gender;
		this.info_phone=info_phone;
		this.info_judge=info_judge;
		this.clazz_id= clazz_id;
		this.params =params;
	}
	public int getInfo_id() {
		return info_id;
	}
	public void setInfo_id(int info_id) {
		this.info_id = info_id;
	}
	public int getInfo_num() {
		return info_num;
	}
	public void setInfo_num(int info_num) {
		this.info_num = info_num;
	}
	public String getInfo_name() {
		return info_name;
	}
	public void setInfo_name(String info_name) {
		this.info_name = info_name;
	}
	public String getInfo_pwd() {
		return info_pwd;
	}
	public void setInfo_pwd(String info_pwd) {
		this.info_pwd = info_pwd;
	}
	public String getInfo_gender() {
		return info_gender;
	}
	public void setInfo_gender(String info_gender) {
		this.info_gender = info_gender;
	}
	public String getInfo_phone() {
		return info_phone;
	}
	public void setInfo_phone(String info_phone) {
		this.info_phone = info_phone;
	}
	public int getInfo_judge() {
		return info_judge;
	}
	public void setInfo_judge(int info_judge) {
		this.info_judge = info_judge;
	}
	public int getClazz_id() {
		return clazz_id;
	}
	public void setClazz_id(int clazz_id) {
		this.clazz_id = clazz_id;
	}
	
	
	public Map<String, Object> getParams() {
		return params;
	}
	public void setParams(Map<String, Object> params) {
		this.params = params;
	}
	@Override
	public String toString() {
		return "Studentman [info_id=" + info_id + ", info_num=" + info_num + ", info_name=" + info_name + ", info_pwd="
				+ info_pwd + ", info_gender=" + info_gender + ", info_phone=" + info_phone + ", info_judge="
				+ info_judge + ", clazz_id=" + clazz_id + ", params=" + params + "]";
	}

}
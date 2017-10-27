package com.tao.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tao.entity.Clazz;
import com.tao.entity.College;
import com.tao.entity.Major;
import com.tao.entity.Studentlist;
import com.tao.entity.Studentman;
import com.tao.service.ClazzService;
import com.tao.service.CollegeService;
import com.tao.service.MajorService;
import com.tao.service.StudentlistService;
import com.tao.service.StudentmanService;
/**
 * 	学生列表查询
 * @author dx
 *
 */
@Controller
public class StudentmanAction extends ActionSupport implements ModelDriven<Studentman>{

	@Resource
	private StudentmanService studentmanService;
	private Studentman stu = new Studentman();
	@Resource
	private CollegeService collegeService;
	private College college = new College();
	@Resource
	private MajorService majorService;
	private Major major = new Major();
	
	@Resource
	private StudentlistService studentlistService;
	private Studentlist studentlist  = new Studentlist();
	@Resource
	private ClazzService clazzService;
	private Clazz clazz = new Clazz();
	@Override
	public Studentman getModel() {
		// TODO Auto-generated method stub
		return stu;
	}
	private Object ResponseJSON;
	public Object getResponseJSON() {
		return ResponseJSON;
	}
	public void setResponseJSON(Object responseJSON) {
		ResponseJSON = responseJSON;
	}
/**----------------------------添加学生-------------------------------------------**/	
	public String addstu(){
		System.out.println("-----------addstu--------");
		System.out.println("addstu---"+stu);
		int count = studentmanService.insert(stu);
		System.out.println(count);
		if (count != 0) {
			setResponseJSON("success");
		}else{
			setResponseJSON("repeat");
		}
	return "success";
	}
	/**======================删除学生  id===============================================**/
	public String deletestu(){
		System.out.println("deletestu************************"+stu);
		int count = studentmanService.delete(stu);
		setResponseJSON("success");
		return"success";
	}
	/**------------------------修改学生-------------------------------------------**/	
		public String updatestu(){
			System.out.println("-----------updatastu--------");
			String infonum = ServletActionContext.getRequest().getParameter("info_num");
			int info_num = Integer.parseInt(infonum);
			System.out.println("info_num---"+info_num);
			String info_name = ServletActionContext.getRequest().getParameter("info_name");
			String info_gender = ServletActionContext.getRequest().getParameter("info_gender");

			int count = studentmanService.update(stu);
			System.out.println(count);
			if (count != 0) {
				setResponseJSON("success");
			}else{
				setResponseJSON("repeat");
			}
		return "success";
		}
		
		
			/**--------------------------------班级全部学生-----------------------------------**/
				public String selectstu(){
					System.out.println("-----------selectstu--------");
					String clazzid = ServletActionContext.getRequest().getParameter("clazz_id");
					int clazz_id = Integer.parseInt(clazzid);
					stu.setClazz_id(clazz_id);
					System.out.println("stu---"+stu);
				List<Map> list =   studentmanService.selectlist(stu);
					System.out.println("selectstu"+list);
					 ActionContext ac=ActionContext.getContext();
					 Map<String, Object> session=ac.getSession();
				        session.put("list",list);
				        session.put("clazz_id",clazz_id);
				        setResponseJSON("success"); 
				return "success";
				}
				
				
				public String selectcount(){
					System.out.println("-----------selectcount--------");
					String clazzid = ServletActionContext.getRequest().getParameter("clazz_id");
					int clazz_id = Integer.parseInt(clazzid);
					int count = clazz_id;
					int count123 = studentmanService.selectcount(count);
					System.out.println("count123---------"+count123);
					setResponseJSON(count123); 
					return "success";
				}
				
				/**------------------------学院专业班级联查-----------------------------------------------**/
				//查洵学院	
				public String selectcollege(){
					System.out.println("-----------selectcollege--------");

				 List<College> list2 = collegeService.select_list_1(college);
					System.out.println(list2);
					 ActionContext ac=ActionContext.getContext();
					 Map<String, Object> session=ac.getSession();
				        session.put("list2",list2);
					setResponseJSON(list2);
				return "success";
				}
				
				//根据college查询专业
				public String selectmajor(){
					String collegeid = ServletActionContext.getRequest().getParameter("college_id");
					System.out.println("collegeid"+"----------"+collegeid);
					int college_id = Integer.parseInt(collegeid);
					System.out.println("-----------selectmajor--------");
				 List<Map> majorlist = majorService.selectbymid(college_id);
					System.out.println("major"+"-------------------"+majorlist);
					setResponseJSON(majorlist);
				return "success";
				}
				
				//根据major_id查询班级
				public String selectclazz(){
					System.out.println("-----------selectclazz--------");
					String majorid = ServletActionContext.getRequest().getParameter("major_id");
					System.out.println("majorid"+"----------"+majorid);
					int major_id = Integer.parseInt(majorid);
					List<Clazz> clazzlist = clazzService.selectmajorid(major_id);
					System.out.println("clazz"+"-------------------"+clazzlist);
						setResponseJSON(clazzlist);
				return "success";
				}
				/**==============================添加班级列表=====================================================**/
				public String addclasslist(){
					String college_name = ServletActionContext.getRequest().getParameter("college_name");
					System.out.println("college_name-------------------------"+college_name);
					String collegeid = ServletActionContext.getRequest().getParameter("college_id");
					int college_id = Integer.parseInt(collegeid);
					String major_name = ServletActionContext.getRequest().getParameter("major_name");
					String majorid = ServletActionContext.getRequest().getParameter("major_id");
					int major_id = Integer.parseInt(majorid);
					String class_name = ServletActionContext.getRequest().getParameter("class_name");
					String classid = ServletActionContext.getRequest().getParameter("class_id");
					int class_id = Integer.parseInt(classid);
					studentlist.setCollege_id(college_id);
					studentlist.setCollege_name(college_name);
					studentlist.setMajor_id(major_id);
					studentlist.setMajor_name(major_name);
					studentlist.setClazz_id(class_id);
					studentlist.setClazz_name(class_name);
					
					System.out.println("studentlist-----------------"+studentlist);
					int count =studentlistService.insert(studentlist);
					if(count != 0){
						setResponseJSON("success");
					}
						
					return "success";
				}
				/**------------------------查询班级列表----------------------------------------**/
				public String selectclasslist(){
		
					List<Studentlist> list =   studentlistService.selectclazzlist(studentlist);
					System.out.println("selectclasslist+++++++++++++++++++"+list);
					setResponseJSON(list);
					ActionContext ac=ActionContext.getContext();
					 Map<String, Object> session=ac.getSession();
				        session.put("clazzlist",list);
				return "success";	
				}
				
				
				public String deleteclasslist(){
					String clazzid = ServletActionContext.getRequest().getParameter("clazz_id");
					int clazz_id = Integer.parseInt(clazzid);
					studentlist.setClazz_id(clazz_id);
					System.out.println("clazz_id=================="+clazz_id);
					System.out.println(studentlist);
					int count1 = 	studentlistService.delete(studentlist);
					/*setResponseJSON(count1);*/
					System.out.println(count1);
					return "success";	
				}
				
				/**------------------------模糊查询-----------------------------------------------**/
				public String selectall(){
					String all = ServletActionContext.getRequest().getParameter("all");
					System.out.println(all);
					Map<String,Object> map=new HashMap<String,Object>();
					map.put("all", all);
					stu.setParams(map);
					System.out.println("stu setparams"+stu);
					if(all!=null || all!=""){
						stu.setParams(map);
						List<Map> list =   studentmanService.selectalllist(stu);
						System.out.println("模糊查询"+list);
						ActionContext ac=ActionContext.getContext();
						Map<String, Object> session=ac.getSession();
				        session.put("list",list);
						setResponseJSON("success");
					}else{
						setResponseJSON("repeat");
				}
					return"success";
}
}
package com.tao.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tao.entity.Info;
import com.tao.entity.InstanceAnswer;
import com.tao.entity.Percent;
import com.tao.entity.PlanInstance;
import com.tao.entity.Question;
import com.tao.entity.Teacher;
import com.tao.page.PageBean;
import com.tao.service.InstanceAnswerService;
import com.tao.service.PlanInstanceService;
import com.tao.service.QuestionService;

public class InstanceAnswerAction extends ActionSupport implements ModelDriven<InstanceAnswer>{

	@Resource
	private InstanceAnswerService instanceAnswerservice;
	@Resource
	private PlanInstanceService planinstanceservice;
	private InstanceAnswer instanceAnswer = new InstanceAnswer();
	
	@Override
	public InstanceAnswer getModel() {
		return instanceAnswer;
	}

	//json
	private Object responseJSON;
	public Object getResponseJSON() {
		return responseJSON;
	}
	public void setResponseJSON(Object responseJSON) {
		this.responseJSON = responseJSON;
	}
	
	
	/**
	 * 添加课堂答题
	 * @return
	 */
	public String addInstanceAnswer() {
		System.out.println("----InstanceAnswerAction-------addInstanceAnswer---"+instanceAnswer);
		
		int count = instanceAnswerservice.addinstanceAnswer(instanceAnswer);
		System.out.println("count--------"+count);
		
		setResponseJSON("success");
		return "success";
	}
	
	private int pageNow;
	private int instance_judge;
	public int getInstance_judge() {
		return instance_judge;
	}
	public void setInstance_judge(int instance_judge) {
		this.instance_judge = instance_judge;
	}
	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}
	public String selectAnswer() {
		System.out.println("---InstanceAnswerAction------selectAnswer----------"+instanceAnswer);
		
		PageBean<PlanInstance> pageBean = new PageBean<PlanInstance>();
		pageBean.setPageNow(pageNow);
		
		Map<String,Object> pmap=new HashMap<String,Object>();
		pmap.put("info_id", instanceAnswer.getInfo_id());
		pmap.put("instance_judge", instance_judge);
		pageBean.setParams(pmap);
		planinstanceservice.selectPage(pageBean);
		
		Map<String, Object> map = ActionContext.getContext().getContextMap();
		System.out.println("pageBean---------"+pageBean);
		map.put("endlist", pageBean);
		
		return "success";
	}
	
	/**
	 * 学生查询正在上的课
	 * @return
	 */	
	public String selectClazz() {
		System.out.println("---instanceAnswer--------selectClazz--------------"+instanceAnswer);
		
/*		instanceAnswer =  instanceAnswerservice.select(instanceAnswer);
		System.out.println("instanceAnswer---"+instanceAnswer);*/

		List<InstanceAnswer> inList = instanceAnswerservice.selectinstance(instanceAnswer);
		System.out.println("inList---"+inList);
		
			if(inList.size() == 0) {
			System.out.println("未上课");
			setResponseJSON("repeat");
			return "success";
		}
		
		System.out.println("instanceAnswer ----packet---------"+instanceAnswer.getPacket_id());
		
		setResponseJSON(inList);
		return "success";
	}
	
	/**
	 * 通过packet_id查询题目
	 * @return
	 */
	@Resource
	private QuestionService questionservice;
	
	public String packetIdselect() {
		System.out.println("---instanceAnswer----packetIdselect-----"+instanceAnswer+"--"+pageNow);
		
		PageBean<Question> pageBean = new PageBean<Question>();
		pageBean.setPageNow(pageNow);
		pageBean.setPageCount(1);
		Map<String,Object> stuqmap=new HashMap<String,Object>();
		stuqmap.put("info_id", instanceAnswer.getInfo_id());
		stuqmap.put("token", instanceAnswer.getToken());
		stuqmap.put("packet_name", instanceAnswer.getPacket_name());
		pageBean.setParams(stuqmap);
		
		questionservice.selectPage(pageBean);
		
		System.out.println("pageBean------"+pageBean);
		
		Map<String, Object> map = ActionContext.getContext().getContextMap();
		map.put("stuqlist", pageBean);
		return "success";
	}
	
	
	/**
	 * 学生回答
	 * @return
	 */
	public String updateAnswer() {
		System.out.println("---instanceAnswer------updateAnswer----------"+instanceAnswer);
		int count = instanceAnswerservice.update(instanceAnswer);
		
		if(count != 0) {
			setResponseJSON("success");
			return "success";
		}
		setResponseJSON("repeat");
		return "success";
	}
	
	
	/**
	 * 学生查询分数
	 * @return
	 */
	public String stuScore() {
		System.out.println("-----instanceAnsweinstanceAnswerrAction------stuScore----------"+instanceAnswer);
		
		List<InstanceAnswer> stuListAnswer = instanceAnswerservice.stuselect(instanceAnswer);
		System.out.println("stuListAnswer---"+stuListAnswer);
		System.out.println(stuListAnswer.size());
		Map<String,Object> map = ActionContext.getContext().getContextMap();
		
		map.put("stuListAnswer", stuListAnswer);
		map.put("packet_name", instanceAnswer.getPacket_name());
		map.put("stuListsize", stuListAnswer.size());
		return "success";
	}
	
	/**
	 * 老师查询成绩
	 * @return
	 */
	public String teaScore() {
		System.out.println("---instanceAnswerAction-------teaScore--------"+instanceAnswer);
		
/*		List<InstanceAnswer> taeList = instanceAnswerservice.taeselect(instanceAnswer);
		System.out.println("----taeList-------"+taeList);*/
		
		List<Info> infoList = instanceAnswerservice.selInfo(instanceAnswer.getClazz_id());
		System.out.println("infoList-------"+infoList);
		
		List<InstanceAnswer> iaList = instanceAnswerservice.stuselect(instanceAnswer);
		System.out.println("iaList-----"+iaList);
		
		ArrayList<Percent>  perList = new ArrayList<Percent>();
		List<Question> queList = instanceAnswerservice.pSelQ(instanceAnswer);
		for (Question question : queList) {
			instanceAnswer.setQuestion_id(question.getQuestion_id());
			Percent percent= instanceAnswerservice.selPercent(instanceAnswer);
			System.out.println("percent---------"+percent);
			perList.add(percent);
		}

		System.out.println("perList------"+perList);
		
		Map<String,Object> map = ActionContext.getContext().getContextMap();
		map.put("iaList1", infoList);
		map.put("iaList2", iaList);
		map.put("perList", perList);
		return "success";
	}
	
	
	/**
	 * 学生查询已完成课程详情
	 * @return
	 */
	public String stuSelquestion() {
		System.out.println("----instanceAnswerAction------stuSelquestion----------"+instanceAnswer);
		
		List<Question> questionList = instanceAnswerservice.stuSelQuestion(instanceAnswer);
		System.out.println("questionList----"+questionList);
		Map<String,Object> map = ActionContext.getContext().getContextMap();
		map.put("stuQuestion", questionList);
		return "success";
	}
	
	
}

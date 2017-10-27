package com.tao.service;

import java.util.List;

import com.tao.entity.Info;
import com.tao.entity.InstanceAnswer;
import com.tao.entity.Percent;
import com.tao.entity.Question;

public interface InstanceAnswerService extends BaseService<InstanceAnswer>{

	public List<Info> selInfo(int clazz_id);
	
	public int addinstanceAnswer(InstanceAnswer instanceAnswer);
	
	public List<InstanceAnswer> selectinstance(InstanceAnswer instanceAnswer);
	
	public List<InstanceAnswer> stuselect(InstanceAnswer instanceAnswer);
	
	public List<Question> stuSelQuestion(InstanceAnswer instanceAnswer);
	
	public List<Question> pSelQ(InstanceAnswer instanceAnswer);
	
	public Percent selPercent(InstanceAnswer instanceAnswer);
}

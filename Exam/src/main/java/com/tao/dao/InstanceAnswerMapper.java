package com.tao.dao;

import java.util.List;

import com.tao.entity.Info;
import com.tao.entity.InstanceAnswer;
import com.tao.entity.Percent;
import com.tao.entity.Question;

public interface InstanceAnswerMapper extends BaseMapper<InstanceAnswer>{

	public List<Info> selectInfo(int clazz_id);
	
	public int addAnswer(InstanceAnswer instanceAnswer);
	
	public List<InstanceAnswer> selectinstance(InstanceAnswer instanceAnswer);
	
	public List<InstanceAnswer> stuselect(InstanceAnswer instanceAnswer);
	
	public List<Question> stuSelQuestion(InstanceAnswer instanceAnswer);
	
	public List<Question> pSelQ(InstanceAnswer instanceAnswer);
	
	public Percent selPercent(InstanceAnswer instanceAnswer);
	
}

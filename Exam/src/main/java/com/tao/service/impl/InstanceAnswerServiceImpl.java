package com.tao.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tao.entity.Info;
import com.tao.entity.InstanceAnswer;
import com.tao.entity.Percent;
import com.tao.entity.Question;
import com.tao.service.InstanceAnswerService;

@Service
public class InstanceAnswerServiceImpl extends BaseServiceImpl<InstanceAnswer> implements InstanceAnswerService{

	@Override
	public int addinstanceAnswer(InstanceAnswer instanceAnswer) {
		
		List<Info> listInfo = instanceAnswerMapper.selectInfo(instanceAnswer.getClazz_id());
		System.out.println("listInfo------"+listInfo);
		
		for (Info info : listInfo) {
		instanceAnswer.setInfo_id(info.getInfo_id());
		int count = instanceAnswerMapper.addAnswer(instanceAnswer);
		System.out.println("count--------"+count);
		}
		
		return 0;
	}

	@Override
	public List<InstanceAnswer> selectinstance(InstanceAnswer instanceAnswer) {
		return instanceAnswerMapper.selectinstance(instanceAnswer);
	}

	@Override
	public List<InstanceAnswer> stuselect(InstanceAnswer instanceAnswer) {
		return instanceAnswerMapper.stuselect(instanceAnswer);
	}

	@Override
	public List<Info> selInfo(int clazz_id) {
		// TODO Auto-generated method stub
		return instanceAnswerMapper.selectInfo(clazz_id);
	}

	@Override
	public List<Question> stuSelQuestion(InstanceAnswer instanceAnswer) {
		// TODO Auto-generated method stub
		return instanceAnswerMapper.stuSelQuestion(instanceAnswer);
	}

	@Override
	public List<Question> pSelQ(InstanceAnswer instanceAnswer) {
		// TODO Auto-generated method stub
		return instanceAnswerMapper.pSelQ(instanceAnswer);
	}

	@Override
	public Percent selPercent(InstanceAnswer instanceAnswer) {
		// TODO Auto-generated method stub
		return instanceAnswerMapper.selPercent(instanceAnswer);
	}


}

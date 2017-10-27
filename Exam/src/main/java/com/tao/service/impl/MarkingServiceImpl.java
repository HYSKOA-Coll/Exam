package com.tao.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tao.entity.Clazz;
import com.tao.entity.Marking;
import com.tao.service.MarkingService;

@Service
public class MarkingServiceImpl extends BaseServiceImpl<Marking> implements MarkingService{

	@Override
	public List<Clazz> selectclazzlist(Clazz clazz) {
		// TODO Auto-generated method stub
		return markingMapper.selectplayclazz(clazz);
	}

	@Override
	public List<Marking> selecthomeworklist(Clazz clazz) {
		// TODO Auto-generated method stub
		return markingMapper.selecthomeworklist(clazz);
	}

	@Override
	public List<Marking> selecthwlist() {
		// TODO Auto-generated method stub
		return markingMapper.selecthwlist();
	}

}

package com.tao.service;

import java.util.List;

import com.tao.entity.Clazz;
import com.tao.entity.Marking;

public interface MarkingService extends BaseService<Marking>{
	public List<Clazz> selectclazzlist(Clazz clazz);
	public List<Marking> selecthomeworklist(Clazz clazz);
	public List<Marking> selecthwlist();
}

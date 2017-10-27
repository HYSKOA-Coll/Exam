package com.tao.dao;

import java.util.List;

import com.tao.entity.Clazz;
import com.tao.entity.Marking;

public interface MarkingMapper extends BaseMapper<Marking>{

	public List<Clazz> selectplayclazz(Clazz clazz);
	public List<Marking> selecthomeworklist(Clazz clazz);
	public List<Marking> selecthwlist();

}

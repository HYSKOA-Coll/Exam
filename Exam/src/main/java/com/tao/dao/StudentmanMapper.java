package com.tao.dao;

import java.util.List;
import java.util.Map;

import com.tao.entity.Clazz;
import com.tao.entity.Studentman;

public interface StudentmanMapper extends BaseMapper<Studentman>{

	public List<Map> selectlist(Studentman studentman);
	public List<Map> selectalllist(Studentman studentman);
	public List<Map> selectclazzlist(Clazz clazz);
	public int selectcount(int count);
}

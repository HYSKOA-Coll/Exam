package com.tao.service;

import java.util.List;
import java.util.Map;

import com.tao.entity.Clazz;

public interface ClazzService extends BaseService<Clazz>{

	public List<Map> select_mid(Clazz clazz);
	public List<Map> selectmid(int clazz_id);
	public List<Clazz> selectmajorid(int clazz_id);
	/**
	 * 上课模块引用clazz
	 */
	public List<Clazz> clazzIdName();
	public List<Clazz> selectclazzlist(Clazz clazz);
}

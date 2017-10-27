package com.tao.service;

import java.util.List;
import java.util.Map;

import com.tao.entity.Clazz;
import com.tao.entity.Studentman;

public interface StudentmanService extends BaseService<Studentman>{

	//学生列表查询
		public List<Map> selectlist(Studentman studentman);
		//模糊查询
		public List<Map> selectalllist(Studentman studentman);
		//版集列表
		public List<Map> selectclazzlist(Clazz clazz);
		//条数
		public int selectcount(int count);
}

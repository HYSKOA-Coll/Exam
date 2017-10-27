package com.tao.service;

import java.util.List;

import com.tao.entity.Studentlist;

public interface StudentlistService extends BaseService<Studentlist>{
	//根据查询全部班级
			public List<Studentlist> selectclazzlist(Studentlist studentlist);
}

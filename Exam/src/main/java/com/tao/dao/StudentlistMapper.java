package com.tao.dao;

import java.util.List;

import com.tao.entity.Studentlist;

public interface StudentlistMapper  extends BaseMapper<Studentlist>{
	//根据查询全部班级
			public List<Studentlist> selectclazzlist(Studentlist studentlist);
}

package com.tao.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.tao.entity.Clazz;
import com.tao.entity.Studentman;
import com.tao.service.StudentmanService;
@Service
public class StudentmanServiceImpl extends BaseServiceImpl<Studentman> implements StudentmanService{


	@Override
	//学生列表查询
	public List<Map> selectlist(Studentman studentman) {
		// TODO Auto-generated method stub
System.out.println("------StudentServiceImpl--------selectlist-------");
		
		return studentmanMapper.selectlist(studentman);
	}
	//模糊查询
	@Override
	public List<Map> selectalllist(Studentman studentman) {
		// TODO Auto-generated method stub
System.out.println("------StudentServiceImpl--------selectall-------");
		
		return studentmanMapper.selectalllist(studentman);
	}
	//版集列表
	@Override
	public List<Map> selectclazzlist(Clazz clazz) {
		// TODO Auto-generated method stub
System.out.println("------StudentServiceImpl--------selectclazzlist-------");
		
		return studentmanMapper.selectclazzlist(clazz);
	}
	
	//条数
		@Override
		public int selectcount(int count) {
			// TODO Auto-generated method stub
	System.out.println("------StudentServiceImpl--------selectclazzlist-------");
			
			return studentmanMapper.selectcount(count);
		}

}

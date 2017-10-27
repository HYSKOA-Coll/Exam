package com.tao.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tao.entity.Studentlist;
import com.tao.service.StudentlistService;
@Service
public class StudentlistServiceImpl extends BaseServiceImpl<Studentlist> implements StudentlistService{

	@Override
	public List<Studentlist> selectclazzlist(Studentlist studentlist) {
		// TODO Auto-generated method stub
		System.out.println("------ServiceImpl--------selectclazzlist-------");
		return studentlistMapper.selectclazzlist(studentlist);
	}


}

package com.care.root.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.mybatis.admin.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired AdminMapper mapper;
	
	@Override
	public void pbListAll(Model model, int num) {
		int pageLetter = 10;
		int allCount = mapper.PBCount();
		int repeat=allCount/pageLetter;
		
		if(allCount%pageLetter!=0) {
			repeat += 1;
		}
		int end = num*pageLetter;
		int start = end+1 - pageLetter;
		model.addAttribute("repeat", repeat);
		model.addAttribute("pbListAll", mapper.pbListAll(start,end));
		
	}

}

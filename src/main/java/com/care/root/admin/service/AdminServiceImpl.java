package com.care.root.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.mybatis.admin.AdminMapper;
import com.care.root.personalBoard.dto.PersonalBoardDTO;

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

	@Override
	public void pbView(Model model, int writeNum) {
		model.addAttribute("pbView", mapper.pbView(writeNum));
	}

	@Override
	public int reply(PersonalBoardDTO dto) {
		int result=0;
		try {
			result=mapper.reply(dto);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	

}

package com.care.root.personalBoard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.mybatis.personalBoard.PersonalBoardMapper;
import com.care.root.personalBoard.dto.PersonalBoardDTO;

@Service
public class PersonalBoardServiceImpl implements PersonalBoardService {

	@Autowired PersonalBoardMapper mapper;

//	@Override
//	public void pbList(Model model,String id) {
//		model.addAttribute("personalBoardList",mapper.pbList(id));	
//	}
	
	@Override
	public void pbList(Model model, String id, int num) {
		int pageLetter = 3;
		int allCount = mapper.PBCount(id);
		System.out.println("allCount : " + allCount);
		int repeat = allCount/pageLetter;
		if(allCount%pageLetter != 0) {
			repeat += 1;
		}
		int end = num*pageLetter;
		int start = end+1 - pageLetter;
		System.out.println("serviceImpl id : " + id);
		model.addAttribute("repeat", repeat);
		model.addAttribute("personalBoardList", mapper.pbList(id,start,end));
		
	}
	
	@Override
	public int save(PersonalBoardDTO dto) {
		int result=0;
		try {
			result=mapper.save(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void pbView(Model model, int writeNum) {
		model.addAttribute("personalData",mapper.pbView(writeNum));
	}

}

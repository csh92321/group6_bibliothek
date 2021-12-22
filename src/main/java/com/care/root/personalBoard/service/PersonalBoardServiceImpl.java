package com.care.root.personalBoard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.mybatis.personalBoard.PersonalBoardMapper;
import com.care.root.personalBoard.dto.PersonalBoardDTO;

@Service
public class PersonalBoardServiceImpl implements PersonalBoardService {

	@Autowired PersonalBoardMapper mapper;

	@Override
	public void pbList(Model model,String id) {
		model.addAttribute("personalBoardList",mapper.pbList(id));	
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

}

package com.care.root.personalBoard.service;

import org.springframework.ui.Model;

import com.care.root.personalBoard.dto.PersonalBoardDTO;

public interface PersonalBoardService {

	//public void pbList(Model model,String id);
	public void pbList(Model model, String id, int num);
	public int save(PersonalBoardDTO dto);
	public void pbView(Model model, int writeNum);
	
}

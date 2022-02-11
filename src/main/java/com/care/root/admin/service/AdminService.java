package com.care.root.admin.service;

import org.springframework.ui.Model;

import com.care.root.personalBoard.dto.PersonalBoardDTO;

public interface AdminService {

	public void pbListAll(Model model, int num);
	public void pbView(Model model, int writeNum);
	public int reply(PersonalBoardDTO dto);
}

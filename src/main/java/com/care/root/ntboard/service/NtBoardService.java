package com.care.root.ntboard.service;

import org.springframework.ui.Model;

import com.care.root.ntboard.DTO.NtBoardDTO;

public interface NtBoardService {

	public int ntWriteSave(NtBoardDTO dto);
	public void ntAllList(Model model);
	public void ntBoardContentView(int ntWriteNo, Model model);

}

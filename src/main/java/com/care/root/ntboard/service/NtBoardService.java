package com.care.root.ntboard.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.care.root.board.DTO.BoardDTO;
import com.care.root.ntboard.DTO.NtBoardDTO;

public interface NtBoardService {

	public int ntWriteSave(NtBoardDTO dto);
	public void ntAllList(Model model);
	public void ntBoardContentView(int ntWriteNo, Model model);
	
	public String ntBoardDelete(int writeNo, 
										HttpServletRequest request);

	public void getData(int writeNo, Model model);
	public int ntModify(BoardDTO dto);

}

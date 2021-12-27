package com.care.root.board.service;

import org.springframework.ui.Model;

import com.care.root.board.DTO.BoardDTO;

public interface BoardService {

	public int writeSave(BoardDTO dto);
	public void allList(Model model);	//void를 쓰는 이유는 반환타입을 지정하지 않아서/ model은 view단으로 넘겨주기 위해서
	public void contentView(int writeNo, Model model);


}
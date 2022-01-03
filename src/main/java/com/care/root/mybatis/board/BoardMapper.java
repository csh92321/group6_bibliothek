package com.care.root.mybatis.board;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.care.root.board.DTO.BoardDTO;
import com.care.root.board.DTO.BoardReDTO;

@Repository
public interface BoardMapper {
	public int writeSave(BoardDTO dto);
	public List<BoardDTO> allList();
	public BoardDTO contentView(int writeNo);
	
	public int boardDelete(int writeNo);
	public int modify(BoardDTO dto);
	
	//여기부터
	/*
	public int addReply(BoardReDTO dto) ;
	public List<BoardReDTO> getRepList(int write_group);
	public int selectBoardCount(); */
}

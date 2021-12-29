package com.care.root.mybatis.board;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.care.root.board.DTO.BoardDTO;

@Repository
public interface BoardMapper {
	public int writeSave(BoardDTO dto);
	public List<BoardDTO> allList();
	public BoardDTO contentView(int writeNo);
	
	public int boardDelete(int writeNo);
	public int modify(BoardDTO dto);
}

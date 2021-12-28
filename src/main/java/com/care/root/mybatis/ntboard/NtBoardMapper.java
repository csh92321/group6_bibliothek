package com.care.root.mybatis.ntboard;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.care.root.ntboard.DTO.NtBoardDTO;

@Repository
public interface NtBoardMapper {

	public int ntWriteSave(NtBoardDTO dto);
	public List<NtBoardDTO> ntAllList();
	public NtBoardDTO ntBoardContentView(int ntWriteNo);
	
	
	//test
	public int ntBoardDelete(int writeNo);
	
	
}

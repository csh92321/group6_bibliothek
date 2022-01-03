package com.care.root.ntboard.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.board.DTO.BoardDTO;
import com.care.root.mybatis.ntboard.NtBoardMapper;
import com.care.root.ntboard.DTO.NtBoardDTO;

@Service
public class NtBoardServiceImpl implements NtBoardService{

	
	@Autowired
	NtBoardMapper mapper;
	
	@Override
	public int ntWriteSave(NtBoardDTO dto) {
		
		int result=0;
		try {
			result = mapper.ntWriteSave(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void ntAllList(Model model) {
		model.addAttribute("ntAllList", mapper.ntAllList());
		int result = mapper.ntBoardDelete(0);
	}

	@Override
	public void ntBoardContentView(int ntWriteNo, Model model) {
		model.addAttribute("detailContent", mapper.ntBoardContentView(ntWriteNo));
		
	}

	//test
	@Override
	public String ntBoardDelete(int writeNo, HttpServletRequest request) {
		int result = mapper.ntBoardDelete(writeNo);
		String message= "삭제 성공";
//		if(result == 1) { 
//			message = getMessage(request, "삭제 성공", 
//					"/ntboard/ntBoardlList" );
//		}else{
//			message = getMessage(request, "삭제 실패", 
//					"/ntboard/ntBoardContentView");
//		}
		return message;
	}

	@Override
	public void getData(int writeNo, Model model) {
		model.addAttribute("detailContent", mapper.ntAllList());
		
	}

	@Override
	public int ntModify(BoardDTO dto) {
		int result = 0;
		try {
			result = mapper.ntModify(dto);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}

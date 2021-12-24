package com.care.root.ntboard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
		
	}

	@Override
	public void ntBoardContentView(int ntWriteNo, Model model) {
		model.addAttribute("detailContent", mapper.ntBoardContentView(ntWriteNo));
		
	}

}

package com.care.root.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.board.DTO.BoardDTO;
import com.care.root.mybatis.board.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardMapper mapper;
	
	@Override
	public int writeSave(BoardDTO dto) {
//		mapper.writeSave(dto);;
//		
		int result=0;
		try {
			result = mapper.writeSave(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void allList(Model model) {
		model.addAttribute("allList", mapper.allList()); //allList라는 이름으로 mapper.allList select한 값을 넣겠다
		
		
	}

	@Override
	public void contentView(int writeNo, Model model) {
		model.addAttribute("detailContent", mapper.contentView(writeNo));	//writeNo : test_board DB의 primarykey
	}







	

	
}

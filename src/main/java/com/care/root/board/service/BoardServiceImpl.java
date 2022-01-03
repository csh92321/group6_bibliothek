package com.care.root.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.board.DTO.BoardDTO;
import com.care.root.board.DTO.BoardReDTO;
import com.care.root.mybatis.board.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardMapper mapper;
	
	@Autowired
	BoardService bs;
	
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
	@Override
	public String boardDelete(int writeNo, HttpServletRequest request) {
		int result = mapper.boardDelete(writeNo);
		String message="삭제 성공";
		
		return message;
	}

	@Override
	public int modify(BoardDTO dto) {
		int result=0;
		try {
			result = mapper.modify(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void getData(int writeNo, Model model) {
		model.addAttribute("detailContent", mapper.allList());
		
	}


//	@Override
//	public String modify(MultipartHttpServletRequest mul, 
//			HttpServletRequest request) {
//		
//	BoardDTO dto = new BoardDTO();
//		
//	dto.setWriteNo( Integer.parseInt(mul.getParameter("writeNo")) );
//	dto.setTitle(mul.getParameter("title"));
//	dto.setContent(mul.getParameter("content"));
//		
//		int result = mapper.modify(dto);
//
//	String msg, url;
//		if(result == 1) {
//			msg = "수정 완료";
//			url = "/board/boardList";
////		}else {
////			msg = "수정 중 문제 발생";
////			url = "/board/modify_form";
////		}
//		String message = "수정 성공";
////		return "redirect:boardList";
//
//		return ;
//	}

}








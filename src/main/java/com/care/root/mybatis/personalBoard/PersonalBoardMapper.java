package com.care.root.mybatis.personalBoard;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.care.root.personalBoard.dto.PersonalBoardDTO;

@Repository
public interface PersonalBoardMapper {

	public List<PersonalBoardDTO> pbList(String id);
	public int save(PersonalBoardDTO dto);
}

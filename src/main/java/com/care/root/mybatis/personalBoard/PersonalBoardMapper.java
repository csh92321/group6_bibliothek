package com.care.root.mybatis.personalBoard;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.care.root.personalBoard.dto.PersonalBoardDTO;

@Repository
public interface PersonalBoardMapper {

	//public List<PersonalBoardDTO> pbList(String id);
	public List<PersonalBoardDTO> pbList(@Param("id") String id, @Param("s") int start, @Param("e") int end);
	public int save(PersonalBoardDTO dto);
	public PersonalBoardDTO pbView(int writeNum);
	public int PBCount(@Param("id") String id);
}

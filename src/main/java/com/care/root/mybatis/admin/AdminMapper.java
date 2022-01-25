package com.care.root.mybatis.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.care.root.personalBoard.dto.PersonalBoardDTO;

@Repository
public interface AdminMapper {

	public List<PersonalBoardDTO> pbListAll(@Param("s") int start, @Param("e") int end);
	public int PBCount();
}

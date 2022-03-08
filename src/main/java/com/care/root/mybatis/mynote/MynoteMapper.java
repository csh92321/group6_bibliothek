package com.care.root.mybatis.mynote;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.care.root.mynote.dto.MynoteDTO;

@Repository
public interface MynoteMapper {

	public int writeNote(MynoteDTO dto);
	public List<MynoteDTO> mnList(String id);
}

package com.care.root.mybatis.mynote;

import org.springframework.stereotype.Repository;

import com.care.root.mynote.dto.MynoteDTO;

@Repository
public interface MynoteMapper {

	public int writeNote(MynoteDTO dto);
}

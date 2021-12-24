package com.care.root.mybatis.note;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.care.root.note.dto.NoteDTO;

@Repository
public interface NoteMapper {

	public List<NoteDTO> noteList_rec(String id);
	public List<NoteDTO> noteList_send(String id);
	public int msg(NoteDTO dto);
	
}

package com.care.root.mybatis.note;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.care.root.note.dto.NoteDTO;

@Repository
public interface NoteMapper {

	public List<NoteDTO> noteList_rec(String id);
	public List<NoteDTO> noteList_send(String id);
	public int msg(NoteDTO dto);
	public NoteDTO noteView(int noteNum);
	public void readY(int noteNum);
	public int noteRecCount(String id);
	public int noteSendCount();
}

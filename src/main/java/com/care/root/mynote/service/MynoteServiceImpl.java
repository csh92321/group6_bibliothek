package com.care.root.mynote.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.root.book.dto.BookDTO;
import com.care.root.mybatis.book.BookMapper;
import com.care.root.mybatis.mynote.MynoteMapper;

@Service
public class MynoteServiceImpl implements MynoteService {

	@Autowired MynoteMapper mapper;
	@Autowired BookMapper bookmapper;
	static Map<String,BookDTO> DBMap = new HashMap<String, BookDTO>();

	@Override
	public ArrayList<BookDTO> search(String search) {
		ArrayList<BookDTO> list = new ArrayList<BookDTO>();
		@SuppressWarnings("rawtypes")
		Iterator it = list.iterator();
		try {
			search = "%" + search + "%";
			list = bookmapper.bookSearch(search);
			while (it.hasNext()) {
				BookDTO dto = (BookDTO) it.next();
				if (dto.getTitle() != null) {
					list.add(dto);
					DBMap.put(dto.getBookNum(), dto);
				} else {

				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(list);
		return list;
	}
	
}
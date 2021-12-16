package com.care.root.book.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.care.root.book.dto.BookDTO;
import com.care.root.book.dto.BookGenre;
import com.care.root.mybatis.book.BookMapper;

@RestController
@Service
public class BookServiceImpl implements BookService {
	
	@Autowired BookMapper mapper;
	static int cnt = 1;
	static Map<String, BookDTO> DBMap = new HashMap<String, BookDTO>();
	ArrayList<BookDTO> listG = new ArrayList<BookDTO>();
	
	public void bookList(String bookNum) {
	}
	
	@GetMapping(value="novels", produces = "application/json;charset=utf-8")
	public ArrayList<BookDTO> novels(){
		ArrayList<BookDTO> list = new ArrayList<BookDTO>();
		for(int i=cnt ; i<cnt+10 ; i++) {
			String.valueOf(i);
			try {
			String code = BookGenre.genre+"00"+i;
			BookDTO dto = mapper.bookList(code);
			if (dto.getTitle()!=null) {
			list.add(dto); DBMap.put(code, dto);
			} else {
				
			}
			
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	@GetMapping(value="poems", produces = "application/json;charset=utf-8")
	public ArrayList<BookDTO> poems(){
		ArrayList<BookDTO> list = new ArrayList<BookDTO>();
		for(int i=cnt ; i<cnt+10 ; i++) {
			String.valueOf(i);
			try {
			String code = BookGenre.genre+"00"+i;
			BookDTO dto = mapper.bookList(code);
			if (dto.getTitle()!=null) {
			list.add(dto); DBMap.put(code, dto);
			} else {
				
			}
			
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	@GetMapping(value="essays", produces = "application/json;charset=utf-8")
	public ArrayList<BookDTO> essays(){
		ArrayList<BookDTO> list = new ArrayList<BookDTO>();
		for(int i=cnt ; i<cnt+10 ; i++) {
			String.valueOf(i);
			try {
			String code = BookGenre.genre+"00"+i;
			BookDTO dto = mapper.bookList(code);
			if (dto.getTitle()!=null) {
			list.add(dto); DBMap.put(code, dto);
			} else {
				
			}
			
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	@PostMapping("searchPost")
	@ResponseBody
	public ArrayList<BookDTO> search(@RequestParam(value="search", required=false) String search) {
		ArrayList<BookDTO> list = new ArrayList<BookDTO>();
		Iterator it = list.iterator();
		try {
			System.out.println(search);
			search = "%"+search+"%";
			System.out.println(search);
			list = mapper.bookSearch(search);
			while(it.hasNext()) {
				BookDTO dto = (BookDTO) it.next();
				System.out.println(dto);
			if (dto.getTitle()!=null) {
				list.add(dto); DBMap.put(dto.getBookNum(), dto);
				} else {
					
				}
				

				}
		}catch(Exception e) {
					e.printStackTrace();
				}
		
			return list;
	}
	

}

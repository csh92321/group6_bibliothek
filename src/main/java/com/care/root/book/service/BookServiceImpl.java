package com.care.root.book.service;

import java.util.ArrayList;
import java.util.Collections;
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

import com.care.root.mybatis.book.BookMapper;
import com.care.root.book.dto.BookDTO;

class hit implements Comparable<BookDTO> {
	
	private String bookNum;
	private int hit;

	public hit(String bookNum, int hit) {
		this.bookNum = bookNum;
		this.hit = hit;
	}

	@Override
	public int compareTo(BookDTO dto) {
		if (dto.getHit() < hit) {
			return 1;
		} else if (dto.getHit() > hit) {
			return -1;
		}
		return 0;
	}
}

@RestController
@Service
public class BookServiceImpl implements BookService {

	@Autowired
	BookMapper mapper;
	String genre;
	int hit;
	int result;

	static int cnt = 1;
	static Map<String, BookDTO> DBMap = new HashMap<String, BookDTO>();
	ArrayList<BookDTO> listG = new ArrayList<BookDTO>();

	public void bookList(String bookNum) {
	}

	@GetMapping(value = "novels", produces = "application/json;charset=utf-8")
	public ArrayList<BookDTO> novels() {
		ArrayList<BookDTO> list = new ArrayList<BookDTO>();
		genre = "LN";
		for (int i = cnt; i < cnt + 10; i++) {
			String.valueOf(i);
			try {
				String code = genre + "00" + i;
				BookDTO dto = mapper.bookList(code);
				if (dto.getTitle() != null) {
					list.add(dto);
					DBMap.put(code, dto);
				} else {

				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	@GetMapping(value = "poems", produces = "application/json;charset=utf-8")
	public ArrayList<BookDTO> poems() {
		ArrayList<BookDTO> list = new ArrayList<BookDTO>();
		genre = "LP";
		for (int i = cnt; i < cnt + 10; i++) {
			String.valueOf(i);
			try {
				String code = genre + "00" + i;
				BookDTO dto = mapper.bookList(code);
				if (dto.getTitle() != null) {
					list.add(dto);
					DBMap.put(code, dto);
				} else {

				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	@GetMapping(value = "essays", produces = "application/json;charset=utf-8")
	public ArrayList<BookDTO> essays() {
		ArrayList<BookDTO> list = new ArrayList<BookDTO>();
		genre = "LE";
		for (int i = cnt; i < cnt + 10; i++) {
			String.valueOf(i);
			try {
				String code = genre + "00" + i;
				BookDTO dto = mapper.bookList(code);
				if (dto.getTitle() != null) {
					list.add(dto);
					DBMap.put(code, dto);
				} else {

				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	@PostMapping("searchPost")
	@ResponseBody
	public ArrayList<BookDTO> search(@RequestParam(value = "search", required = false) String search) {
		ArrayList<BookDTO> list = new ArrayList<BookDTO>();
		@SuppressWarnings("rawtypes")
		Iterator it = list.iterator();
		try {
			search = "%" + search + "%";
			list = mapper.bookSearch(search);
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

		return list;
	}

	@PostMapping("detail")
	@ResponseBody
	public ArrayList<BookDTO> detail(@RequestParam(value = "bookNum", required = false) String bookNum) {
		ArrayList<BookDTO> list = new ArrayList<BookDTO>();
		try {
			BookDTO dto = mapper.detail(bookNum);
			if (dto.getTitle() != null) {
				hit = mapper.hitLoad(bookNum);
				hit += 1;
				mapper.hitPlus(bookNum, hit);
				list.add(dto);
				DBMap.put(bookNum, dto);
			} else {

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		hit = 0;

		return list;
	}

	@GetMapping(value = "hits", produces = "application/json;charset=utf-8")
	public ArrayList<BookDTO> bestSeller() {
		ArrayList<BookDTO> list = new ArrayList<BookDTO>();
		@SuppressWarnings("rawtypes")
		Iterator it = list.iterator();
		try {
			int num = 0;
			list = mapper.getHit(num);
			Collections.sort(list, Collections.reverseOrder());
			while (it.hasNext()) {
				BookDTO dto = (BookDTO) it.next();	
				dto = mapper.getAll(dto.getBookNum());
				list.add(dto);
				DBMap.put(dto.getBookNum(), dto);
			}
			} catch (Exception e) {
				e.printStackTrace();
			}

		return list;
	}

}



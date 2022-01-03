package com.care.root.book.service;

import java.util.ArrayList;
import java.util.Arrays;
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

import com.care.root.book.dto.BookDTO;
import com.care.root.book.dto.Common;
import com.care.root.book.dto.GenreDTO;
import com.care.root.book.dto.LikeDTO;
import com.care.root.mybatis.book.BookMapper;

@RestController
@Service
public class BookServiceImpl implements BookService {

	@Autowired
	BookMapper mapper;
	int hit;
	String genre = Common.genre;

	static int cnt = 1;
	static Map<String, BookDTO> DBMap = new HashMap<String, BookDTO>();
	ArrayList<BookDTO> listG = new ArrayList<BookDTO>();

	public void bookList(String bookNum) {
		
		
	}
	
	@PostMapping("books")
	@ResponseBody
	public ArrayList<BookDTO> books(@RequestParam(value = "arrayBook", required = false) ArrayList<String> arrayBook) {
		String genre = arrayBook.get(0);
		String criterion = arrayBook.get(1);
		ArrayList<BookDTO> list = new ArrayList<BookDTO>();
		ArrayList<BookDTO> range = new ArrayList<BookDTO>();
		@SuppressWarnings("rawtypes")
		Iterator it = list.iterator();
			try {
				GenreDTO dtoG = mapper.bookCode(genre);
				String BookNum = dtoG.getCode()+"%";
				list = mapper.bookList(BookNum);

				while (it.hasNext()) {
					BookDTO dtoB = (BookDTO) it.next();
					
					if (dtoB.getTitle() != null) {
						list.add(dtoB);
						DBMap.put(dtoB.getBookNum(), dtoB);
					} else {

					}

				}
				
				if (criterion.equals("popularityAsc")) {
					Book[] book = new Book[list.size()];
					for(int i=0; i<list.size();i++) {
						BookDTO dto = list.get(i);
						book[i] = new Book(dto.getBookNum(), dto.getHit());
					}
					Arrays.sort(book, Collections.reverseOrder());
					for(Book result:book) {
						System.out.println(result.toString());
						BookDTO dtoB = mapper.getAll(result.toString());
						range.add(dtoB);
						DBMap.put(dtoB.getBookNum(), dtoB);
					}
					}  else if (criterion.equals("popularityDes")) {
					Book[] book = new Book[list.size()];
					for(int i=0; i<list.size();i++) {
						BookDTO dto = list.get(i);
						book[i] = new Book(dto.getBookNum(), dto.getHit());
					}
					Arrays.sort(book, Collections.reverseOrder());

					for(Book result:book) {
						BookDTO dtoB = mapper.getAll(result.toString());
						range.add(dtoB);
						DBMap.put(dtoB.getBookNum(), dtoB);
					}						
					Collections.reverse(range);
					} else if (criterion.equals("releaseAsc")) {
						Collections.reverse(list);
						range=list;
							System.out.println(range);
						} else if (criterion.equals("releaseDes")) {
							range=list;
							System.out.println(range);
						} else if (criterion.equals("gradeAsc")) {
							BookG[] bookG = new BookG[list.size()];
							for(int i=0; i<list.size();i++) {
								BookDTO dto = list.get(i);
								bookG[i] = new BookG(dto.getBookNum(), dto.getGrade());
							}
							Arrays.sort(bookG, Collections.reverseOrder());
							for(BookG result:bookG) {
								System.out.println(result.toString());
								BookDTO dtoB = mapper.getAll(result.toString());
								range.add(dtoB);
								DBMap.put(dtoB.getBookNum(), dtoB);
							}
							}  else if (criterion.equals("gradeDes")) {
							BookG[] bookG = new BookG[list.size()];
							for(int i=0; i<list.size();i++) {
								BookDTO dto = list.get(i);
								bookG[i] = new BookG(dto.getBookNum(), dto.getGrade());
							}
							Arrays.sort(bookG, Collections.reverseOrder());

							for(BookG result:bookG) {
								BookDTO dtoB = mapper.getAll(result.toString());
								range.add(dtoB);
								DBMap.put(dtoB.getBookNum(), dtoB);
							}						
							Collections.reverse(range);
							} else if (criterion.equals("nameAsc")) {
								BookT[] bookT = new BookT[list.size()];
								for(int i=0; i<list.size();i++) {
									BookDTO dto = list.get(i);
									bookT[i] = new BookT(dto.getBookNum(), dto.getTitle());
								}
								Arrays.sort(bookT, Collections.reverseOrder());
								for(BookT result:bookT) {
									System.out.println(result.toString());
									BookDTO dtoB = mapper.getAll(result.toString());
									range.add(dtoB);
									DBMap.put(dtoB.getBookNum(), dtoB);
								}
								Collections.reverse(range);
								}  else if (criterion.equals("nameDes")) {
								BookT[] bookT = new BookT[list.size()];
								for(int i=0; i<list.size();i++) {
									BookDTO dto = list.get(i);
									bookT[i] = new BookT(dto.getBookNum(), dto.getTitle());
								}
								Arrays.sort(bookT, Collections.reverseOrder());

								for(BookT result:bookT) {
									BookDTO dtoB = mapper.getAll(result.toString());
									range.add(dtoB);
									DBMap.put(dtoB.getBookNum(), dtoB);
								}						

								}
				

			} catch (Exception e) {
				e.printStackTrace();
			}
		return range;
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
		ArrayList<BookDTO> best = new ArrayList<BookDTO>();
		try {
			list = mapper.getHit();
			Book[] book = new Book[list.size()];
			for(int i=0; i<list.size();i++) {
				BookDTO dto = list.get(i);
				book[i] = new Book(dto.getBookNum(), dto.getHit());
			}	
			Arrays.sort(book, Collections.reverseOrder());
			for(Book result:book) {
				BookDTO dtoB = mapper.getAll(result.toString());
				best.add(dtoB);
				DBMap.put(dtoB.getBookNum(), dtoB);
			}
			} catch (Exception e) {
				e.printStackTrace();
			}

		return best;
	}
	
	public static class Book implements Comparable<Book> {
		String bookNum;
		int hit;
		
		public Book(String bookNum, int hit) {
			this.bookNum = bookNum;
			this.hit = hit;
		}
		
		public String toString() {
			return bookNum;
		}
		
		@Override
		public int compareTo(Book o) {
			if (this.hit < o.hit) {
				return -1;
			} else if (this.hit == o.hit) {
				return 0;
			} else {
				return 1;
			}
		}
	}
	
	public static class BookG implements Comparable<BookG> {
		String bookNum;
		double grade;
		
		public BookG(String bookNum, double grade) {
			this.bookNum = bookNum;
			this.grade = grade;
		}
		
		public String toString() {
			return bookNum;
		}
		
		@Override
		public int compareTo(BookG oG) {
			if (this.grade < oG.grade) {
				return -1;
			} else if (this.grade == oG.grade) {
				return 0;
			} else {
				return 1;
			}
		}
	}
	
	public static class BookT implements Comparable<BookT> {
		String bookNum;
		String title;
		
		public BookT(String bookNum, String title) {
			this.bookNum = bookNum;
			this.title = title;
		}
		
		public String toString() {
			return bookNum;
		}
		
		@Override
		public int compareTo(BookT oT) {
			int res = this.title.compareTo(oT.title);
			return res;
		}
	}
	
	@PostMapping("genre")
	@ResponseBody
	public ArrayList<GenreDTO> genre(@RequestParam(value = "genre", required = false) String genre) {
		ArrayList<GenreDTO> list = new ArrayList<GenreDTO>();
		ArrayList<GenreDTO> dtoL = new ArrayList<GenreDTO>();
			try {
				 GenreDTO dtoG = mapper.bookCodeKr(genre);
				 String code = dtoG.getCode().substring(0);
				 code = code+"%";
				 dtoL = mapper.codeGenre(code);
				 dtoL.remove(dtoL.size()-1);
				@SuppressWarnings("rawtypes")
				Iterator it = dtoL.iterator();
				while (it.hasNext()) {
					GenreDTO dtoB = (GenreDTO) it.next();
					if (dtoB.getKorean() != null) {
						System.out.println(dtoB);
						list.add(dtoB);
						} else {

					}

				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		return list;
	}
	
	@GetMapping(value = "news", produces = "application/json;charset=utf-8")
	public ArrayList<BookDTO> newBook() {
		ArrayList<BookDTO> list = new ArrayList<BookDTO>();
		ArrayList<BookDTO> newBook = new ArrayList<BookDTO>();
		try {
			list = mapper.getAllBook();
			Collections.reverse(list);
			for(int i=0; i<9;i++) {
				BookDTO dto = list.get(i);
				newBook.add(dto);
				DBMap.put(dto.getBookNum(), dto);
			}	
			} catch (Exception e) {
				e.printStackTrace();
			}
		return newBook;
	}
	
	@GetMapping(value = "recommends", produces = "application/json;charset=utf-8")
	public ArrayList<BookDTO> newRecommend() {
		ArrayList<BookDTO> list = new ArrayList<BookDTO>();
		ArrayList<String> recommend = new ArrayList<>(Arrays.asList("LN001","LE002","LP003"));
		try {
			for(int i=0; i<recommend.size();i++) {
				BookDTO dto = mapper.getRecommend(recommend.get(i));
				list.add(dto);
			}	
			} catch (Exception e) {
				e.printStackTrace();
			}

		return list;
	}
	
	@PostMapping("korean")
	@ResponseBody
	public ArrayList<GenreDTO> getKorean(@RequestParam(value = "genre", required = false) String genre) {
		ArrayList<GenreDTO> list = new ArrayList<GenreDTO>();
			try {
				 GenreDTO dto = mapper.bookCodeKr(genre);
						list.add(dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
		return list;
	}
	
	@PostMapping("koreanD")
	@ResponseBody
	public ArrayList<GenreDTO> getKoreanD(@RequestParam(value = "genre", required = false) String genre) {
		ArrayList<GenreDTO> list = new ArrayList<GenreDTO>();
			try {
				 GenreDTO dto = mapper.bookCodeKr(genre);
						list.add(dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
		return list;
	}
	
	@PostMapping("gradePost")
	@ResponseBody
	public double gradePost(@RequestParam(value = "array", required = false) ArrayList<String> array) {
		String bookNum = array.get(0);
		double gradeLevel = Double.parseDouble(array.get(1));	
		double gradeL = 0;
		try {
				double gradeAvg = mapper.gradeLoad(bookNum);
				System.out.println(gradeAvg);
				gradeLevel = (gradeAvg+gradeLevel)/2;
				System.out.println(gradeLevel*10);
				gradeLevel = Math.round(gradeLevel*10);
				gradeLevel = gradeLevel/10;
				System.out.println(gradeLevel);
				mapper.gradeUpdate(bookNum, gradeLevel);
			} catch (Exception e) {
				e.printStackTrace();
			}
		gradeL= gradeLevel;
		return gradeL;
	}
	
	@PostMapping("gradeOriginal")
	@ResponseBody
	public double gradeOriginal(@RequestParam(value = "bookNum", required = false) String bookNum) {
		double gradeO = 0;
		try {
				gradeO = mapper.gradeLoad(bookNum);
			} catch (Exception e) {
				e.printStackTrace();
			}
		return gradeO;
	}
	
	@PostMapping("likeCheck")
	@ResponseBody
	public int likeCheck(@RequestParam(value = "arrayL", required = false) ArrayList<String> arrayL) {
		int result = 0;
		String id = arrayL.get(0);
		String bookNum = arrayL.get(1);	
		try {
			LikeDTO dto = mapper.likeCheck(id,bookNum);
			if (dto!=null) {
				result=1;
			} else {
				result=0;
			}
			} catch (Exception e) {
				e.printStackTrace();
			}
		return result;
	}
	
	@PostMapping("likePush")
	@ResponseBody
	public void likePush(@RequestParam(value = "arrayL", required = false) ArrayList<String> arrayL) {
		String id = arrayL.get(0);
		String bookNum = arrayL.get(1);	
		try {
				mapper.likePush(id,bookNum);
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	
	@PostMapping("likeCancel")
	@ResponseBody
	public void likeCancel(@RequestParam(value = "arrayL", required = false) ArrayList<String> arrayL) {
		String id = arrayL.get(0);
		String bookNum = arrayL.get(1);	
		try {
				mapper.likeCancel(id,bookNum);
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	
}




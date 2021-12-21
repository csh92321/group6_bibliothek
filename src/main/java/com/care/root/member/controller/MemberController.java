package com.care.root.member.controller;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.root.common.MemberSessionName;
import com.care.root.member.dto.DeleteReasonDTO;
import com.care.root.member.dto.MemberDTO;
import com.care.root.member.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController implements MemberSessionName{

	@Autowired MemberService ms;
	
	@GetMapping("/login")
	public String login(@CookieValue(value="saveIdCookie", required=false) Cookie saveIdCookie,Model model) {
		if(saveIdCookie != null) {
			System.out.println("로그인 전 쿠키 값 확인 : " + saveIdCookie.getValue());
			model.addAttribute("cookieID", saveIdCookie.getValue());
		}
		System.out.println("member/login 페이지 연결");
		return "member/login";
	}
	
	@PostMapping("/user_check")
	public String userCheck(@RequestParam String id, @RequestParam String pwd, @RequestParam(required=false) String autoLogin,
							@RequestParam(required=false) String saveId, RedirectAttributes rs) {
		System.out.println("member/user_check 로그인 확인");
		System.out.println("autoLogin : " + autoLogin);
		System.out.println("saveId : " + saveId);
		int result = ms.userCheck(id,pwd);
		if (result==1) {
			System.out.println("로그인 성공");
			rs.addAttribute("id",id);
			rs.addAttribute("autoLogin", autoLogin);
			rs.addAttribute("saveId", saveId);
			return "redirect:successLogin";
		} else {
			System.out.println("로그인 실패");
			return "redirect:login";
		}
	}
	
	@GetMapping("/successLogin")
	public String successLogin(@RequestParam String id, @RequestParam(required=false) String autoLogin, @RequestParam(required=false) String saveId, HttpSession session, HttpServletResponse response) {
		session.setAttribute(LOGIN, id);
		if(autoLogin!=null) {	//사용자가 자동로그인 체크
			int limitTime = 60*60*24*90;	//90일
			Cookie loginCookie = new Cookie("loginCookie",session.getId());
			loginCookie.setPath("/");
			loginCookie.setMaxAge(limitTime);
			response.addCookie(loginCookie);
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			cal.add(Calendar.MONTH, 3);
			java.sql.Date limitDate = new java.sql.Date(cal.getTimeInMillis());
			
			ms.keepLogin(session.getId(), limitDate, id);	//DB로 연결
		} else if(saveId!=null) {
			int limitTimeId=60*60*24*7;	//7일
			Cookie saveIdCookie = new Cookie("saveIdCookie",id);
			saveIdCookie.setPath("/");
			saveIdCookie.setMaxAge(limitTimeId);
			response.addCookie(saveIdCookie);
		}
		return "member/successLogin";
	}
	
	@GetMapping("register_form")
	public String registerForm() {
		System.out.println("회원가입 페이지 연결");
		return "member/register";
	}
	
	@PostMapping("register")
	public String register(MemberDTO dto){
		int result=ms.register(dto);
		if(result==1) {
			System.out.println("회원가입 성공");
			return "redirect:login";
		}
		return "Redirect:register_form";
	}

	@PostMapping("idCheck")
	@ResponseBody
	public int idCheck(@RequestParam(value="id", required=false) String id){
		int cnt=0;
		if(id!=null) {
			cnt=ms.idCheck(id);
		}
		return cnt;
	}
	
	@PostMapping("emailCheck")
	@ResponseBody
	public int emailCheck(@RequestParam(value="email", required=false) String email) {
		int cnt=0;
		if(email!=null) {
			cnt=ms.emailCheck(email);
		}
		return cnt;
	}
	
	@PostMapping("phoneCheck")
	@ResponseBody
	public int phoneCheck(@RequestParam(value="phone", required=false) String phone) {
		int cnt=0;
		if(phone!=null) {
			cnt=ms.phoneCheck(phone);
		}
		return cnt;
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session, HttpServletResponse response, @CookieValue(value="loginCookie",required=false) Cookie loginCookie) {
		if(session.getAttribute(LOGIN)!=null) {
			if(loginCookie!=null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				ms.keepLogin("nan", new java.sql.Date(System.currentTimeMillis()), (String)session.getAttribute(LOGIN));
			}
		}
		session.invalidate();
		System.out.println("로그아웃");
		return "redirect:/";
	}
	
	@GetMapping("beforeModify")
	public String checkPwd(HttpSession session) {
		if(session.getAttribute(LOGIN)!=null) {
			return "member/beforeModify";
		}
		return "member/login";
	}
	
	@PostMapping("checkPwd")
	public String checkPwd(HttpSession session,@RequestParam String pwd) {
		if(session.getAttribute(LOGIN)!=null) {
			String id=(String)session.getValue(LOGIN);
			if(ms.userCheck(id, pwd)==1) {
				System.out.println("회원 수정/삭제 : 비밀번호 매칭 확인");
				return "redirect:modifyForm";
			} else {
				System.out.println("회원 수정/삭제 : 비밀번호 매칭 실패");
				return "member/beforeModify";
			}
		}
		System.out.println("회원 수정/삭제 : sessionId 존재無");
		return "member/login";
	}
	
	@GetMapping("modifyForm")
	public String modifyForm(Model model,HttpSession session) {
		if(session.getAttribute(LOGIN)!=null) {
			System.out.println(session.getValue(LOGIN));
			String id=(String) session.getValue(LOGIN);
			System.out.println("id :" + id);
			ms.getMemberData(model,id);
			return "member/modify";
		}
		return "redirect:login";
	}
	
	@PostMapping("modify")
	public String modify(MemberDTO dto){
		//System.out.println(dto.getPwd());
		//System.out.println(dto.getPhone());
		//System.out.println(dto.getAddr());
		int result=ms.modify(dto);
		if(result==1) {
			System.out.println("정보 수정 성공");
			return "member/successLogin";
		}
		return "Redirect:modifyForm";
	}
	
	@GetMapping("deleteCheck")
	public String deleteCheck(Model model,HttpSession session) {
		String id=(String) session.getAttribute(LOGIN);
		System.out.println("deleteCheck로 전달(sessionId) : "+id);
		ms.getMemberData(model, id);
		return "member/deleteCheck";
	}
	
	@PostMapping("deleteMember")
	public String deleteMember(HttpSession session,DeleteReasonDTO dr_dto, @CookieValue(value="saveIdCookie",required=false) Cookie saveIdCookie,HttpServletResponse response) {
		
		String id=(String)session.getValue(LOGIN);
		//System.out.println("expensive : "+expensive);
		int result=ms.delete(id);
		if(result==1) {
			System.out.println(id+"회원 삭제 완료");
			ms.deleteReasonCheck(dr_dto);
			if(saveIdCookie!=null) {
				saveIdCookie.setPath("/");
				saveIdCookie.setMaxAge(0);
				response.addCookie(saveIdCookie);
			}
			session.invalidate();
			return "redirect:/";
		} else {
			System.out.println(id+"회원 삭제 실패");
			return "redirect:successLogin";
		}
	}
	
	@GetMapping("newpage_findId")
	public String newpage_findId() {
		System.out.println("아이디 찾기 선택");
		return "member/findId";
	}
	
	@PostMapping(value="findId", produces="application/json; charset=utf-8")
	@ResponseBody
	public MemberDTO findId(@RequestBody MemberDTO dto,Model model) {
		System.out.println("name:"+dto.getName());
		System.out.println("email:"+dto.getEmail());

		return ms.findId(dto);
	}
	
	@GetMapping("newpage_findPwd")
	public String newpage_findPwd() {
		System.out.println("비밀번호 찾기 선택");
		return "member/findPwd";
	}
	
	@PostMapping("findPwd")
	@ResponseBody
	public int findPwd(@RequestBody MemberDTO dto) throws Exception {
		return ms.findPwd(dto);
	}
}

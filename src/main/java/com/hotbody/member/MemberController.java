package com.hotbody.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	// 로그인 및 로그아웃
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public String loginForm() throws Exception{
		return ".member.login";
	}
	
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	@ResponseBody
	public String loginSubmit(
			@RequestParam String userId,
			@RequestParam String Pwd,
			Model model,
			HttpSession session
			) throws Exception {
		System.out.println("ddddddd");
		Member dto = service.readMember(userId);
		
		if(dto == null || (! dto.getPwd().equals(Pwd))) {
			model.addAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");
			return ".member.login";
		}
		
		// 로그인 정보를 세션에 저장(로그인)
		SessionInfo info = new SessionInfo();
		info.setUserId(dto.getUserId());
		info.setUserName(dto.getUserName());
		session.setAttribute("member", info);
		
		return "redirect:/";
	}
	
	// 로그인 정보 세션에서 삭제(로그아웃)
	@RequestMapping(value="/member/logout")
	public String logout(HttpSession session) throws Exception {
		session.removeAttribute("member");
		session.invalidate();
		
		return "redirect:/";
	}

	@RequestMapping(value="/member/mypage", method=RequestMethod.GET)
	public String mypageForm() throws Exception{
		return ".member.mypage";
	}
	
	@RequestMapping(value="/member/myclass", method=RequestMethod.GET)
	public String myclassForm() throws Exception{
		return ".member.myclass";
	}
	
	@RequestMapping(value="/member/member", method=RequestMethod.GET)
	public String memberForm(Model model){
		model.addAttribute("mode", "created");
		return ".member.member";
	}
	
	@RequestMapping(value="/member/member", method=RequestMethod.POST)
	public String memberSubmit(
			Member dto,
			Model model) throws Exception {
		
		int result = service.insertMember(dto);
		
		if(result != 0) {
			return ".main.main";
		} else
			return ".main.main";
	}
	
	@RequestMapping(value="/member/userIdCheck")
	@ResponseBody
	public Map<String, Object> userIdCheck(
			@RequestParam String userId
			) throws Exception {
		String passed="false";
		Member dto=service.readMember(userId);
		if(dto==null)
			passed="true";
		
   	    // 작업 결과를 json으로 전송
		Map<String, Object> model = new HashMap<>(); 
		model.put("passed", passed);
		model.put("userId", userId);
		return model;
	}
	
}

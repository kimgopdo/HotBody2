package com.hotbody.member;

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
			@RequestParam String userPwd,
			Model model,
			HttpSession session
			) throws Exception {
		System.out.println("ddddddd");
		Member dto = service.readMember(userId);
		
		if(dto == null || (! dto.getUserPwd().equals(userPwd))) {
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
}

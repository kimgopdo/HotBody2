package com.hotbody.admin;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotbody.member.SessionInfo;
import com.hotbody.util.CountManager;

@Controller("admin.adminController")
public class AdminController {

	
	@RequestMapping(value="/admin/main")
	public String admin(Model model,
						HttpSession session) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info==null || !info.getUserId().equals("admin"))
			return "redirect:/member/login";
			
		
		long total = CountManager.getToDayCount();
		model.addAttribute("total", total);
		return ".admin.main.created";
	}
	
	@RequestMapping(value="/admin/main2")
	public String admin2() {
		return ".admin.main.main";
	}
}

package com.hotbody.admin;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
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
						HttpSession session,
						HttpServletRequest req) {
		String cp = req.getContextPath();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info==null)
			return "redirect:/member/login";
			
		if(! info.getUserId().equals("admin"))
			return cp;
			
		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		
		long total = CountManager.getTotalCount();
		long today = CountManager.getToDayCount();
		
		model.addAttribute("date", date);
		model.addAttribute("total", total);
		model.addAttribute("today", today);
		return ".admin.main.main";
	}
}

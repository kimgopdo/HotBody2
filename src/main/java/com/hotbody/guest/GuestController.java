package com.hotbody.guest;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotbody.common.MyUtil;
import com.hotbody.member.SessionInfo;

@Controller("guest.guestController")
public class GuestController {
	@Autowired
	private GuestService service;
	
	@Autowired
	private MyUtil util;
	
	@RequestMapping("/guest/guest")
	public String guestForm(Model model) {
		int rows=10;
		int dataCount=service.dataCount();
		int total_page = util.pageCount(rows, dataCount);
		
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		
		return ".mocoguest.guest";
	}
	

	@RequestMapping(value="/guest/insert", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertSubmit(
			Guest dto,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String state;
		if(info==null) {
			state="loginFail";
		} else {
			dto.setUserId(info.getUserId());
			service.insertGuest(dto);
			state="true";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/guest/list")
	@ResponseBody
	public Map<String, Object> list(
			@RequestParam(value="pageNo", defaultValue="1") int current_page
			) throws Exception {
		
		int rows=10;
		int dataCount;
		int total_page;
		
		dataCount=service.dataCount();
		total_page = util.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		
		Map<String, Object> map=new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		int listNum, n=0;
		List<Guest> list=service.listGuest(map);
		Iterator<Guest> it=list.iterator();
		while (it.hasNext()) {
			Guest dto=it.next();
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			n++;
		}
		
		// 페이징(인수 2개)
		// String paging=util.paging(current_page, total_page);
		
		Map<String, Object> model=new HashMap<>();
		
		model.put("list", list);
		model.put("dataCount", dataCount);
		model.put("total_page", total_page);
		// model.put("paging", paging);
		// model.put("pageNo", current_page);
		
		return model;
	}
	
	@RequestMapping(value="/guest/delete", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(
			@RequestParam int num,
			HttpSession session
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String state;
		if(info==null) {
			state="loginFail";
		} else {
			Map<String, Object> map=new HashMap<>();
			map.put("num", num);
			map.put("userId", info.getUserId());
			int result=service.deleteGuest(map);
			if(result==1)
				state="true";
			else 
				state="false";
		}		
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	
	
	
	
	
	
}

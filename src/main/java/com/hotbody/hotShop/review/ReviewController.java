package com.hotbody.hotShop.review;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

@Controller("hotShop.review")
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	@Autowired
	private MyUtil util;
	
	@RequestMapping(value = "/hotShop/review_created", method = RequestMethod.GET)
	public String createdForm(
			@RequestParam(value="mode", defaultValue="created") String mode,
			Model model
			) {
		
		model.addAttribute("mode", "created");
		
		return ".hotShop.hotShop_review.review_created";
	}
	
	@RequestMapping(value="/hotShop/review_created", method = RequestMethod.POST)
	public String createdSubmit(
			Review dto,
			HttpSession session
			) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		dto.setUserId(info.getUserId());
		dto.setUserName(info.getUserName());
		dto.setPdName(dto.getPdName());
		////////////////////////////////////////////////////
		dto.setPdNum(61); // 임시로 상품번호 넣어줌(나중에 삭제)
		////////////////////////////////////////////////////
		
		service.insertReview(dto);
		
		return "redirect:/hotShop/review_created";
	}
	
	@RequestMapping(value="/hotShop/review_list")
	public String list(
			@RequestParam(value = "page", defaultValue="1") int current_page,
			@RequestParam(value = "searchKey", defaultValue = "pdName") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue,
			@RequestParam(defaultValue="10") int rows,
			HttpServletRequest req,
			HttpSession session,
			Model model
			) throws Exception {
		
		int dataCount;
		int total_page;
		
		if(req.getMethod().equalsIgnoreCase("GET"))
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		dataCount = service.dataCount(map);
		
		total_page = util.pageCount(rows, dataCount);
		
		if(total_page < current_page)
			current_page = total_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		List<Review> list = service.listReview(map);
		
		int n = 0;
		int listNum = 0;
		
		Iterator<Review> it = list.iterator();
		while(it.hasNext()) {
			Review dto = it.next();
			listNum = dataCount - (start + n - 1);
			dto.setListNum(listNum);
			n++;
			
		}
		
		String query = "rows=" + rows;
		String listUrl;
			
		if(searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}
		
		String cp = req.getContextPath();
		listUrl = cp + "/hotShop/review_list?" + query;
		
		String paging = util.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("dateCount", dataCount);
		model.addAttribute("paging", paging);
		model.addAttribute("rows", rows);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", searchValue);
		
		return ".hotShop.hotShop_review.review_list";
	}
	
	@RequestMapping(value="/hotShop/review_delete")
	public String delete(
			@RequestParam int reviewCode,
			@RequestParam String page,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "review";		
		
		service.deleteReview(reviewCode, pathname, info.getUserId());
		
		return "redirect:/hotShop/review_list?page="+page;
	}
	
	@RequestMapping(value="/hotShop/review_insertReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReply(
			Reply dto,
			HttpSession session
			){
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state;
		
		System.out.println(dto.getContent());
		
		int count = 0;
		if(info == null) {
			state="loginFail";
		} else {
			dto.setUserId(info.getUserId());
			service.insertReply(dto);

			state="true";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		model.put("count", count);
		return model;
	}
	
	@RequestMapping(value="/hotShop/review_listReply", method=RequestMethod.POST)
	public String listReply(
			@RequestParam(value="reviewCode") int reviewCode,
			Model model
			) {

		Map<String, Object> map = new HashMap<>();
		map.put("reviewCode", reviewCode);
		int replyCount=service.replyDataCount(map);
		List<Reply> listReply= service.listReply(map);
		for(Reply dto:listReply) {
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("replyCount", replyCount);
		model.addAttribute("listReply", listReply);
		
		return "hotShop/hotShop_review/listReply";
	}
	

	
}

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
import com.hotbody.common.MyUtil2;
import com.hotbody.hotShop.board.HotShopService;
import com.hotbody.member.SessionInfo;

@Controller("hotShop.review")
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	@Autowired
	private MyUtil util;
	
	@Autowired
	private MyUtil2 util2;
	
	@Autowired
	private HotShopService service2;
	
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
		
		return "redirect:/hotShop/review_list";
	}
	
	@RequestMapping(value="/hotShop/review_list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="reviewSubject") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
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
		
		int listNum, n = 0;
		Iterator<Review> it = list.iterator();
		while(it.hasNext()) {
			Review dto = it.next();
			listNum = dataCount - (start + n - 1);
			dto.setListNum(listNum);
			n++;
			
			dto.setReviewCreated(dto.getReviewCreated().substring(0, 10));
		}
		
		String query = "rows=" + rows;
		String listUrl, articleUrl;
		if(searchValue.length() != 0) {
			query +="&searchKey=" + searchKey
					+"&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}
		String cp = req.getContextPath();
		listUrl = cp + "/hotShop/review_list?" + query;
		articleUrl = cp + "/hotShop/review_article?" + query + "&page=" + current_page;
		
		String paging = util.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("dateCount", dataCount);
		model.addAttribute("paging", paging);
		model.addAttribute("rows", rows);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", searchValue);
		
		return ".hotShop.hotShop_review.review_list";
	}
	
	@RequestMapping(value="/hotShop/review_article", method=RequestMethod.GET)
	public String article(
			@RequestParam int reviewCode,
			@RequestParam String page,
			@RequestParam(defaultValue="reviewSubject") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			@RequestParam int rows,
			Model model
			) throws Exception {
		
		String query = "page=" + page + "&rows=" + rows;
		if(searchValue.length() != 0) {
			query += "&searchKey=" + searchKey;
			query += "&searchValue=" + searchValue;
		}
		
		searchValue = URLEncoder.encode(searchValue, "UTF-8");

		Review dto = service.readReview(reviewCode);
		if(dto == null) {
			return "redirect:/hotShop/review_list" + query;
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("reviewCode", reviewCode);
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		model.addAttribute("query", query);
		model.addAttribute("rows", rows);
		
		return ".hotShop.hotShop_review.review_article";
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
	
	@RequestMapping(value="/hotShop/insertReply", method=RequestMethod.POST)
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
	
	@RequestMapping(value="/hotShop/review_list", method=RequestMethod.POST)
	public String listReply(
			@RequestParam(value="reviewCode") int reviewCode,
			@RequestParam(value="page",defaultValue="1") int page,
			Model model
			) {
		
		int rows = 5; // 한 화면 리스트 개수
		int total_page = 0;
		int dataCount = 0;
		int current_page=page;
		Map<String, Object> map = new HashMap<>();
		map.put("reviewCode", reviewCode);
		
		dataCount = service.replyDataCount(map);
		total_page = util.pageCount(rows, dataCount);
		if(current_page > total_page)
			total_page = current_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Reply> listReply = service.listReply(map);
		
		
		String paging = util.paging(current_page, total_page);
		
		model.addAttribute("listReply", listReply);
		model.addAttribute("paging", paging);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("page", current_page);
		
		return "hotShop/hotShop_review/listReply";
	}
	
	@RequestMapping(value="/hotShop/deleteReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteReply(
			@RequestParam int cNum,
			HttpSession session
			){
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state;
		
		if(info == null) {
			state = "loginFail";
		} else {
			Map<String, Object> map = new HashMap<>();
			map.put("cNum", cNum);
			map.put("userId", info.getUserId());
			service.deleteReply(map);
			state = "true";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/hotShop/listReview")
	public String articleList(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="10") int rows,
			@RequestParam int pdnum,
			HttpServletRequest req,
			HttpSession session,
			Model model
			) throws Exception {
		
		int dataCount;
		int total_page;
		
		
		Map<String, Object> map = new HashMap<>();
		map.put("pdnum", pdnum);
		
		dataCount = service2.dataCount_review(map);
		total_page = util2.pageCount(rows, dataCount);
		
		if(total_page < current_page)
			current_page = total_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		List<Review> list = service2.productArticle_Review(map);
		
		int listNum, n = 0;
		Iterator<Review> it = list.iterator();
		while(it.hasNext()) {
			Review dto = it.next();
			listNum = dataCount - (start + n - 1);
			dto.setListNum(listNum);
			n++;
			
			dto.setReviewCreated(dto.getReviewCreated().substring(0, 10));
		}
		
		String query = "rows=" + rows;
		String articleUrl;
		String cp = req.getContextPath();

		articleUrl = cp + "/hotShop/review_article?" + query + "&page=" + current_page;
		
		String paging = util2.paging(current_page, total_page);

		model.addAttribute("list2", list);
		model.addAttribute("articleUrl2", articleUrl);
		model.addAttribute("page2", current_page);
		model.addAttribute("total_page2", total_page);
		model.addAttribute("dateCount2", dataCount);
		model.addAttribute("paging2", paging);
		model.addAttribute("rows2", rows);
		
		return "hotShop/listReview";
	}
}

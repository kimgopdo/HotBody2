package com.hotbody.qna2;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
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

import com.hotbody.common.MyUtil;
import com.hotbody.member.SessionInfo;

@Controller("qna2.qna2Controller")
public class Qna2Controller {
	@Autowired
	private  Qna2Service service;
	@Autowired
	private MyUtil util;
	
	@RequestMapping(value = "/qna2/created",
			method = RequestMethod.GET)
	public String createdForm(Model model) throws Exception {
		model.addAttribute("mode", "created");
		return "qna2/created";
	}
	
	@RequestMapping(value = "/qna2/created",
			method = RequestMethod.POST)
	public String createdSubmit(Qna2 dto, HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login";
		}
		
		dto.setUserId(info.getUserId());
		
		service.insertQna2(dto);
		
		return "redirect:/qna2/list";
	}
	
	
	
	@RequestMapping("/qna2/list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "subject") String searchKey,
			@RequestParam(defaultValue = "") String searchValue,
			@RequestParam(defaultValue = "10") int rows,
			HttpServletRequest req, Model model) throws Exception {
			
		int dataCount;
		int total_page;
		
		if (req.getMethod().equalsIgnoreCase("GET"))
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		
		// 데이터 개수
				Map<String, Object> map = new HashMap<>();
				map.put("searchKey", searchKey);
				map.put("searchValue", searchValue);
				dataCount = service.dataCount(map);
		// 총 페이지수
				total_page = util.pageCount(rows, dataCount);

		// 다른사람이 자료를 삭제하여 전체 페이지가 변화 된 경우
				if (total_page < current_page)
					current_page = total_page;	
				
		// 리스트에 출력할 데이터 가져오기
				int start = (current_page - 1) * rows + 1;
				int end = current_page * rows;
				map.put("start", start);
				map.put("end", end);		
				List<Qna2> list = service.listQna2(map);
		

				String query = "rows=" + rows;
				String listUrl, articleUrl;
				if (searchValue.length() != 0) {
					query += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
				}
				
				String cp = req.getContextPath();
				listUrl = cp + "/qna2/list?" +query;
				articleUrl = cp +"/qna2/article?" + query+"&page="+current_page;

				// 페이징 처리 결과
				String paging = util.paging(current_page, total_page, listUrl);
				
				// 포워딩 할 list.jsp에 넘길 데이터
				model.addAttribute("list", list);
				model.addAttribute("articleUrl", articleUrl);
				model.addAttribute("page", current_page);
				model.addAttribute("total_page", total_page);
				model.addAttribute("dataCount", dataCount);
				model.addAttribute("paging", paging);
				model.addAttribute("rows", rows);
				model.addAttribute("searchKey", searchKey);
				model.addAttribute("searchValue", searchValue);
				
				return "qna2/list";
	}
}
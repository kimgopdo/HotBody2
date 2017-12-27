package com.hotbody.qna1;

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

import com.hotbody.common.MyUtil;
import com.hotbody.member.SessionInfo;
import com.hotbody.qna1.Qna1;

@Controller("qna1.QnaController")
public class Qna1Controller {
	
	@Autowired
	private Qna1Service service;
	@Autowired
	private MyUtil util;
	
	@RequestMapping(value = "/qna1/created",
			method = RequestMethod.GET)
	public String createdForm(Model model) throws Exception {
		model.addAttribute("mode", "created");
		return ".qna1.created";
	}
	
	@RequestMapping(value = "/qna1/created",
			method = RequestMethod.POST)
	public String createdSubmit(Qna1 dto, HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login";
		}
		
		dto.setUserId(info.getUserId());
		
		service.insertQna1(dto);
		
		return "redirect:/qna1/list";
	}

	@RequestMapping("/qna1/list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "subject") String searchKey,
			@RequestParam(defaultValue = "") String searchValue,
			HttpServletRequest req, Model model) throws Exception {
			
		int rows =10;
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
				List<Qna1> list = service.listQna1(map);
		
				int listNum, n = 0;
				Iterator<Qna1> it = list.iterator();
				while (it.hasNext()) {
					Qna1 dto = it.next();
					listNum = dataCount - (start + n - 1);
					dto.setListNum(listNum);
					n++;
				}
				
				String query = "";
				String listUrl, articleUrl;
				if (searchValue.length() != 0) {
					query += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
				}
				
				String cp = req.getContextPath();
				listUrl = cp + "/qna1/list?" +query;
				articleUrl = cp +"/qna1/article?" + query+"&page="+current_page;

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
				
				return ".qna1.list";
	}
	
	@RequestMapping(value="/qna1/article")
	public String article(
			@RequestParam int qna1Code,
			@RequestParam String page,
			@RequestParam (defaultValue="subject") String searchKey,
			@RequestParam (defaultValue="") String searchValue,
			Model model
			) throws Exception{
		
		//이전,다음등 사용할 파라미터
		String query="page="+page;
		if(searchValue.length()!=0) {
			query+="&searchKey="+searchKey;
			query+="&searchValue="+searchValue;
			
		}
		
		searchValue=URLDecoder.decode(searchValue, "UTF-8");
		
		//조회수
		service.updateHitCount(qna1Code);
		
		//게시물 가져오기
		Qna1 dto=service.readQna1(qna1Code);
		if(dto==null) {
			return "redirect:/qna1/list?"+query;	
		}
		
		//엔터를 <br>로 변경
		//찾아보기: 엔터를 <br>로 바꾸지 않고 css로 가능
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		//이전글, 다음글
		Map<String, Object> map=new HashMap<>();
		map.put("qna1Code", qna1Code);
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		Qna1 preReadDto=service.preReadQna1(map);
		Qna1 nextReadDto=service.nextReadQna1(map);
		
		//포워딩할 jsp에 넘길 데이터
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		
		return ".qna1.article";
		
	}
	
	@RequestMapping(value="/qna1/update",
			method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int qna1Code,
			@RequestParam String page,
			Model model) {
		Qna1 dto=service.readQna1(qna1Code);
		if(dto==null) {
				return "redirect:/qna1/list?page="+page;
			}
			
			model.addAttribute("dto",dto);
			model.addAttribute("mode","update");
			model.addAttribute("page", page);
			
			
					
		
			return ".qna1.created";
	}
	
	@RequestMapping(value="/qna1/update",
			method=RequestMethod.POST)
		public String updateSubmit(
			Qna1 dto,
			@RequestParam String page,
			HttpServletRequest req
			){
			service.updateQna1(dto);
	
			return "redirect:/qna1/list?page="+page;
}
	
	@RequestMapping(value="/qna1/delete")	
	public String delete(
			@RequestParam int qna1Code,
			@RequestParam String page,
			Model model)throws Exception{
		
		service.deleteQna1(qna1Code);
		
		return "redirect:/qna1/list?page="+page;
	}	
	
	
	
	
	
}

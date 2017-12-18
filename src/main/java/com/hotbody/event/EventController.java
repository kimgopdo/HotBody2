package com.hotbody.event;

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
import org.springframework.web.servlet.ModelAndView;

import com.hotbody.common.FileManager;
import com.hotbody.common.MyUtil;

@Controller("event.eventController")
public class EventController {
	@Autowired
	private EventService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="/event/list")
	public String list(HttpServletRequest req,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model
			) throws Exception {
			
			int rows = 10; //한 화면에 보여지는 게시물 수
			int total_page = 0;
			int dataCount = 0;
			
			if(req.getMethod().equalsIgnoreCase("GET")) {//GET방식인 경우
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			}
			
			//전체페이지수
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("searchKey", searchKey);
			map.put("searchValue", searchValue);			
			dataCount = service.dataCount(map);
			
		
			if(dataCount !=0)
				total_page = myUtil.pageCount(rows, dataCount);
			
			//다른 사람이 자료를 삭제해서 전체 페이지수가 변경된 경우
			if(total_page < current_page)
				current_page = total_page;
			
			//리스트에 출력할 데이터 가져오기
			int start = (current_page -1) * rows + 1;
			int end = current_page * rows;
			map.put("start", start);
			map.put("end", end);		
			List<Event> list = service.listEvent(map);
			
			//1페이지인 경우 공지글 가져오기
			List<Event> listTop = null;
			if(current_page == 1)
				listTop = service.listEventTop();
			
			//출력 번호
			int listNum, n=0;
			Iterator<Event> it=list.iterator();
			while(it.hasNext()) {
				Event data=it.next();
				listNum = dataCount - (start + n-1);
				data.setListNum(listNum);
				n++;
			}
			
			String query ="";
			String listUrl;
			String articleUrl;
			if(searchValue.length()!=0) {
				query = "searchKey=" +searchKey +
							"&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			}
			String cp = req.getContextPath();
			listUrl = cp+"/event/list";
			articleUrl = cp+"/event/article?page=" + current_page;
			if(query.length()!=0) {
				listUrl = listUrl + "?" + query;
				articleUrl = articleUrl + "&" + query;				
			}
			//페이징 처리결과
			String paging = myUtil.paging(current_page, total_page, listUrl);
			
			//list.jsp에 넘길 데이터
			model.addAttribute("list", list);
			model.addAttribute("listTop", listTop);
			model.addAttribute("articleUrl", articleUrl);
			model.addAttribute("page", current_page);
			model.addAttribute("total_page", total_page);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("paging", paging);
			
			return ".event.list";
			
	}
	
	@RequestMapping(value="/event/created",
					method=RequestMethod.GET)
	public ModelAndView createdForm() throws Exception {
		ModelAndView mav=new ModelAndView("event/created");
		mav.addObject("mode", "created");
		return mav;
	}
	
	@RequestMapping(value="/event/created",
					method=RequestMethod.POST)
	public String createdSubmit(HttpServletRequest session, Event dto) throws Exception {
		dto.setUserId("asd");
		
		String root = session.getServletContext().getRealPath("/");
		
		String pathname = root + File.separator + "uploads" + File.separator + "Event";
		
		service.insertEvent(dto, pathname);
		
		return "redirect:/event/list";
	}
	
	@RequestMapping(value="/event/article")
	public String article(
			@RequestParam int eventCode,
			@RequestParam int page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model) throws Exception {
		
		
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		//조회수 증가 
		service.updateHitCount(eventCode);
		//해당 레코드 가져오기
		Event dto = service.readEvent(eventCode);
		if(dto==null) 
			return "redirect:/event/list";
	
		//스타일로 처리하는 경우
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
	
		//이전글 다음글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("eventCode", eventCode);
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		Event preReadDto = service.preReadEvent(map);
		Event nextReadDto = service.nextReadEvent(map);
		
		String query = "page="+page;
		if(searchValue.length()!=0) {
			query += "&searchKey=" + searchKey;
			query += "&searchValue=" + searchValue;  
		}
		
		searchValue = URLEncoder.encode(searchValue, "utf-8");
		
		//포워딩할 jsp에 넘길 데이터 request.setAttribute
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);		
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".event.article";	
	}
	
	@RequestMapping(value="/event/update",
			method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int eventCode,
			@RequestParam String page,
			Model model) {		
		Event dto = service.readEvent(eventCode);
		if(dto==null) {
			return "redirect:/event/list?page="+page;			
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		
		return ".event.created";
		
	}
	
	@RequestMapping(value="/event/update",
			method=RequestMethod.POST)
	public String updateSubmit(
		Event dto,
		@RequestParam int page,
		HttpSession session,
		Model model
		) throws Exception {

		String root=session.getServletContext().getRealPath("/");
		
		String pathname=root+File.separator+"uploads"+File.separator+"Event";
		service.updateEvent(dto, pathname);
		
		return "redirect:/event/list?page="+page;
	}

	@RequestMapping(value="event/delete")
	public String delete(
			@RequestParam int eventCode,
			@RequestParam String page,
			HttpSession session
			) {
		String root=session.getServletContext().getRealPath("/");
		//업로드 할 경로
		String pathname=root+File.separator+"uploads"
				+File.separator+"event";
		Event dto=service.readEvent(eventCode);
		service.deleteEvent(eventCode,pathname);
		try {
			//업로드 된 파일 삭제
			if(dto.getSaveFile()!=null)
				fileManager.doFileDelete(dto.getSaveFile(), pathname);
		} catch (Exception e) {
		}
		
		dto.setSaveFile("");
		dto.setOriginalFile("");
		service.updateEvent(dto, pathname);
		
		return "redirect:/event/list?page="+page;
		//return "redirect:/Event/update?eventCode="+eventCode+"&page="+page;
	}
	
	//댓글 리스트
	@RequestMapping(value="/event/listReply")
	public String listReply(
			@RequestParam(value="eventCode") int eventCode,
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			Model model) throws Exception {
		
		int rows=5;
		int total_page=0;
		int dataCount=0;
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("eventCode", eventCode);
		
		dataCount=service.replyDataCount(map);
		total_page=myUtil.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
		// 리스트에 출력할 데이터
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		map.put("start", start);
		map.put("end", end);
		List<Reply> listReply=service.listReply(map);
		
		//엔터를 <br>
		Iterator<Reply>  it=listReply.iterator();
		int listNum, n=0;
		while(it.hasNext()) {
			Reply dto=it.next();
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);			
			dto.setContent(myUtil.htmlSymbols(dto.getContent()));
			n++;
		}
		
		//페이징처리(인수2개짜리 js로 처리)
		String paging=myUtil.paging(current_page, total_page);
		
		//jsp로 넘길 데이터
		model.addAttribute("listReply", listReply);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
			
		return ".event.listReply";
		
	}
	
	//댓글 및 댓글별 답글 삭제
	
	
	
}

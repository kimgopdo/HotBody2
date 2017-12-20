package com.hotbody.hotShop.qna;

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
import com.hotbody.hotShop.board.HotShopService;
import com.hotbody.member.SessionInfo;

@Controller("hotShop.Qna")
public class QnaController {
	@Autowired
	private  QnaService service;
	@Autowired
	private MyUtil util;
	@Autowired
	private HotShopService service2;
	
	@RequestMapping(value="/hotShop/pQnA_created", method=RequestMethod.GET)
	public String CreatedForm(Model model) {
		model.addAttribute("mode", "created");
		return ".hotShop.hotShop_QnA.pQnA_created";
	}
	
	@RequestMapping(value="/hotShop/pQnA_created", method=RequestMethod.POST)
	public String CreatedSubmit(
			Qna dto,
			HttpSession session
			) {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		dto.setUserId(info.getUserId());
		dto.setUserName(info.getUserName());
		////////////////////////////////////////////////////
		dto.setPdNum(61); // 임시로 상품번호 넣어줌(나중에 삭제)
		////////////////////////////////////////////////////
		service.insertQna(dto, "created");
		
		return "redirect:/hotShop/pQnA_list";
	}
	
	@RequestMapping(value="/hotShop/pQnA_list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="pdQSubject") String searchKey,
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
		List<Qna> list = service.listQna(map);
		
		int listNum, n = 0;
		Iterator<Qna> it = list.iterator();
		while(it.hasNext()) {
			Qna dto = it.next();
			listNum = dataCount - (start + n - 1);
			dto.setListNum(listNum);
			n++;
			
			dto.setPdQCreated(dto.getPdQCreated().substring(0, 10));
		}
		
		String query = "rows=" + rows;
		String listUrl, articleUrl;
		if(searchValue.length() != 0) {
			query +="&searchKey=" + searchKey
					+"&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}
		String cp = req.getContextPath();
		listUrl = cp + "/hotShop/pQnA_list?" + query;
		articleUrl = cp + "/hotShop/pQnA_article?" + query + "&page=" + current_page;
		
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
		
		return ".hotShop.hotShop_QnA.pQnA_list";
	}
	
	@RequestMapping(value="/hotShop/pQnA_article", method=RequestMethod.GET)
	public String article(
			@RequestParam int pdQCode,
			@RequestParam String page,
			@RequestParam(defaultValue="pdQSubject") String searchKey,
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

		Qna dto = service.readQna(pdQCode);
		if(dto == null) {
			return "redirect:/hotShop/pQnA_list" + query;
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("pdQCode", pdQCode);
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		model.addAttribute("query", query);
		model.addAttribute("rows", rows);
		
		return ".hotShop.hotShop_QnA.pQnA_article";
	}
	
	@RequestMapping(value="/hotShop/pQnA_delete")
	public String delete(
			@RequestParam int pdQCode,
			@RequestParam String page,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
 	
		service.deleteQna(pdQCode, info.getUserId());
		
		return "redirect:/hotShop/pQnA_list?page="+page;
	}
	
	@RequestMapping(value="/hotShop/pQnA_update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int pdQCode,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Qna dto = service.readQna(pdQCode);
		if(dto==null) {
			return "redirect:/hotShop/pQnA_list?page="+page;
		}
			
		if(! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/hotShop/pQnA_list?page="+page;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		
		return ".hotShop.hotShop_QnA.pQnA_created";
	}

	@RequestMapping(value="/hotShop/pQnA_update", method=RequestMethod.POST)
	public String updateSubmit(
			Qna dto, 
			@RequestParam String page,
			HttpSession session) throws Exception {	
	
		service.updateQna(dto);		
		
		return "redirect:/hotShop/pQnA_list?page="+page;
	}
	
	@RequestMapping(value="/hotShop/pQnA_answer", method=RequestMethod.GET)
	public String AnswerCreatedForm(
			@RequestParam int pdQCode,
			@RequestParam String page,
			Model model) {
		Qna dto=service.readQna(pdQCode);
		if(dto==null)
			return "redirect:/hotShop/pQnA_list";
		
		dto.setPdQSubject(dto.getPdQSubject()+"의 답변");
		dto.setPdQContent("[질문내용]<br>"+dto.getPdQContent()+"<br>-----------------------------------------------------------------------------------------------------------------------------<br>[답변내용]<br>&nbsp;");
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "answer");
		model.addAttribute("page", page);
		return ".hotShop.hotShop_QnA.pQnA_created";
	}
	
	@RequestMapping(value="/hotShop/pQnA_answer", method=RequestMethod.POST)
	public String AnswerCreatedSubmit(
			Qna dto,
			@RequestParam String page,
			HttpSession session
			) {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		dto.setUserId(info.getUserId());
		dto.setUserName(info.getUserName());
		
		service.insertQna(dto, "answer");
		
		return "redirect:/hotShop/pQnA_list?page="+page;
	}
	
	@RequestMapping(value="/hotShop/listQna")
	public String articleList(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="10") int rows,
			@RequestParam(defaultValue="1") int pdnum,
			HttpServletRequest req
			,Model model
			) {
	
	int dataCount;
    int total_page;

    Map<String, Object> map = new HashMap<>();
    map.put("pdnum", pdnum);
    dataCount = service2.dataCount_qna(map);
    
    total_page = util.pageCount(rows, dataCount);
    
    if(total_page < current_page)
       total_page=current_page;
    
    
    int start = (current_page - 1) * rows + 1;
    int end = current_page * rows;
    map.put("start", start);
    map.put("end", end);
    map.put("pdnum", pdnum);
    List<Qna> list = service2.productArticle_QnA(map);
    
    int listNum, n = 0;
    Iterator<Qna> it = list.iterator();
    while(it.hasNext()) {
       Qna dto = it.next();
       listNum = dataCount - (start + n - 1);
       dto.setListNum(listNum);
       n++;
       
       dto.setPdQCreated(dto.getPdQCreated().substring(0, 10));
    }
	
    String query = "rows=" + rows +"&pdnum="+pdnum;
    String listUrl, articleUrl;
    String cp = req.getContextPath();
    listUrl = cp + "/hotShop/shopArticle?" + query;
    articleUrl = cp + "/hotShop/pQnA_article?" + query + "&page=" + current_page;
 
	String paging = util.paging(current_page, total_page);
	 
	model.addAttribute("paging", paging);
	model.addAttribute("list", list);
	model.addAttribute("listUrl", listUrl);
	model.addAttribute("articleUrl", articleUrl);
	
	return "hotShop/listQna";
	}
}

package com.hotbody.mocofb;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotbody.common.FileManager;
import com.hotbody.common.MyUtil;
import com.hotbody.member.SessionInfo;

@Controller("mocofb.FBController")
public class FBController {

	@Autowired
	private FBService service;

	@Autowired
	private FileManager fileManager;

	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value = "/moco_board/{mocoNum}/c_free", method = RequestMethod.GET)
	public String createdForm(
			@PathVariable int mocoNum,
			Model model) throws Exception {
		model.addAttribute("mode", "created");
		model.addAttribute("mocoNum", mocoNum);
		
		return ".moco_board.c_free";
	}

	@RequestMapping(value = "/moco_board/{mocoNum}/c_free", method = RequestMethod.POST)
	public String createdSubmit(@PathVariable int mocoNum, HttpSession session, FB dto) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "fbfile";

		dto.setUserId(info.getUserId());
		dto.setGeNum(mocoNum);

		service.insertFB(dto, pathname);
		
		return "redirect:/moco_board/"+mocoNum+"/list_free";

	}
	

	@RequestMapping(value = "/moco_board/{mocoNum}/list_free")
	public String list(
			@PathVariable int mocoNum,
			HttpServletRequest req, 
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			Model model) throws Exception {

		String cp = req.getContextPath();

		int rows = 10;
		int total_page = 0;
		int dataCount = 0;

		// 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mocoNum", mocoNum);
		dataCount = service.dataCount(map);
		if (dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);

		// 다른 사람이 자료를 삭제하여 전체 페이지가 변화된 경우
		if (total_page < current_page)
			current_page = total_page;

		// 리스트에 출력할 데이터
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);

		List<FB> list = service.listFB(map);
		
		// 리스트 번호
		int listNum, n = 0;
		Iterator<FB> it = list.iterator();
		while (it.hasNext()) {
			FB data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}
		String listUrl;
		String articleUrl;

		listUrl = cp + "/moco_board/"+mocoNum+"/list_free";
		articleUrl = cp + "/moco_board/"+mocoNum+"/article_free?page="+current_page;

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("paging", paging);

		req.setAttribute("mocoNum", mocoNum);

		return ".moco_board.list_free";
	}
	
////mocojee main (블로그형)////
	@RequestMapping(value="/moco_board/{mocoNum}/article_free", method=RequestMethod.GET)
	public String FBarticle(
			@PathVariable int mocoNum, HttpServletRequest req,  
			@RequestParam(value="num") int moFBNum,
			Model model) throws Exception{
		
		System.out.println("hello");
		FB dto=service.readFB(moFBNum);	
		System.out.println(moFBNum);
		
		if (dto==null)
			return "redirect:/moco_board/{mocoNum}/article_free";
		
		model.addAttribute("dto", dto);
		model.addAttribute("mocoNum", mocoNum);
		model.addAttribute("moFBNum", moFBNum);
		
		return ".moco_board.article_free";	
	}
	
//	@RequestMapping(value="/moco_board/article_free", method=RequestMethod.GET)
//	public String article(
//			@RequestParam (value="moFBNum") int moFBNum,
//			@RequestParam(value="page") String page,
//			@RequestParam(value="searchKey", defaultValue="moFBSubject") String searchKey,
//			@RequestParam(value="searchValue", defaultValue="moFBSubject") String searchValue,
//				Model model) throws Exception {
//					
//		 searchValue = URLDecoder.decode(searchValue,"utf-8");
//		
//		 //조회수 증가
//		 service.hitCount(moFBNum);
//		 
//		 FB dto = service.readFB(moFBNum);
//		 if(dto==null)
//			 return "redirect:/moco_board/list?page="+page;
//		 	 
//		 
//		 //이전 글 
//		 Map<String,Object> map=new HashMap<String,Object>();
//		 map.put("searchKey", searchKey);
//		 map.put("searchValue", searchValue);
//		 map.put("moFBNum", moFBNum);
//		 
//		 FB preReadFBDto=service.preReadFB(map);
//		 FB nextReadFBDto=service.nextReadFB(map);
//		 
//		 model.addAttribute("dto",dto);
//		 model.addAttribute("preReadFB",preReadFBDto);
//		 model.addAttribute("nextReadFB",nextReadFBDto);
//		 
//		 model.addAttribute("page",page);
//		 
//		return ".moco_board.article_free";
//	
//		
//	} 
	
}

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
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping(value="/moco_board/{mocoNum}/u_free", method=RequestMethod.GET)
	public String updateForm(
			@PathVariable int mocoNum, 
			@RequestParam(value="num") int moFBNum,
			HttpSession session, Model model) throws Exception{		
		
		SessionInfo info =(SessionInfo)session.getAttribute("member");
			
		FB dto=service.readFB(moFBNum);
		if(dto==null) {
			return "redirect:/moco_board/{mocoNum}/article_free";
		}
		
		if(! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/moco_board/{mocoNum}/list_free";
		}
		
		model.addAttribute("dto",dto);
		model.addAttribute("mode","u_free");
		
		
		return ".moco_board.c_free";
			
	}
	
	@RequestMapping(value="/moco_board/{mocoNum}/u_free", method=RequestMethod.POST)
	public String updateSubmit(
			@PathVariable int mocoNum,
			FB dto, HttpSession session) throws Exception{	
		
		service.updateFB(dto);		
		
		return "redirect:/moco_board/{mocoNum}/list_free";
			
	}
	
	@RequestMapping(value="/moco_board/{mocoNum}/delete")
	public String delete(
			@PathVariable int mocoNum, 
			@RequestParam int moFBNum, HttpSession session,
			Model model) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		service.deleteFB(moFBNum);
			
		return "redirect:/moco_board/{mocoNum}/list_free";
				
	}

	@RequestMapping(value="/moco_board/insertReply", method=RequestMethod.POST)
	@ResponseBody 
	public Map<String,Object> insertReply(
			Reply dto, 
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String state="true";
		if(info==null) {
			state="loginFail";
		}else {
			dto.setUserId(info.getUserId());
			int result=service.insertReply(dto);
			if(result==0)
				state="false";
		}
		
		Map<String,Object> model = new HashMap<>();
		model.put("state", state);
		return model;
			
	}
	
	@RequestMapping(value="/moco_board/listReply")
	public String listReply(
			@PathVariable int mocoNum, 
			@RequestParam(value="frCode") int frCode,
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			Model model) throws Exception {
			
		int rows=5;
		int total_page=0;
		int dataCount=0;
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("frCode", frCode);
		
		dataCount=service.replyDataCount(map);
		total_page=myUtil.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
		//리스트에 출력
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Reply> listReply=service.listReply(map);
		
		for(Reply dto: listReply) {
			dto.setMoFBReply(dto.getMoFBReply().replaceAll("\n", "<br>"));
		}
		
		// 페이징 처리
		String paging=myUtil.paging(current_page, total_page);
		
		//jsp로 넘길 데이터
			model.addAttribute("listReply", listReply);
			model.addAttribute("pageNo", current_page);
			model.addAttribute("replyDataCount", dataCount);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);
		
		return ".moco_board.listReply";
		
	}
	
}


	

	


package com.hotbody.mocojee;

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
import com.hotbody.mocobung.Bung;


@Controller("mocojee.MocojeeController")
public class MocojeeController {
	@Autowired
		private MocojeeService service;
	
	@Autowired
		private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	   @RequestMapping(value="/mocojee/list_mocojee")
	   public String listmocojee(HttpServletRequest req,
				@RequestParam(value="page", defaultValue="1") int current_page,

				Model model) throws Exception {
			
			String cp = req.getContextPath();
			
			int rows=12; 
			int total_page = 0;
			int dataCount= 0;

			
			//전체 페이지 수 
			Map<String, Object> map = new HashMap<String, Object>();

			dataCount = service.dataCount(map);
			if(dataCount != 0)
				total_page = myUtil.pageCount(rows, dataCount);

			// 다른 사람이 자료를 삭제하여 전체 페이지가 변화된 경우
			if(total_page < current_page)
				current_page = total_page;
			
			
			//리스트에 출력할 데이터 
			int start = (current_page-1) * rows +1;
			int end = current_page * rows;
			map.put("start", start);
			map.put("end", end);
			
			List<Mocojee>list = service.listMocojee(map);
			
			//리스트 번호
			int listNum, n=0;
			Iterator<Mocojee> it=list.iterator();
			while(it.hasNext()) {
				Mocojee data = it.next();
				listNum = dataCount - (start + n-1);
				data.setListNum(listNum);
				n++;
			}
			
			String listUrl;
			String articleUrl;
			
			listUrl = cp+"/mocojee/list_mocojee";
			articleUrl=cp+"/mocojee";
			
			String paging = myUtil.paging(current_page, total_page, listUrl);
			
			model.addAttribute("list",list);
			model.addAttribute("articleUrl", articleUrl);
			model.addAttribute("page", current_page);
			model.addAttribute("total_page", total_page);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("paging", paging);
			
			req.setAttribute("list_mocojee", list);
		
			return ".mocojee.list_mocojee";	
		}
		
	     // model.addAttribute("listmoco", list);

	   
	@RequestMapping(value="/mocojee/c_mocojee", method=RequestMethod.GET)
		public String mocojeeForm(Model model) throws Exception{
		
		model.addAttribute("mode","c_mocojee");
	
		return ".mocojee.c_mocojee";	
	}
	
	@RequestMapping(value="/mocojee/c_mocojee", method=RequestMethod.POST)
		public String createdSubmit(Mocojee dto, HttpSession session)
		throws Exception{		
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"c_mocojee";
		
		dto.setUserId(info.getUserId());
		
		service.insertMocojee(dto, pathname);
			
		return "redirect:/mocojee/list_mocojee";
		
	}
	
	@RequestMapping(value="/mocojee/u_mocojee", method=RequestMethod.GET)
	public String update(
			@RequestParam int geNum, 
			HttpSession session, Model model) throws Exception{
		SessionInfo info =(SessionInfo)session.getAttribute("member");
		
		Mocojee dto = service.readMocojee(geNum);
		if(dto==null) {
			return "redirect:/mocojee/list_mocojee";
		}

		 if(! info.getUserId().equals(dto.getUserId())) {
			 return "redirect:/mocojee/list_mocojee";
		 }
		 
		model.addAttribute("dto",dto);
		model.addAttribute("mode", "u_mocojee");	
		
		return ".mocojee.c_mocojee";
	}
	
	@RequestMapping(value="/mocojee/u_mocojee", 
			method=RequestMethod.POST)
	public String updateSubmit(			
			Mocojee dto, 
			HttpSession session) throws Exception {
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"c_mocojee";
		
		//수정
		service.updateMocojee(dto,pathname);
			
		return "redirect:/mocojee/list_mocojee";
		
	}
	
	@RequestMapping(value="/mocojee/deleteFile", 
								method=RequestMethod.GET)
	public String deleteFile(
			@RequestParam int geNum,
			HttpSession session) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Mocojee dto=service.readMocojee(geNum);
		
		if(dto==null) {
			return "redirect:/mocojee/list_mocojee";
		}
		if(! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/mocojee/list_mocojee";
		}
			
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"c_mocojee";
		if(dto.getMoImage() != null && dto.getMoImage().length()!=0) {
			fileManager.doFileDelete(dto.getMoImage(), pathname);
			
			dto.setMoImage("");
			service.updateMocojee(dto, pathname);
		}
	//	return "redirect:/mocojee/u_mocojee?geNum="+geNum;
		return "redirect:/mocojee/list_mocojee?geNum="+geNum;	
		
	}
	
	@RequestMapping(value="/mocojee/delete")
	public String delete(
			@RequestParam int geNum,
			HttpSession session) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"c_mocojee";
		
		service.deleteMocojee(geNum,pathname,info.getUserId());
		
		return "redirect:/mocojee/list_mocojee";
		
	}
		
		
	////mocojee main (블로그형)////
	@RequestMapping(value="/mocojee/{mocoNum}/main")
	public String mocojeeMain(
			@PathVariable int mocoNum, 
			Model model) throws Exception{
			
		Mocojee dto=service.readMocojee(mocoNum);
		
		if (dto==null)
			return "redirect:/mocojee/list_mocojee";
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("mocoNum", mocoNum);		
		
		List<Bung> list=service.listBung(map);
		
		model.addAttribute("list",list);
		
		model.addAttribute("dto", dto);
		model.addAttribute("mocoNum", mocoNum);
		
		
		return ".mocojee.article";	
	}
	
		
}
	


	



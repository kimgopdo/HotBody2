package com.hotbody.mocobung;

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

import com.hotbody.common.MyUtil;

@Controller("mocobung.BungController")
public class BungController {
	
	@Autowired
	private BungService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/mocobung/{mocoNum}/b_created" , method=RequestMethod.GET)
	public String bungCreated(Model model, 
			@PathVariable int mocoNum,
			@RequestParam int num ) throws Exception {
		model.addAttribute("mode","created");
		model.addAttribute("geNum", num);
		model.addAttribute("mocoNum", mocoNum);
		
		return ".mocobung.b_created";
	}
	
	@RequestMapping(value="/mocobung/{mocoNum}/b_created")
	@ResponseBody
	public Map<String,Object> b_submit (
			@PathVariable int mocoNum,
			Bung dto, HttpSession session){
		System.out.println(dto.getMosubName()+"===========================");
		
		dto.setGeNum(mocoNum);
		
		service.insertBung(dto);
		
		Map<String,Object> model = new HashMap<>();
		model.put("state", "true");
			
		return model;	
	}
	
	@RequestMapping(value="/mocobung/{mocoNum}/list")
	public String list(
			HttpServletRequest req, 
			@RequestParam (value="page", defaultValue="1") int current_page,
			@PathVariable int mocoNum, 			
			@RequestParam int mosubNum,
			Model model) throws Exception{
		
		String cp=req.getContextPath();
			
		int rows=4;
		int total_page=0;
		int dataCount=0;
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("mocoNum", mocoNum);
		dataCount=service.dataCount(map);
		if(dataCount!=0)
			total_page = myUtil.pageCount(rows,dataCount);
		
		if (total_page < current_page)
			current_page = total_page;
		
		int start = (current_page -1)* rows +1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Bung> list=service.listBung(map);
		
		int listNum, n=0;
		Iterator<Bung> it=list.iterator();
		while(it.hasNext()) {
			Bung data = it.next();
			listNum = dataCount -(start + n-1);
			data.setListNum(listNum);
			n++;
		}
		String listUrl;
		String articleUrl;
		
		listUrl = cp + "/mocobung/"+mocoNum+"/list";
		articleUrl = cp + "/mocojee/"+mocoNum+"/main";
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		
		model.addAttribute("list",list);
		model.addAttribute("articleUrl",articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("paging", paging);
		model.addAttribute("mosubNum", mosubNum);
		
		req.setAttribute("mocoNum", mocoNum);
		
		
		return ".mocojee.article";	
		
		
	} 
	
}

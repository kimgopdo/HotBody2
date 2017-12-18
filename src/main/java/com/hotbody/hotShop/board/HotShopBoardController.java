package com.hotbody.hotShop.board;

import java.io.File;
import java.net.URLDecoder;
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

import com.hotbody.common.FileManager;
import com.hotbody.common.MyUtil;
import com.hotbody.hotShop.qna.Qna;
@Controller("hotShop.board")
public class HotShopBoardController {
	@Autowired
	private HotShopService service;
	@Autowired
	FileManager file;
	@Autowired
	MyUtil util;
	//상품분류에따른 list 
	//main list는 따로 드래그엔 드롭으로 순서 변경 가능하게 만들꺼임.
	@RequestMapping("/hotShop/productList")
	public String productList(
			@RequestParam String code
			,@RequestParam String menuname
			,@RequestParam String cl
			,HttpServletRequest req
			,HttpSession session
			,Model model
			) throws Exception {
		if(req.getMethod().equalsIgnoreCase("GET")) {
			menuname = URLDecoder.decode(menuname, "UTF-8");
		}
		String cp=req.getServletContext().getRealPath("/");
		String pathname=cp+"uploads"+File.separator+"shopList";
		System.out.println(pathname);
		List<HotShop> list=null;
		Map<String, Object> map=new HashMap<>();
		map.put("listOrArticle", 0);
		map.put("cl", cl);
		map.put("code", code);
		list=service.productList(map);
		
		Iterator<HotShop> it=list.iterator();
		while(it.hasNext()) {
			HotShop dto=it.next();
			dto.setImgPath(pathname+File.separator+dto.getImgSaveFilename());
			System.out.println(dto.getImgPath());
		}
		
		model.addAttribute("list", list);
		model.addAttribute("state", menuname);
		return ".hotShop.productList";
	}
	
	//쇼핑몰 전체후기 리스트
	@RequestMapping("/hotShop/shopReviews")
	public String shopReviewList() throws Exception {
		return ".hotShop.shopReviewList";
	}
	
	//구입 페이지
	@RequestMapping(value="/hotShop/payment")
	public String paymentForm() {
		return ".hotShop.payPage";
	}
	
	//상품 아티클
	@RequestMapping(value="/hotShop/shopArticle")
	public String shopArticle(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="10") int rows,
			@RequestParam(defaultValue="1") int pdnum,
			HttpServletRequest req
			,Model model
			) {
		
		int dataCount;
		int total_page;
		service.productHitCount(pdnum);
		Map<String, Object> map = new HashMap<>();
		map.put("pdnum", pdnum);
		dataCount = service.dataCount_review(map);
		
		total_page = util.pageCount(rows, dataCount);
		
		if(total_page < current_page)
			total_page=current_page;
		
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		map.put("pdnum", pdnum);
		List<Qna> list = service.productArticle_QnA(map);
		
		int listNum, n = 0;
		Iterator<Qna> it = list.iterator();
		while(it.hasNext()) {
			Qna dto = it.next();
			listNum = dataCount - (start + n - 1);
			dto.setListNum(listNum);
			n++;
			
			dto.setPdQCreated(dto.getPdQCreated().substring(0, 10));
		}
		
		
		HotShop dto=null;
		
		map.put("listOrArticle", 1);
		map.put("pdnum", pdnum);
		
		dto=service.productArticle(map);
		
		String query = "rows=" + rows +"&pdnum="+pdnum;
	      String listUrl, articleUrl;
	      String cp = req.getContextPath();
	      listUrl = cp + "/hotShop/shopArticle?" + query;
	      articleUrl = cp + "/hotShop/pQnA_article?" + query + "&page=" + current_page;
		
		String paging = util.paging(current_page, total_page,listUrl);
		
		model.addAttribute("paging", paging);
		model.addAttribute("dto", dto);
		model.addAttribute("list", list);
		model.addAttribute("listUrl", listUrl);
		model.addAttribute("articleUrl", articleUrl);
		return ".hotShop.shopArticle";
	}
	
	//INSERT UPDATE 폼 이동
	@RequestMapping(value="/hotShop/created",  method=RequestMethod.GET)
	public String createdForm(
			@RequestParam(value="pdnum", defaultValue="0") int pdnum
			,@RequestParam(value="mode" ,defaultValue="created") String mode
			,Model model
			) {
		Map<String, Object> map=new HashMap<>();
		if(mode.equalsIgnoreCase("update")) {
			HotShop dto=null;
			map.put("listOrArticle", 1);
			map.put("pdnum", pdnum);
			dto=service.productArticle(map);
			model.addAttribute("mode", mode);
			model.addAttribute("dto", dto);
		}else {
			model.addAttribute("mode", mode);
		}
		return ".hotShop.created";
	}
	
	
	//created submit
	@RequestMapping(value="/hotShop/created",  method=RequestMethod.POST)
	public String createdSubmit(
			HotShop dto
			,@RequestParam(defaultValue="created") String mode
			,@RequestParam(defaultValue="") String imgSaveFilename
			,HttpServletRequest req
			,Model model
			) throws Exception {
		System.out.println("-------------------------------------------------------------------------------------");
		System.out.println(dto.getPdnum());
		System.out.println(imgSaveFilename);
		String cp=req.getServletContext().getRealPath("/");
		String pathname=cp+"uploads"+File.separator+"shopList";
		if(mode.equalsIgnoreCase("update")) {
			System.out.println("들어와라");
			file.doFileDelete(imgSaveFilename, pathname);
			service.productUpdate(dto, pathname);
		}else {
			service.insertProductList(dto, pathname);
		}
		
		return "redirect:/hotShop";
	}
	
	@RequestMapping(value="/hotShop/schedule", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> schedule(
			Schedule dto
			,Model model
			) {
		List<Schedule> scheduleList=null;
		service.insertSchedule(dto);
		scheduleList=service.readSchedules();
		Map<String, Object> map=new HashMap<>();
		map.put("monthly", scheduleList);
		return map;
	}
	@RequestMapping(value="/hotShop/schedule")
	@ResponseBody
	public Map<String, Object> scheduleRead(
			Model model
			) {
		List<Schedule> scheduleList=null;
		scheduleList=service.readSchedules();
		Map<String, Object> map=new HashMap<>();
		map.put("monthly", scheduleList);
		return map;
	}
	@RequestMapping(value="/hotShop/productInInfo")
	public String productInInfoList(
			@RequestParam(defaultValue="") String startDate,
			@RequestParam(defaultValue="") String endDate,
			@RequestParam(value="page",defaultValue="1") int page,
			String order,
			String colum,
			Model model,
			HttpSession session,
			HttpServletRequest req
			){
		int row=5;
		int start=0;
		int end=0;
		int dataCount=0;
		int current_page=1;
		int total_page=0;
		String paging;
		if(page!=1) {
			current_page=page;
		}
		dataCount=service.dataCount();
		total_page=dataCount/row;
		if (total_page<0) {
			total_page=1;
		}
		if(current_page>total_page)
			total_page=current_page;
		start=current_page-1*row+1;
		end=current_page*row;
		
		System.out.println("-------------------------------------");
		System.out.println(page);
		System.out.println(start);
		System.out.println(end);
		System.out.println(current_page);
		System.out.println(total_page);
		System.out.println(startDate);
		System.out.println(endDate);
		System.out.println("-------------------------------------");
		List<ProductIn> productInList=null;
		Map<String, Object> map=new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("page", page);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("colum", colum);
		map.put("order", order);
		productInList=service.readProductIn(map);
		String cp=req.getServletContext().getRealPath("/");
		String pathname=cp+"uploads"+File.separator+"shopList";
		map=new HashMap<>();
		List<HotShop> productList=null;
		map.put("listOrArticle", 0);
		productList=service.productList(map);
		Iterator<HotShop> it=productList.iterator();
		while(it.hasNext()) {
			HotShop dto=it.next();
			dto.setImgPath(pathname+File.separator+dto.getImgSaveFilename());
		}
		paging=util.paging(current_page, total_page);
		List<Supply> supplyList=null;
		supplyList=service.readSupply();
		model.addAttribute("productInList", productInList);
		model.addAttribute("productList", productList);
		model.addAttribute("supplyList",supplyList);
		model.addAttribute("paging", paging);
		model.addAttribute("current_page", current_page);
		model.addAttribute("total_page", total_page);
		return "hotShop/productInList";
	}
	
	@RequestMapping(value="/hotShop/productInlist")
	public String productInListForm(
			Model model,
			HttpSession session,
			HttpServletRequest req
			) {
		String cp=req.getServletContext().getRealPath("/");
		String pathname=cp+"uploads"+File.separator+"shopList";
		Map<String, Object> map=new HashMap<>();
		List<HotShop> productList=null;
		map.put("listOrArticle", 0);
		productList=service.productList(map);
		Iterator<HotShop> it=productList.iterator();
		while(it.hasNext()) {
			HotShop dto=it.next();
			dto.setImgPath(pathname+File.separator+dto.getImgSaveFilename());
			System.out.println(dto.getImgPath());
		}
		List<Supply> supplyList=null;
		supplyList=service.readSupply();
		int row=5;
		int dataCount=service.dataCount();
		int total_page=dataCount/row;
		List<ProductIn> productInList=null;
		productInList=service.readProductIn(map);
		model.addAttribute("productList", productList);
		model.addAttribute("supplyList",supplyList);
		model.addAttribute("productInList", productInList);
		model.addAttribute("total_page", total_page);
		return ".hotShop.productIn";
	}
	@RequestMapping(value="/hotShop/productInlist", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> productInSubmit(
			ProductIn dto
			) {
		int result=service.insertProductIn(dto);
		Map<String, Object> map=new HashMap<>();
		map.put("result", result);
		return map;
	}
}

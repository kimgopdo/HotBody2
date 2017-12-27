package com.hotbody.admin.hotShop;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotbody.common.FileManager;
import com.hotbody.common.MyUtil;
import com.hotbody.hotShop.board.HotShop;
import com.hotbody.hotShop.board.HotShopService;
import com.hotbody.hotShop.board.ProductIn;
import com.hotbody.hotShop.board.Supply;
import com.hotbody.member.MemberService;
import com.hotbody.member.SessionInfo;
import com.hotbody.milelage.MilelageService;

@Controller("admin.hotShop")
public class AdminHotShopContraller {
	@Autowired
	private HotShopService service;
	@Autowired
	private FileManager file;
	@Autowired
	private MyUtil util;
	@Autowired
	private MemberService mService;
	@Autowired
	private MilelageService mileService;
	
	//상품 INSERT UPDATE 폼 이동
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
		
		
		//상품 created submit
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
		//입고 AJAX
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
		//입고 폼띄우기
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
		//입고 INSERT
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
		
		//보임 Update
		@RequestMapping(value="/hotShop/show")
		public String show(
				@RequestParam int pdnum,
				HttpSession session
				) {
			SessionInfo info=(SessionInfo) session.getAttribute("member");
			if(info==null||! info.getUserId().equals("admin")) {
				return "redirect:/hotShop";
			}
			System.out.println(pdnum+"---------------------------------------------------------------------------------------------------------------------------\n------------------------------------------------------------------------------------------------------------------\n--------------------------------------------------------------");
			service.show(pdnum);
			
			return "redirect:/hotShop";
		}
		//숨김 Update
		@RequestMapping(value="/hotShop/hide")
		public String hide(
				@RequestParam int pdnum,
				HttpSession session
				) {
			SessionInfo info=(SessionInfo) session.getAttribute("member");
			if(info==null||! info.getUserId().equals("admin")) {
				return "redirect:/hotShop";
			}
			System.out.println(pdnum+"---------------------------------------------------------------------------------------------------------------------------\n------------------------------------------------------------------------------------------------------------------\n--------------------------------------------------------------");
			service.hide(pdnum);
			
			return "redirect:/hotShop";
		}
		//상품유형별 메뉴 삭제(지울 시 되 묻는것과 속해있는 상품목록 관리여부)
		@RequestMapping(value="/hotShop/menuDeleteBci")
		public String menuDeleteBci(
				@RequestParam int code
				) {
			service.deleteBcl(code);
			return "redirect:/hotShop";
		}
		//상품 영양소별 메뉴 삭제(지울 시 되 묻는것과 속해있는 상품목록 관리여부)
		@RequestMapping(value="/hotShop/menuDeleteScl")
		public String menuDeleteScl(
				@RequestParam int code
				) {
			service.deleteSci(code);
			return "redirect:/hotShop";
		}
}

package com.hotbody.admin.hotShop;

import java.io.File;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotbody.common.FileManager;
import com.hotbody.common.MyUtil;
import com.hotbody.hotShop.board.Chart;
import com.hotbody.hotShop.board.HotShop;
import com.hotbody.hotShop.board.HotShopService;
import com.hotbody.hotShop.board.ProductDis;
import com.hotbody.hotShop.board.ProductIn;
import com.hotbody.hotShop.board.Supply;
import com.hotbody.member.SessionInfo;

@Controller("admin.hotShop")
public class AdminHotShopContraller {
	@Autowired
	private HotShopService service;
	@Autowired
	private FileManager file;
	@Autowired
	private MyUtil util;

	// 상품분류에따른 list
	// main list는 따로 드래그엔 드롭으로 순서 변경 가능하게 만들꺼임.
	@RequestMapping("/admin/hotShop/productList")
	public String productList(@RequestParam(defaultValue = "") String code,
			@RequestParam(defaultValue = "") String menuname, @RequestParam(defaultValue = "") String cl,
			@RequestParam(defaultValue = "") String created, HttpServletRequest req,
			@RequestParam(value = "page", defaultValue = "1") int page, HttpSession session, Model model)
			throws Exception {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			menuname = URLDecoder.decode(menuname, "UTF-8");
		}
		String cp = req.getServletContext().getRealPath("/");
		String pathname = cp + "uploads" + File.separator + "shopList";
		System.out.println(pathname);
		List<HotShop> list = null;
		Map<String, Object> map = new HashMap<>();
		int total_page = 0;
		int dataCount = 0;
		int row = 5;
		map.put("newProduct", created);
		map.put("listOrArticle", 0);
		map.put("cl", cl);
		map.put("code", code);
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info != null) {
			map.put("userId", info.getUserId());
		}
		list = service.productList(map);

		dataCount = service.dataCount();
		total_page = dataCount / row;
		Iterator<HotShop> it = list.iterator();
		while (it.hasNext()) {
			HotShop dto = it.next();
			dto.setImgPath(pathname + File.separator + dto.getImgSaveFilename());
			System.out.println(dto.getImgPath());
		}

		model.addAttribute("list", list);
		model.addAttribute("state", menuname);
		model.addAttribute("total_page", total_page);
		model.addAttribute("code", code);
		model.addAttribute("cl", cl);
		return ".admin.main.hotShop.productList";
	}

	// 분류별 상품 리스트
	@RequestMapping(value = "/admin/hotShop/productListAjax")
	public String productListAjax(@RequestParam String code, @RequestParam String cl,
			@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam String formal,
			HttpSession session, Model model) {
		int row = 5;
		int start = 0;
		int end = 0;
		int dataCount = 0;
		int current_page = 1;
		int total_page = 0;
		if (page != 1) {
			current_page = page;
		}
		dataCount = service.dataCount();
		total_page = dataCount / row;
		if (total_page < 0) {
			total_page = 1;
		}
		if (current_page > total_page)
			total_page = current_page;
		start = (current_page - 1 )* row + 1;
		end = current_page * row;
		List<HotShop> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info != null) {
			map.put("userId", info.getUserId());
		}
		map.put("start", start);
		map.put("end", end);
		map.put("page", page);
		map.put("paging", "paging");
		map.put("listOrArticle", 0);
		map.put("cl", cl);
		map.put("code", code);
		map.put("formal", formal);
		list = service.productList(map);

		model.addAttribute("list", list);
		model.addAttribute("total_page", total_page);
		return "admin/main/hotShop/productListAjax";
	}

	// 상품 INSERT UPDATE 폼 이동
	@RequestMapping(value = "/admin/hotShop/created", method = RequestMethod.GET)
	public String createdForm(@RequestParam(value = "pdnum", defaultValue = "0") int pdnum,
			@RequestParam(value = "mode", defaultValue = "created") String mode, Model model) {
		Map<String, Object> map = new HashMap<>();
		if (mode.equalsIgnoreCase("update")) {
			HotShop dto = null;
			map.put("listOrArticle", 1);
			map.put("pdnum", pdnum);
			dto = service.productArticle(map);
			model.addAttribute("mode", mode);
			model.addAttribute("dto", dto);
		} else {
			model.addAttribute("mode", mode);
		}
		return ".admin.main.hotShop.created";
	}

	// 상품 created submit
	@RequestMapping(value = "/admin/hotShop/created", method = RequestMethod.POST)
	public String createdSubmit(HotShop dto, @RequestParam(defaultValue = "created") String mode,
			@RequestParam(defaultValue = "") String imgSaveFilename, HttpServletRequest req, Model model)
			throws Exception {
		System.out.println("-------------------------------------------------------------------------------------");
		System.out.println(dto.getPdnum());
		System.out.println(imgSaveFilename);
		String cp = req.getServletContext().getRealPath("/");
		String pathname = cp + "uploads" + File.separator + "shopList";
		if (mode.equalsIgnoreCase("update")) {
			System.out.println("들어와라");
			file.doFileDelete(imgSaveFilename, pathname);
			service.productUpdate(dto, pathname);
		} else {
			service.insertProductList(dto, pathname);
		}

		return "redirect:/hotShop";
	}

	// 입고 AJAX
	@RequestMapping(value = "/admin/hotShop/productInInfo")
	public String productInInfoList(@RequestParam(defaultValue = "") String startDate,
			@RequestParam(defaultValue = "") String endDate, @RequestParam(value = "page", defaultValue = "1") int page,
			String order, String colum, Model model, HttpSession session, HttpServletRequest req) {
		int row = 5;
		int start = 0;
		int end = 0;
		int dataCount = 0;
		int current_page = 1;
		int total_page = 0;
		String paging;
		if (page != 1) {
			current_page = page;
		}
		dataCount = service.dataCount();
		total_page = dataCount / row;
		if (total_page < 0) {
			total_page = 1;
		}
		if (current_page > total_page)
			total_page = current_page;
		start = current_page - 1 * row + 1;
		end = current_page * row;

		System.out.println("-------------------------------------");
		System.out.println(page);
		System.out.println(start);
		System.out.println(end);
		System.out.println(current_page);
		System.out.println(total_page);
		System.out.println(startDate);
		System.out.println(endDate);
		System.out.println("-------------------------------------");
		List<ProductIn> productInList = null;
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("page", page);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("colum", colum);
		map.put("order", order);
		productInList = service.readProductIn(map);
		String cp = req.getServletContext().getRealPath("/");
		String pathname = cp + "uploads" + File.separator + "shopList";
		map = new HashMap<>();
		List<HotShop> productList = null;
		map.put("listOrArticle", 0);
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		if(info!=null) {
			map.put("userId", info.getUserId());
		}
		productList = service.productList(map);
		Iterator<HotShop> it = productList.iterator();
		while (it.hasNext()) {
			HotShop dto = it.next();
			dto.setImgPath(pathname + File.separator + dto.getImgSaveFilename());
		}
		paging = util.paging(current_page, total_page);
		List<Supply> supplyList = null;
		supplyList = service.readSupply();
		model.addAttribute("productInList", productInList);
		model.addAttribute("productList", productList);
		model.addAttribute("supplyList", supplyList);
		model.addAttribute("paging", paging);
		model.addAttribute("current_page", current_page);
		model.addAttribute("total_page", total_page);
		return "hotShop/productInList";
	}

	// 입고 폼띄우기
	@RequestMapping(value = "/admin/hotShop/productInList")
	public String productInListForm(
			Model model,
			HttpSession session,
			HttpServletRequest req
			) {
		String cp = req.getServletContext().getRealPath("/");
		String pathname = cp + "uploads" + File.separator + "shopList";
		Map<String, Object> map = new HashMap<>();
		List<HotShop> productList = null;
		map.put("listOrArticle", 0);
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		if(info!=null) {
			map.put("userId", info.getUserId());
		}
		productList = service.productList(map);
		Iterator<HotShop> it = productList.iterator();
		while (it.hasNext()) {
			HotShop dto = it.next();
			dto.setImgPath(pathname + File.separator + dto.getImgSaveFilename());
			System.out.println(dto.getImgPath());
		}
		List<Supply> supplyList = null;
		supplyList = service.readSupply();
		int row = 5;
		int dataCount = service.dataCount();
		int total_page = dataCount / row;
		List<ProductIn> productInList = null;
		productInList = service.readProductIn(map);
		model.addAttribute("productList", productList);
		model.addAttribute("supplyList", supplyList);
		model.addAttribute("productInList", productInList);
		model.addAttribute("total_page", total_page);
		return ".admin.main.hotShop.productIn";
	}

	// 입고 INSERT
	@RequestMapping(value = "/admin/hotShop/productInList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> productInSubmit(ProductIn dto) {
		int result = service.insertProductIn(dto);
		Map<String, Object> map = new HashMap<>();
		map.put("result", result);
		return map;
	}

	// 폐기 AJAX
	@RequestMapping(value = "/admin/hotShop/productDisInfo")
	public String productDisInfoList(
			@RequestParam(defaultValue = "") String startDate,
			@RequestParam(defaultValue = "") String endDate, 
			@RequestParam(value = "page", defaultValue = "1") int page,
			String order, 
			String colum, 
			Model model, 
			HttpSession session, 
			HttpServletRequest req
			) {
		System.out.println("tttttttttttttttttttttttttttttttttttttttttttttqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
		int row = 5;
		int start = 0;
		int end = 0;
		int dataCount = 0;
		int current_page = 1;
		int total_page = 0;
		String paging;
		if (page != 1) {
			current_page = page;
		}
		dataCount = service.dataCount();
		total_page = dataCount / row;
		if (total_page < 0) {
			total_page = 1;
		}
		if (current_page > total_page)
			total_page = current_page;
		start = (current_page - 1) * row + 1;
		end = current_page * row;

		System.out.println("-------------------------------------");
		System.out.println(page);
		System.out.println(start);
		System.out.println(end);
		System.out.println(current_page);
		System.out.println(total_page);
		System.out.println(startDate);
		System.out.println(endDate);
		System.out.println("-------------------------------------");
		List<ProductDis> productDisList = null;
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("page", page);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("colum", colum);
		map.put("order", order);
		productDisList = service.readProductDis(map);
		map = new HashMap<>();
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		if(info!=null) {
			map.put("userId", info.getUserId());
		}
		paging = util.paging(current_page, total_page);
		List<Supply> supplyList = null;
		supplyList = service.readSupply();
		model.addAttribute("productDisList", productDisList);
		model.addAttribute("supplyList", supplyList);
		model.addAttribute("paging", paging);
		model.addAttribute("current_page", current_page);
		model.addAttribute("total_page", total_page);
		return "admin/main/hotShop/productDisList";
	}

	
	// 폐기 폼띄우기
	@RequestMapping(value = "/admin/hotShop/productDisList")
	public String productDisListForm(
			String order,
			String colum,
			Model model,
			HttpSession session,
			HttpServletRequest req
			) {
		String cp = req.getServletContext().getRealPath("/");
		String pathname = cp + "uploads" + File.separator + "shopList";
		Map<String, Object> map = new HashMap<>();
		List<HotShop> productList = null;
		map.put("listOrArticle", 0);
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		if(info!=null) {
			map.put("userId", info.getUserId());
		}
		productList = service.productList(map);
		Iterator<HotShop> it = productList.iterator();
		while (it.hasNext()) {
			HotShop dto = it.next();
			map.put("pdnum", dto.getPdnum());
			int num=service.readPdRawPrice(map);
			dto.setPdRawPrice(num);
			dto.setImgPath(pathname + File.separator + dto.getImgSaveFilename());
			System.out.println(dto.getImgPath());
		}
		List<Supply> supplyList = null;
		supplyList = service.readSupply();
		int row=5;
		int dataCount = service.productDisDataCount();
		int total_page = dataCount / row;
		
		model.addAttribute("productList", productList);
		model.addAttribute("supplyList", supplyList);
		model.addAttribute("total_page", total_page);
		return ".admin.main.hotShop.productDis";
	}

	// 폐기 INSERT
	@RequestMapping(value = "/admin/hotShop/productDisList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> productDisSubmit(
			ProductDis dto
			) {
		int result = service.insertProductDis(dto);
		Map<String, Object> map = new HashMap<>();
		map.put("result", result);
		return map;
	}

	// 보임 Update
	@RequestMapping(value = "/admin/hotShop/show")
	public String show(@RequestParam int pdnum, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info == null || !info.getUserId().equals("admin")) {
			return "redirect:/hotShop";
		}
		System.out.println(pdnum
				+ "---------------------------------------------------------------------------------------------------------------------------\n------------------------------------------------------------------------------------------------------------------\n--------------------------------------------------------------");
		service.show(pdnum);

		return "redirect:/hotShop";
	}

	// 숨김 Update
	@RequestMapping(value = "/admin/hotShop/hide")
	public String hide(@RequestParam int pdnum, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if (info == null || !info.getUserId().equals("admin")) {
			return "redirect:/hotShop";
		}
		System.out.println(pdnum
				+ "---------------------------------------------------------------------------------------------------------------------------\n------------------------------------------------------------------------------------------------------------------\n--------------------------------------------------------------");
		service.hide(pdnum);

		return "redirect:/hotShop";
	}

	// 상품유형별 메뉴 삭제(지울 시 되 묻는것과 속해있는 상품목록 관리여부)
	@RequestMapping(value = "/admin/hotShop/menuDeleteBci")
	public String menuDeleteBci(@RequestParam int code) {
		service.deleteBcl(code);
		return "redirect:/hotShop";
	}

	// 상품 영양소별 메뉴 삭제(지울 시 되 묻는것과 속해있는 상품목록 관리여부)
	@RequestMapping(value = "/admin/hotShop/menuDeleteScl")
	public String menuDeleteScl(@RequestParam int code) {
		service.deleteSci(code);
		return "redirect:/hotShop";
	}
	
	
	@RequestMapping(value="/admin/hotShop/chart")
	public String hotShopChart(
			@RequestParam(defaultValue="2017") String checkDate,
			HttpServletRequest req,
			HttpSession session,
			Model model
			) {
		String cp = req.getServletContext().getRealPath("/");
		String pathname = cp + "uploads" + File.separator + "shopList";
		Map<String, Object> map = new HashMap<>();
		List<HotShop> productList = null;
		map.put("listOrArticle", 0);
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		if(info!=null) {
			map.put("userId", info.getUserId());
		}
		productList = service.productList(map);
		Iterator<HotShop> it = productList.iterator();
		int n=0;
		while (it.hasNext()) {
			HotShop dto = it.next();
			int year=2017;
			year+=n;
			dto.setYear(Integer.toString(year));
			dto.setImgPath(pathname + File.separator + dto.getImgSaveFilename());
			System.out.println(dto.getImgPath());
			n++;
		}
		List<Supply> supplyList = null;
		supplyList = service.readSupply();
		int row = 5;
		int dataCount = service.dataCount();
		int total_page = dataCount / row;
		List<ProductIn> productInList = null;
		productInList = service.readProductIn(map);
		model.addAttribute("productList", productList);
		model.addAttribute("supplyList", supplyList);
		model.addAttribute("productInList", productInList);
		model.addAttribute("total_page", total_page);
		return ".admin.main.hotShop.hotShopChart";
	}
}

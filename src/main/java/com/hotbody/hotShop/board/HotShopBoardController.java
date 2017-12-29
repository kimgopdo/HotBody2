package com.hotbody.hotShop.board;



import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.hotbody.common.MyUtil;
import com.hotbody.member.Member;
import com.hotbody.member.MemberService;
import com.hotbody.member.SessionInfo;
import com.hotbody.milelage.Milelage;
import com.hotbody.milelage.MilelageService;
@Controller("hotShop.board")
public class HotShopBoardController {
	@Autowired
	private HotShopService service;
	@Autowired
	private MyUtil util;
	@Autowired
	private MemberService mService;
	@Autowired
	private MilelageService mileService;
	//상품분류에따른 list 
	//main list는 따로 드래그엔 드롭으로 순서 변경 가능하게 만들꺼임.
	@RequestMapping("/hotShop/productList")
	public String productList(
			@RequestParam(defaultValue="") String code
			,@RequestParam(defaultValue="") String menuname
			,@RequestParam(defaultValue="") String cl
			,@RequestParam(defaultValue="") String created
			,HttpServletRequest req
			,@RequestParam(value="page", defaultValue="1") int page
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
		int total_page=0;
		int dataCount=0;
		int row=5;
		map.put("newProduct", created);
			map.put("listOrArticle", 0);
			map.put("cl", cl);
			map.put("code", code);
			SessionInfo info=(SessionInfo) session.getAttribute("member");
			if(info!=null) {
				map.put("userId", info.getUserId());
			}
			list=service.productList(map);
			
			dataCount=service.dataCount();
			total_page=dataCount/row;
		Iterator<HotShop> it=list.iterator();
		while(it.hasNext()) {
			HotShop dto=it.next();
			dto.setImgPath(pathname+File.separator+dto.getImgSaveFilename());
			System.out.println(dto.getImgPath());
		}
		
		model.addAttribute("list", list);
		model.addAttribute("state", menuname);
		model.addAttribute("total_page", total_page);
		model.addAttribute("code", code);
		model.addAttribute("cl", cl);
		return ".hotShop.productList";
	}
	
	//쇼핑몰 전체후기 리스트
	@RequestMapping("/hotShop/shopReviews")
	public String shopReviewList(
			@RequestParam(value="page",defaultValue="1") int page,
			@RequestParam(defaultValue="subject") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			HttpServletRequest req,
			HttpSession session,
			Model model
			) throws Exception {
		System.out.println(searchKey);
		System.out.println(searchValue);
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
		Map<String, Object> map=new HashMap<>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		dataCount=service.productDataCount(map);
		total_page=dataCount/row;
		if (total_page<0) {
			total_page=1;
		}
		if(current_page>total_page)
			total_page=current_page;
		start=(current_page-1)*row+1;
		end=current_page*row;
		
		List<HotShop> productList=null;
		
		map.put("start", start);
		map.put("end", end);
		map.put("listOrArticle", 0);
		map.put("paging", "paging");
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		if(info!=null) {
			map.put("userId", info.getUserId());
		}
		productList=service.productList(map);
		String cp=req.getServletContext().getRealPath("/");
		String pathname=cp+"uploads"+File.separator+"shopList";
		map=new HashMap<>();
		Iterator<HotShop> it=productList.iterator();
		while(it.hasNext()) {
			HotShop dto=it.next();
			dto.setImgPath(pathname+File.separator+dto.getImgSaveFilename());
		}
		String query = "";
		String listUrl, articleUrl;
		if (searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		}
		
		cp = req.getContextPath();
		listUrl = cp + "/hotShop/shopReviews?" +query;
		articleUrl = cp +"/qna1/article?" + query+"&page="+current_page;
		
		paging=util.paging(current_page, total_page,listUrl);
		model.addAttribute("list", productList);
		model.addAttribute("paging", paging);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("current_page", current_page);
		model.addAttribute("total_page", total_page);
		return ".hotShop.shopReviewList";
	}
	
	//구입 페이지
	@RequestMapping(value="/hotShop/payment")
	public String paymentForm(
			@RequestParam String cookie,
			HttpServletRequest req,
			HttpSession session,
			Model model
			) {
		int listNum=0;
		List<HotShop> list=new ArrayList<>();
		Map<String, Object> map=new HashMap<>();
		String []cookieArray=cookie.split(",");
	    for(int n=0; n<cookieArray.length;n++) {
	    	listNum++;
	    	HotShop dto=new HotShop();
	    	String cVal=cookieArray[n];
	    	map.put("listOrArticle", 1);
	    	map.put("pdnum", cVal);
	    	dto=service.productArticle(map);
	    	dto.setListNum(listNum);
	    	list.add(dto);
	    }
	    SessionInfo info=(SessionInfo) session.getAttribute("member");
		if(info!=null) {
			String userId=info.getUserId();
			Member memberDto=mService.readMember(userId);
			String tel=memberDto.getTel();
			String email=memberDto.getEmail();
			String []emailSplit=email.split("@");
			String []telSplit=tel.split("-");
			memberDto.setTel1(telSplit[0]);
			memberDto.setTel2(telSplit[1]);
			memberDto.setTel3(telSplit[2]);
			memberDto.setEmail1(emailSplit[0]);
			memberDto.setEmail2(emailSplit[1]);
			Milelage milelageDto=mileService.selectMilelage(userId);
			model.addAttribute("milelageDto", milelageDto);
			model.addAttribute("memberDto", memberDto);
		}else {
			return "redirect:/hotShop";
		}
	    model.addAttribute("list", list);
		return ".hotShop.payPage";
	}
	//장바구니 (쿠키사용)
	@RequestMapping(value="/hotShop/basketList")
	public String basketList(
			String cookie,
			HttpSession session,
			Model model
			) {
		int listNum=0;
		List<HotShop> list=new ArrayList<>();
		Map<String, Object> map=new HashMap<>();
		String []cookieArray=cookie.split(",");
	    for(int n=0; n<cookieArray.length;n++) {
	    	listNum++;
	    	HotShop dto=new HotShop();
	    	String cVal=cookieArray[n];
	    	map.put("listOrArticle", 1);
	    	map.put("pdnum", cVal);
	    	dto=service.productArticle(map);
	    	dto.setListNum(listNum);
	    	list.add(dto);
	    }
	    model.addAttribute("list2", list);
		return "hotShop/cookieList";
	}
	//구매성공여부
	@RequestMapping(value="/hotShop/payment" ,method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> paymentSubmit(
			Payment dto,
			HttpSession session
			) {
		dto.setTakerTel(dto.getTel1_1()+dto.getTel1_2()+dto.getTel1_3());
		dto.setTakerPhone(dto.getTel2_1()+dto.getTel2_2()+dto.getTel2_3());
		int result=service.insertPayment(dto);
		Map<String, Object> map=new HashMap<>();
		String state;
		if(result!=1) {
			state="payFail";
			map.put("state", state);
			return map;
		}
		state="paySuccess";
		map.put("state", state);
		map.put("paymentDto", dto);
		return map;
	}
	//구매성공 시
	@RequestMapping(value="/hotShop/paySeccess")
	public String paySeccess(
			HttpSession session,
			Model model
			) {
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login";
		}
		int orderNum=service.readDelOrder(info.getUserId());
		List<Payment> list=service.readDelOrderProduct(orderNum);
		model.addAttribute("list", list);
		return ".hotShop.paySeccess";
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
		HotShop dto=null;
		Map<String, Object> map = new HashMap<>();
		map.put("listOrArticle", 1);
		map.put("pdnum", pdnum);
		
		dto=service.productArticle(map);
		
		model.addAttribute("dto", dto);
		return ".hotShop.shopArticle";
	}
	
	
	//쓸지안쓸지는 모르겠지만 스케줄
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
	
	//분류별 상품 리스트
	@RequestMapping(value="/hotShop/productListAjax")
	public String productListAjax(
			@RequestParam String code,
			@RequestParam String cl,
			@RequestParam(value="page",defaultValue="1") int page,
			@RequestParam String formal,
			HttpSession session,
			Model model
			) {
		int row=5;
		int start=0;
		int end=0;
		int dataCount=0;
		int current_page=1;
		int total_page=0;
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
		List<HotShop> list=new ArrayList<>();
		Map<String, Object> map=new HashMap<>();
		SessionInfo info=(SessionInfo) session.getAttribute("member");
		if(info!=null) {
			map.put("userId", info.getUserId());
		}
		map.put("start", start);
		map.put("end", end);
		map.put("page", page);
		map.put("listOrArticle", 0);
		map.put("cl", cl);
		map.put("code", code);
		map.put("formal", formal);
		list=service.productList(map);
		
		model.addAttribute("list", list);
		return "hotShop/productListAjax";
	}
	//메뉴띄우는 AJAX
	@RequestMapping(value="/hotShop/menuAppend")
	@ResponseBody
	public int menuAppend(
			@RequestParam(defaultValue="")String bci,
			@RequestParam(defaultValue="")String scl
			) {
		Map<String, Object> map=new HashMap<>();
		int result=0;
		System.out.println("bci---------------"+bci);
		System.out.println("scl---------------"+scl);
		if(! bci.equals("")) {
			map.put("bci", bci);
			result=service.insertBcl(map);
		}
		if(! scl.equals("")) {
			map.put("scl", scl);
			result=service.insertSci(map);			
		}
		return result;
	}
	
	@RequestMapping(value="/hotShop/paySuccess")
	public String paySuccess() {
		return ".hotShop.paySeccess";
	}
}

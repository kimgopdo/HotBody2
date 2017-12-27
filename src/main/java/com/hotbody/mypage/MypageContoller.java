package com.hotbody.mypage;


import java.io.File;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.hotbody.member.SessionInfo;
import com.hotbody.milelage.Message;
import com.hotbody.milelage.Milelage;
import com.hotbody.milelage.MilelageService;
import com.hotbody.order.Order;
import com.hotbody.order.OrderService;

@Controller("mypageContoller")
public class MypageContoller {
	
	@Autowired
	private OrderService service;
	@Autowired
	private MilelageService mservice;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	
	@RequestMapping(value="/mypage/orderList",method=RequestMethod.GET)
	public String orderForm() throws Exception{
		
		return ".mypage.orderList";
		
	}
	
	
	@RequestMapping(value="/mypage/orderList",method=RequestMethod.POST)
	public String orderDateList(
			HttpSession session,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value="datepicker1") String lastday,
			@RequestParam(value="datepicker2") String today,HttpServletRequest req,
			Model model) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login";

		}
	
		
		String cp = req.getContextPath();

		int rows = 10; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;

		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lastday", lastday);
		map.put("today", today);
		dataCount = service.dataCount(map);
		map.put("userId",info.getUserId());

		map.put("dataCount",dataCount);
		if (dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);

		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if (total_page < current_page)
			current_page = total_page;

		// 리스트에 출력할 데이터를 가져오기
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);

		// 글 리스트
		List<Order> list = service.listOrder(map);
		
		int rnum=0;
		
		for(Order dto:list) {
			rnum=dto.getRnum();	
		}
		System.out.println(rnum);
		model.addAttribute("rnum", rnum);
		
		String query = "";
		String listUrl = cp + "/mypage/orderList";
	//	if (searchValue.length() != 0) {
	//		query = "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
	//	}

		if (query.length() != 0) {
			listUrl = cp + "/mypage/orderList?" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return ".mypage.orderList";
		
	}
	
	@RequestMapping(value="/mypage/cancelList",method=RequestMethod.GET)
	public String cancelForm() throws Exception{
		
		return ".mypage.cancelList";
		
	}
	
	
	@RequestMapping(value="/mypage/milelageList",method=RequestMethod.GET)
	public String mileageForm(HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception{
		
		//String cp = req.getContextPath();
		//아이디 로그인 될때부터 사용
		//SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login";

		}
		
		String userId=info.getUserId();

		Milelage dto = mservice.selectMilelage(userId);
		
		
		model.addAttribute("dto", dto);
		
		return ".mypage.milelageList";
		
	}
	
	
	@RequestMapping(value="/mypage/milelageList",method=RequestMethod.POST)
	public String mileageDateList(HttpServletRequest req,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value="datepicker1") String lastday,
			@RequestParam(value="datepicker2") String today,
			HttpSession session,
			Model model) throws Exception{

		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login";

		}
		
		String userId=info.getUserId();

			Milelage dto = mservice.selectMilelage(userId);
			
			String cp = req.getContextPath();

			int rows = 10; // 한 화면에 보여주는 게시물 수
			int total_page = 0;
			int dataCount = 0;

			
			// 전체 페이지 수
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("lastday", lastday);
			map.put("today", today);
			dataCount = service.dataCount(map);
			
			
			map.put("dataCount",dataCount);
			if (dataCount != 0)
				total_page = myUtil.pageCount(rows, dataCount);

			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
			if (total_page < current_page)
				current_page = total_page;

			// 리스트에 출력할 데이터를 가져오기
			int start = (current_page - 1) * rows + 1;
			int end = current_page * rows;
			map.put("userId", userId);
			map.put("start", start);
			map.put("end", end);

			// 글 리스트
			List<Milelage> list = mservice.listMilelage(map);
			
			
			String query = "";
			String listUrl = cp + "/mypage/milelageList";
		//	if (searchValue.length() != 0) {
		//		query = "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		//	}

			if (query.length() != 0) {
				listUrl = cp + "/mypage/milelageList?" + query;
			}

			String paging = myUtil.paging(current_page, total_page, listUrl);

			model.addAttribute("list", list);
			model.addAttribute("page", current_page);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);
			
			
			model.addAttribute("dto", dto);
			
		return ".mypage.milelageList";
	}
	

	

	
	@RequestMapping(value="/mypage/mypage", method=RequestMethod.GET)
	public String mypageForm(HttpServletRequest req,
		HttpSession session,
		
		
		Model model) throws Exception{

		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login";

		}
		
		String userId=info.getUserId();

		Milelage dto = mservice.selectMilelage(userId);
		
		
		model.addAttribute("dto", dto);
		
		
		
		return ".mypage.mypage";
	}
	
	
	@RequestMapping(value="/mypage/usedMilelageList",method=RequestMethod.GET)
	public String usedMileageForm(HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login";

		}
		
		String userId=info.getUserId();

		Milelage dto = mservice.selectMilelage(userId);
		
		
		model.addAttribute("dto", dto);
		
		return ".mypage.usedMilelageList";
		
	}
	
	
	@RequestMapping(value="/mypage/usedMilelageList",method=RequestMethod.POST)
	public String usedMileageDateList(HttpServletRequest req,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value="datepicker1") String lastday,
			@RequestParam(value="datepicker2") String today,
			HttpSession session,
			Model model) throws Exception{

		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login";

		}
		
		String userId=info.getUserId();

			Milelage dto = mservice.selectMilelage(userId);
			
			String cp = req.getContextPath();

			int rows = 10; // 한 화면에 보여주는 게시물 수
			int total_page = 0;
			int dataCount = 0;

			
			// 전체 페이지 수
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("lastday", lastday);
			map.put("today", today);
			dataCount = service.dataCount(map);
			
			
			map.put("dataCount",dataCount);
			if (dataCount != 0)
				total_page = myUtil.pageCount(rows, dataCount);

			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
			if (total_page < current_page)
				current_page = total_page;

			// 리스트에 출력할 데이터를 가져오기
			int start = (current_page - 1) * rows + 1;
			int end = current_page * rows;
			map.put("userId", userId);
			map.put("start", start);
			map.put("end", end);

			// 글 리스트
			List<Milelage> list = mservice.listMilelage(map);
			
			
			String query = "";
			String listUrl = cp + "/mypage/usedMilelageList";
		//	if (searchValue.length() != 0) {
		//		query = "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		//	}

			if (query.length() != 0) {
				listUrl = cp + "/mypage/usedMilelageList?" + query;
			}

			String paging = myUtil.paging(current_page, total_page, listUrl);

			model.addAttribute("list", list);
			model.addAttribute("page", current_page);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);
			
			
			model.addAttribute("dto", dto);
			
		return ".mypage.usedMilelageList";
	}
	
	
	@RequestMapping(value="/mypage/messageMain")
	public String messageList(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="total") String searchKey,
			@RequestParam(value="sender", defaultValue="") String sender,
			@RequestParam(value="taker", defaultValue="") String taker,
			@RequestParam(value="content", defaultValue="") String content,
			@RequestParam(value="subject", defaultValue="") String subject,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
   	    String cp = req.getContextPath();
   	    
   	 SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login";

		}
   	    
		int rows = 10; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
   	    
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchKey = URLDecoder.decode(searchKey, "utf-8");
			sender = URLDecoder.decode(sender, "utf-8");
			taker = URLDecoder.decode(taker, "utf-8");
			content = URLDecoder.decode(content, "utf-8");
			subject = URLDecoder.decode(subject, "utf-8");
		}
		
        // 전체 페이지 수
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("searchKey", searchKey);
        map.put("sender", sender);
        map.put("taker", taker);
        map.put("content", content);
        map.put("subject", subject);
        map.put("userId", info.getUserId());
        dataCount = mservice.mDataCount(map);
        if(dataCount != 0)
            total_page = myUtil.pageCount(rows,  dataCount) ;

        // 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
        if(total_page < current_page) 
            current_page = total_page;
        
        // 리스트에 출력할 데이터를 가져오기
        int start = (current_page - 1) * rows + 1;
        int end = current_page * rows;
        map.put("start", start);
        map.put("end", end);

        // 글 리스트
        List<Message> list = mservice.listMessage(map);
        List<Message> list2 = mservice.listMessage2(map);
        List<Message> list3 = mservice.listMessage3(map);
        
        String query = "";
        String listUrl = cp+"/notice/list";
        String articleUrl = cp+"/notice/article?page=" + current_page;
        if(searchKey.length()!=0) {
        	query = "searchKey=" + URLEncoder.encode(searchKey, "utf-8");	
        }
        if(sender.length()!=0) {
        	query += "&sender=" + URLEncoder.encode(sender, "utf-8");	
        }
        if(taker.length()!=0) {
        	query += "&taker=" + URLEncoder.encode(taker, "utf-8");	
        }
        if(content.length()!=0) {
        	query += "&content=" + URLEncoder.encode(content, "utf-8");	
        }
        if(subject.length()!=0) {
        	query += "&subject=" + URLEncoder.encode(subject, "utf-8");	
        }
        
        if(query.length()!=0) {
        	listUrl = cp+"/mypage/messageMain?" + query;
        	articleUrl = cp+"/mypage/marticle?page=" + current_page + "&"+ query;
        }
        
        String paging = myUtil.paging(current_page, total_page, listUrl);
		
		Iterator<Message>it=list.iterator();
		
		while(it.hasNext()) {
			
	         	Message data = it.next();

	         	if(data.getUserId().equals(data.getUserId2())) {
					data.setBox("내게보낸쪽지");
	         	}else if(data.getUserId().equals(info.getUserId())) {
					 data.setBox("보낸쪽지");
				}else if(data.getUserId2().equals(info.getUserId())) {
						data.setBox("받은쪽지");
				} 
		}
		
		Iterator<Message>it2=list2.iterator();
		
		while(it2.hasNext()) {
			
	         	Message data2 = it2.next();

	         	if(data2.getUserId().equals(data2.getUserId2())) {
					data2.setBox("내게보낸쪽지");
	         	}else if(data2.getUserId().equals(info.getUserId())) {
					 data2.setBox("보낸쪽지");
				}else if(data2.getUserId2().equals(info.getUserId())) {
						data2.setBox("받은쪽지");
				} 
		}
		
Iterator<Message>it3=list3.iterator();
		
		while(it3.hasNext()) {
			
	         	Message data3 = it3.next();

	         	if(data3.getUserId().equals(data3.getUserId2())) {
					data3.setBox("내게보낸쪽지");
	         	}else if(data3.getUserId().equals(info.getUserId())) {
					 data3.setBox("보낸쪽지");
				}else if(data3.getUserId2().equals(info.getUserId())) {
						data3.setBox("받은쪽지");
				} 
		}
		

        
        
		model.addAttribute("list", list);
		model.addAttribute("listSize", list.size());
		model.addAttribute("list2", list2);
		model.addAttribute("listSize2", list2.size());
		model.addAttribute("list3", list3);
		model.addAttribute("listSize3", list3.size());
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("paging", paging);

		
		return ".mypage.messageMain";
	}
	
	
	@RequestMapping(value="/mypage/sendMessage", method=RequestMethod.POST)
	public String messageWrite(Message dto,
			Model model,
			HttpSession session
			) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login";

		}

		
		// 저장
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "message";		
		
		dto.setUserId(info.getUserId());
		mservice.writeMessage(dto, pathname);
		
		return "redirect:/mypage/messageMain";
	}
	
	
	@RequestMapping(value="/mypage/checkId", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> checkId(
			@RequestParam(value="userId2") String userId2,
			Model model
			) throws Exception{
		
		String state="empty";
		
		int result = mservice.checkUserId2(userId2);

		
		if(result!=0) {
			state="full";
		}
		
		Map<String, Object> map =new HashMap<>();
		
		map.put("state", state);

		return map;
	}
	
	@RequestMapping(value="/mypage/readingMessage")
	public String readingMessage(
			@RequestParam(value="mCode") int mCode,
			Model model,
			HttpSession session
			) throws Exception{

        
		// 파일
		List<Message> listFile=mservice.listFile(mCode);
		int fileCount = mservice.fileCount(mCode);
		Message dto=mservice.readingMessage(mCode);

		
		model.addAttribute("mCode", mCode);
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("fileCount", fileCount);
	
		
		return "mypage/messageRecevie";
	}
	
	
	@RequestMapping(value="/mypage/deleteMessage")
	public String deleteMessage(
			@RequestParam(value="mCode") Integer[] mCod,
			Model model,
			HttpSession session,
			HttpServletRequest req
			) throws Exception{	
		
		
		String cp = req.getContextPath();
		//아이디 로그인 될때부터 사용
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		info.getUserId();
		
		List<Integer> mCode=Arrays.asList(mCod);
		
		for(int s:mCode)
		System.out.println(s);
		
		List<Message> listFileCode=mservice.listFileCode(mCode);	
		
		
		//파일
        mservice.deleteFile(listFileCode);
		mservice.deleteMessage(listFileCode);
	
		
		return "redirect:/mypage/messageMain";
	}
	
	
	
	@RequestMapping(value="/mypage/download")
	public void download(
			@RequestParam int fileCode,
			HttpServletResponse resp,
			HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "message";
		System.out.println(pathname);
		boolean b = false;
		
		Message dto = mservice.readFile(fileCode);
		if(dto!=null) {
			String fileName = dto.getFileName();
			String oFileName = dto.getoFileName();
			
			b = fileManager.doFileDownload(fileName, oFileName, pathname, resp);
		}
		
		if (!b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('파일 다운로드가 불가능 합니다 !!!');history.back();</script>");
			} catch (Exception e) {
			}
		}
	}
	
	
}

package com.hotbody.mypage;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hotbody.common.FileManager;
import com.hotbody.common.MyUtil;
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
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value="datepicker1") String lastday,
			@RequestParam(value="datepicker2") String today,HttpServletRequest req,
			Model model) throws Exception{
	
		
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
		
		String userId="kabdoman";

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

			//String cp = req.getContextPath();
			//아이디 로그인 될때부터 사용
			//SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			String userId="kabdoman";

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

		//String cp = req.getContextPath();
		//아이디 로그인 될때부터 사용
		//SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String userId="kabdoman";

		Milelage dto = mservice.selectMilelage(userId);
		
		
		model.addAttribute("dto", dto);
		
		
		
		return ".mypage.mypage";
	}
	
	
	@RequestMapping(value="/mypage/usedMilelageList",method=RequestMethod.GET)
	public String usedMileageForm(HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception{
		
		//String cp = req.getContextPath();
		//아이디 로그인 될때부터 사용
		//SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String userId="kabdoman";

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

			//String cp = req.getContextPath();
			//아이디 로그인 될때부터 사용
			//SessionInfo info = (SessionInfo) session.getAttribute("member");
			
			String userId="kabdoman";

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
	
	
	@RequestMapping(value="/mypage/messageMain", method=RequestMethod.GET)
	public String messageForm() throws Exception{
		
		return ".mypage.messageMain";
	}
	
	
	@RequestMapping(value="/mypage/sendMessage", method=RequestMethod.POST)
	public String messageWrite(@RequestParam("uploadFile") MultipartFile partFile,
			MultipartHttpServletRequest mreq,
			@RequestParam(value="userId2") String userId2,
			@RequestParam(value="subject") String subject,
			@RequestParam(value="content") String content,
			Model model,
			HttpSession session
			) throws Exception{
				
		String pathName="";
		String fileName="";
		
		OutputStream out = null;
	    PrintWriter printWriter = null;


		String uploadPath = mreq.getSession().getServletContext().getRealPath("/");
		String attachPath = "uploads/message/";

		try {
			fileName=partFile.getOriginalFilename();
			byte[] bytes=partFile.getBytes();
			pathName=uploadPath+attachPath;
			
			File file= new File(pathName);
			
			if (fileName != null && !fileName.equals("")) {
                if (file.exists()) {
//                    파일명 앞에 업로드 시간 초단위로 붙여 파일명 중복을 방지
                    fileName = System.currentTimeMillis() + "_" + fileName;
                    
                    file = new File(pathName + fileName);
                }
            }
			
            out = new FileOutputStream(file);
            
            
            out.write(bytes);

			
		} catch (Exception e) {
			e.toString();
		}finally {
			try {
                if (out != null) {
                    out.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }

		}
		
		fileName =pathName+fileName;
		
		Map<String, Object> map =new HashMap<>();
		
		
		//Message dto = mservice.sendMassage1(map);
		
		
		
		model.addAttribute("fileName",fileName);
		model.addAttribute("userId2",userId2);
		model.addAttribute("subject",subject);
		model.addAttribute("content",content);
		
		
		return ".mypage.messageMain";
	}
	
	
	@RequestMapping(value="/mypage/checkId", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> checkId(
			@RequestParam(value="userId2") String userId2,
			Model model
			) throws Exception{
		
		String state="empty";
		
		int result = mservice.checkUserId2(userId2);

		System.out.println(result);
		
		if(result!=0) {
			state="full";
		}
		
		Map<String, Object> map =new HashMap<>();
		
		map.put("state", state);

		return map;
	}
	
}

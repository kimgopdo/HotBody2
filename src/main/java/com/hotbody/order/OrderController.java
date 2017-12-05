package com.hotbody.order;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotbody.common.FileManager;
import com.hotbody.common.MyUtil;



@Controller("orderController")
public class OrderController {
	/*
	@Autowired
	private OrderService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	*/
	
	@RequestMapping(value="/order/orderList",method=RequestMethod.GET)
	public String orderForm() throws Exception{
		
		return ".order.orderList";
		
	}
	
	
	@RequestMapping(value="/order/orderList",method=RequestMethod.POST)
	public String orderDateList(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value="datepicker1") String lastday,
			@RequestParam(value="datepicker2") String today,HttpServletRequest req,
			Model model) throws Exception{
		/*
		String cp = req.getContextPath();

		int rows = 10; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;

		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lastday", lastday);
		map.put("today", today);

		dataCount = service.dataCount(map);
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
		List<Board> list = service.listBoard(map);

		// 리스트의 번호
		int listNum, n = 0;
		Iterator<Board> it = list.iterator();
		while (it.hasNext()) {
			Board data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}

		String query = "";
		String listUrl = cp + "/bbs/list";
		String articleUrl = cp + "/bbs/article?page=" + current_page;
		if (searchValue.length() != 0) {
			query = "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}

		if (query.length() != 0) {
			listUrl = cp + "/bbs/list?" + query;
			articleUrl = cp + "/bbs/article?page=" + current_page + "&" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		
		*/
		return ".order.orderList";
		
	}
	
	@RequestMapping(value="/order/cancelList",method=RequestMethod.GET)
	public String cancelForm() throws Exception{
		
		return ".order.cancelList";
		
	}
	
	@RequestMapping(value="/mileage/mileageList",method=RequestMethod.GET)
	public String mileageForm() throws Exception{
		
		return ".mileage.mileageList";
		
	}

}

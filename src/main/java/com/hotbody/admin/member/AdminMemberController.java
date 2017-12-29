package com.hotbody.admin.member;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.hotbody.common.MyUtil;
import com.hotbody.dietClass.DietClass;
import com.hotbody.dietClass.DietClassService;
import com.hotbody.member.Member;
import com.hotbody.member.MemberService;

@Controller("adminMember.adminMemberController")
public class AdminMemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private DietClassService serviceD;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/admin/member/list")
	public String listMember(Model model,
							HttpServletRequest req,
							@RequestParam(value="page", defaultValue="1") int current_page,
							@RequestParam(value="searchKey", defaultValue="userId") String searchKey,
							@RequestParam(value="searchValue", defaultValue="") String searchValue) throws UnsupportedEncodingException {
		
		String cp = req.getContextPath();
		System.out.println(searchValue+"@@@@@@@@@@@@@@@@@");
		int rows = 10; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
        // 전체 페이지 수
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("searchKey", searchKey);
        map.put("searchValue", searchValue);

        dataCount = service.countMember(map);
        if(dataCount != 0)
            total_page = myUtil.pageCount(rows, dataCount) ;

        // 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
        if(total_page < current_page) 
            current_page = total_page;

        // 리스트에 출력할 데이터를 가져오기
        int start = (current_page - 1) * rows + 1;
        int end = current_page * rows;
        map.put("start", start);
        map.put("end", end);

        // 회원 리스트
        List<Member> list = service.listMember(map);

        // 리스트의 번호
        int listNum, n = 0;
        Iterator<Member> it=list.iterator();
        while(it.hasNext()) {
        	Member data = it.next();
            listNum = dataCount - (start + n - 1);
            data.setListNum(listNum);
            n++;
        }
        
        String query = "";
        String listUrl = cp+"/admin/member/list";
        if(searchValue.length()!=0) {
        	query = "searchKey=" +searchKey + 
        	         "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");	
        }
        
        if(query.length()!=0) {
        	listUrl = cp+"/admin/member/list?" + query;
        }
        
        String paging = myUtil.paging(current_page, total_page, listUrl);

        model.addAttribute("list", list);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);

        return ".admin.main.member.list";
	}

	@RequestMapping(value="/admin/member/regi")
	public String listRegister(Model model,
							HttpServletRequest req,
							@RequestParam(value="page", defaultValue="1") int current_page,
							@RequestParam(value="searchKey", defaultValue="userId") String searchKey,
							@RequestParam(value="searchValue", defaultValue="") String searchValue) throws UnsupportedEncodingException {
		
		String cp = req.getContextPath();
		int rows = 10; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
   	    
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		if(searchValue.length()!=0) {
			if(searchKey.equals("className")) {
				searchValue = searchValue.split(",")[0];
			} else {
				searchValue = searchValue.split(",")[1];
			}
		}
        // 전체 페이지 수
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("searchKey", searchKey);
        map.put("searchValue", searchValue);

        dataCount = service.countRegister(map);
        if(dataCount != 0)
            total_page = myUtil.pageCount(rows, dataCount) ;

        // 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
        if(total_page < current_page) 
            current_page = total_page;

        // 리스트에 출력할 데이터를 가져오기
        int start = (current_page - 1) * rows + 1;
        int end = current_page * rows;
        map.put("start", start);
        map.put("end", end);

        // 회원 리스트
        List<Member> list = service.registerList(map);

        // 리스트의 번호
        int listNum, n = 0;
        Iterator<Member> it=list.iterator();
        while(it.hasNext()) {
        	Member data = it.next();
            listNum = dataCount - (start + n - 1);
            data.setListNum(listNum);
            n++;
        }
        
        String query = "";
        String listUrl = cp+"/admin/member/regi";
        if(searchValue.length()!=0) {
        	query = "searchKey=" +searchKey + 
        	         "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");	
        }
        
        if(query.length()!=0) {
        	listUrl = cp+"/admin/member/regi?" + query;
        }
        
        String paging = myUtil.paging(current_page, total_page, listUrl);

        List<DietClass> dList = serviceD.listByAdmin();
        
        model.addAttribute("dList", dList);
        model.addAttribute("list", list);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
        
		return ".admin.main.member.register";
	}
	
}

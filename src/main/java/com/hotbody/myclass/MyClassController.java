package com.hotbody.myclass;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
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

import com.hotbody.common.FileManager;
import com.hotbody.common.MyUtil;

@Controller("myClass.myClassController")
public class MyClassController {
	
	@Autowired
	private MyClassService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="/myclass/diary/mydiary", method=RequestMethod.GET)
	public String mydiaryForm() throws Exception{
		return ".myclass.diary.mydiary";
	}
	
	@RequestMapping(value="/myclass/exercise/myexercise", method=RequestMethod.GET)
	public String myexerciseForm() throws Exception{
		return ".myclass.exercise.myexercise";
	}
	
	@RequestMapping(value="/myclass/message/main", method=RequestMethod.GET)
	public String messageForm() throws Exception{
		return ".myclass.message.main";
	}
	
	@RequestMapping(value="/myclass/diary/inputForm")
	public String inputForm() throws Exception{
		return "myclass/diary/inputForm";
	}
	
	@RequestMapping(value="/myclass/addexercise/list")
	public String listExercise() throws Exception{
		return ".myclass.addexercise.list";
	}
	
	
	
	// 재료관련컨트롤러
	@RequestMapping(value="/myclass/addingrerdients/list")
	public String listIngre(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="ingredientsName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
   	    
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

        dataCount = service.dataCount(map);
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

        // 글 리스트
        List<Ing> list = service.listIng(map);

        // 리스트의 번호
        int listNum, n = 0;
        Iterator<Ing> it=list.iterator();
        while(it.hasNext()) {
        	Ing data = it.next();
            listNum = dataCount - (start + n - 1);
            data.setListNum(listNum);
            n++;
        }
        
        String query = "";
        String listUrl = cp+"/myclass/addingrerdients/list";
        String articleUrl = cp+"/myclass/addingrerdients/article?page=" + current_page;
        if(searchValue.length()!=0) {
        	query = "searchKey=" +searchKey + 
        	         "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");	
        }
        
        if(query.length()!=0) {
        	listUrl = cp+"/myclass/addingrerdients/list?" + query;
        	articleUrl = cp+"/myclass/addingrerdients/article?page=" + current_page + "&"+ query;
        }
        
        String paging = myUtil.paging(current_page, total_page, listUrl);

        model.addAttribute("list", list);
        model.addAttribute("articleUrl", articleUrl);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
		
		
		
		return ".myclass.addingrerdients.list";
	}
	
	@RequestMapping(value = "/myclass/addingrerdients/created", method = RequestMethod.GET)
	public String createdForm(Model model) throws Exception {
		model.addAttribute("mode", "created");
		return ".myclass.addingrerdients.created";
	}
	
	@RequestMapping(value = "/myclass/addingrerdients/created", method = RequestMethod.POST)
	public String createdSubmit(Ing dto, HttpSession session) throws Exception {
	
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"myClass";
		
		service.insertIng(dto, pathname);
	
		return "redirect:/myclass/addingrerdients/list";
	}
	
	@RequestMapping(value="/myclass/addingrerdients/article")
	public String article(
			@RequestParam(value="num") int num,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="ingredientsName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpSession session,
			Model model) throws Exception {

		searchValue = URLDecoder.decode(searchValue, "utf-8");

		// 해당 상세정보 보여주기
		Ing dto = service.readIng(num);
		if(dto==null)
			return "redirect:/myclass/addingrerdients/list?page="+page;
		
		
        
		//이전글 다음글에 map에 값 담아서 넣기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("ingrerdientsNum", num);

		Ing preReadDto = service.preReadIng(map);
		Ing nextReadDto = service.nextReadIng(map);
        
		
		//엔터를 띄어쓰기<br>로...
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));

		
		String query = "page="+page;
		if(searchValue.length()!=0) {
			query += "&searchKey=" + searchKey + 
		                    "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}

		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);

        return ".myclass.addingrerdients.article";
	}
	
	@RequestMapping(value="/myclass/addingrerdients/update", 
			method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int num,
			@RequestParam String page,
			Model model) throws Exception {

		Ing dto = service.readIng(num);
		if(dto==null) {
			return "redirect:/myclass/addingrerdients/list?page="+page;
		}
				
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		
		return ".myclass.addingrerdients.created";
	}
	
	@RequestMapping(value="/myclass/addingrerdients/update", 
			method=RequestMethod.POST)
	public String updateSubmit(
			Ing dto, 
			@RequestParam String page,
			HttpSession session) throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "myClass";		
	
		// 수정 하기
		service.updateIng(dto, pathname);		
		
		return "redirect:/myclass/addingrerdients/list?page="+page;
	}
	
	
	@RequestMapping(value="/myclass/addingrerdients/deleteFile", 
			method=RequestMethod.GET)
	public String deleteFile(
			@RequestParam int num,
			@RequestParam String page,
			HttpSession session) throws Exception {

		Ing dto = service.readIng(num);
		
		if(dto==null) {
			return "redirect:/myclass/addingrerdients/list?page="+page;
		}
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "myClass";
		
		if(dto.getImage() != null && dto.getImage().length()!=0) {
			  fileManager.doFileDelete(dto.getImage(), pathname);
			  
			  dto.setImage("");
			  service.updateIng(dto, pathname);
       }
		
		return "redirect:/myclass/addingrerdients/update?num="+num+"&page="+page;
	}
	
	@RequestMapping(value="/myclass/addingrerdients/delete")
	public String delete(
			@RequestParam int num,
			@RequestParam String page,
			HttpSession session) throws Exception {

		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "myClass";		
 	
		service.deleteIng(num, pathname);
		
		return "redirect:/myclass/addingrerdients/list?page="+page;
	}
	
}

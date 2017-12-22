package com.hotbody.myclass;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
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

import com.hotbody.common.FileManager;
import com.hotbody.common.MyUtil;
import com.hotbody.common.dao.CommonDAO;
import com.hotbody.member.SessionInfo;

@Controller("myClass.myClassController")
public class MyClassController {
	
	@Autowired
	private CommonDAO  dao;
	
	@Autowired
	private MyClassService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	
	/*
	 * 다이어트일기 관련
	 */
	
	@RequestMapping(value="/myclass/diary/mydiary", method=RequestMethod.GET)
	public String mydiaryForm(HttpSession session, HttpServletResponse resp) throws Exception{
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		if (info == null) {
			return "redirect:/member/login";
		}
			
		Map<String, Object> map=new HashMap<>();
		map.put("userId", info.getUserId());

		int cntUser = dao.selectOne("myClass.countUser", map);
		if(cntUser == 0) {
			return "redirect:/dietClass/list?type=0";
		}
			

		return ".myclass.diary.mydiary";
	}
	
	@RequestMapping(value="/myclass/diary/inputForm")
	public String inputForm() throws Exception{
		return "myclass/diary/inputForm";
	}
	
	
	/*
	 * 오늘의운동정보 관련
	 */
	
	// 유용한정보상세보기 기능
	@RequestMapping(value="/myclass/exercise/readinfo")
	public String myinfoArticle(
			@RequestParam(value="num") int num,
			Model model) throws Exception {
		
		Information dto = service.readInfo(num);
		model.addAttribute("dto", dto);
		
		return "myclass/exercise/readinfo";
	}
	
	// 운동정보상세보기 기능
	@RequestMapping(value="/myclass/exercise/readexer")
	public String myexerArticle(
			@RequestParam(value="num") int num,
			Model model) throws Exception {
		
		Exercise dto = service.readExercise(num);
		model.addAttribute("dto", dto);

		return "myclass/exercise/readexer";
	}
	
	@RequestMapping(value="/myclass/exercise/myexercise")
	public String myexerciseForm(
			HttpSession session,
			TodayExer dto,
			HttpServletResponse resp,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="edate") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		//로그인 안되있으면 로그인창
		if (info == null) {
			return "redirect:/member/login";
		}
		
		dto.setUserId(info.getUserId());	
		int result = service.insertToday(dto);
		
		if(result == -1) {
			return "redirect:/dietClass/list?type=0";
		}
		
		String cp = req.getContextPath();
   	    
		int rows = 5; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
   	    
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("searchKey", searchKey);
        map.put("searchValue", searchValue);

        dataCount = service.dataCount4(map);
        if(dataCount != 0)
            total_page = myUtil.pageCount(rows, dataCount) ;

        if(total_page < current_page) 
            current_page = total_page;

        // 리스트에 출력할 데이터를 가져오기
        int start = (current_page - 1) * rows + 1;
        int end = current_page * rows;
        map.put("start", start);
        map.put("end", end);

        List<TodayExer> list = service.listToday(map);

        // 리스트의 번호
        int listNum, n = 0;
        Iterator<TodayExer> it=list.iterator();
        while(it.hasNext()) {
        	TodayExer data = it.next();
            listNum = dataCount - (start + n - 1);
            data.setListNum(listNum);
            n++;
        }
        
        String query = "";
        String listUrl = cp+"/myclass/exercise/myexercise";
        String articleUrl = cp+"/myclass/exercise/readexer?page=" + current_page;
        if(searchValue.length()!=0) {
        	query = "searchKey=" +searchKey + 
        	         "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");	
        }
        
        if(query.length()!=0) {
        	listUrl = cp+"/myclass/exercise/myexercise?" + query;
        	articleUrl = cp+"/myclass/exercise/readexer?page=" + current_page + "&"+ query;
        }
        
        String paging = myUtil.paging(current_page, total_page, listUrl);

        model.addAttribute("list", list);
        model.addAttribute("articleUrl", articleUrl);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
		
		
		return ".myclass.exercise.myexercise";
	}
	
	
	
	
	
	@RequestMapping(value="/myclass/message/main", method=RequestMethod.GET)
	public String messageForm() throws Exception{
		return ".myclass.message.main";
	}
	
	
	/*
	 * 유용한정보관련
	 */
	@RequestMapping(value="/myclass/addinfo/list")
	public String addInfo(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
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
		
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("searchKey", searchKey);
        map.put("searchValue", searchValue);

        dataCount = service.dataCount3(map);
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

        List<Information> list = service.listInfo(map);

        // 리스트의 번호
        int listNum, n = 0;
        Iterator<Information> it=list.iterator();
        while(it.hasNext()) {
        	Information data = it.next();
            listNum = dataCount - (start + n - 1);
            data.setListNum(listNum);
            n++;
        }
        
        String query = "";
        String listUrl = cp+"/myclass/addinfo/list";
        String articleUrl = cp+"/myclass/addinfo/article?page=" + current_page;
        if(searchValue.length()!=0) {
        	query = "searchKey=" +searchKey + 
        	         "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");	
        }
        
        if(query.length()!=0) {
        	listUrl = cp+"/myclass/addinfo/list?" + query;
        	articleUrl = cp+"/myclass/addinfo/article?page=" + current_page + "&"+ query;
        }
        
        String paging = myUtil.paging(current_page, total_page, listUrl);

        model.addAttribute("list", list);
        model.addAttribute("articleUrl", articleUrl);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
        
		return ".myclass.addinfo.list";
	}
	
	@RequestMapping(value = "/myclass/addinfo/created", method = RequestMethod.GET)
	public String infoInput(Model model) throws Exception {	
		model.addAttribute("mode", "created");

		return ".myclass.addinfo.created";
	}
	
	@RequestMapping(value = "/myclass/addinfo/created", method = RequestMethod.POST)
	public String infoSubmit(Information dto, HttpSession session) throws Exception {
	
		service.insertInfo(dto);
	
		return "redirect:/myclass/addinfo/list";
	}
	@RequestMapping(value="/myclass/addinfo/article")
	public String articleInfo(
			@RequestParam(value="num") int num,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpSession session,
			Model model) throws Exception {

		searchValue = URLDecoder.decode(searchValue, "utf-8");

		// 해당 상세정보 보여주기
		Information dto = service.readInfo(num);
		if(dto==null)
			return "redirect:/myclass/addinfo/list?page="+page;
		
		//이전글 다음글에 map에 값 담아서 넣기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("infoNum", num);

		Information preReadDto = service.preReadInfo(map);
		Information nextReadDto = service.nextReadInfo(map);
        
		
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

        return ".myclass.addinfo.article";
	}
	
	@RequestMapping(value="/myclass/addinfo/update", 
			method=RequestMethod.GET)
	public String updateFormInfo(
			@RequestParam int num,
			@RequestParam String page,
			Model model) throws Exception {
		

		Information dto = service.readInfo(num);
		if(dto==null) {
			return "redirect:/myclass/addinfo/list?page="+page;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		
		return ".myclass.addinfo.created";
	}
	
	@RequestMapping(value="/myclass/addinfo/update", 
			method=RequestMethod.POST)
	public String updateSubmitInfo(
			Information dto, 
			@RequestParam String page,
			HttpSession session) throws Exception {
	
		// 수정 하기
		service.updateInfo(dto);	
		
		return "redirect:/myclass/addinfo/list?page="+page;
	}
	
	
	
	@RequestMapping(value="/myclass/addinfo/delete")
	public String deleteInfo(
			@RequestParam int num,
			@RequestParam String page,
			HttpSession session) throws Exception {

		service.deleteInfo(num);
		
		return "redirect:/myclass/addinfo/list?page="+page;
	}
	
		
	/*
	 * 운동관련컨트롤러
	 */ 
	@RequestMapping(value="/myclass/addexercise/list")
	public String listExercise(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="exerciseName") String searchKey,
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

        dataCount = service.dataCount2(map);
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
        List<Exercise> list = service.listExercise(map);

        // 리스트의 번호
        int listNum, n = 0;
        Iterator<Exercise> it=list.iterator();
        while(it.hasNext()) {
        	Exercise data = it.next();
            listNum = dataCount - (start + n - 1);
            data.setListNum(listNum);
            n++;
        }
        
        String query = "";
        String listUrl = cp+"/myclass/addexercise/list";
        String articleUrl = cp+"/myclass/addexercise/article?page=" + current_page;
        if(searchValue.length()!=0) {
        	query = "searchKey=" +searchKey + 
        	         "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");	
        }
        
        if(query.length()!=0) {
        	listUrl = cp+"/myclass/addexercise/list?" + query;
        	articleUrl = cp+"/myclass/addexercise/article?page=" + current_page + "&"+ query;
        }
        
        String paging = myUtil.paging(current_page, total_page, listUrl);

        model.addAttribute("list", list);
        model.addAttribute("articleUrl", articleUrl);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
		
		return ".myclass.addexercise.list";
	}
	
	@RequestMapping(value = "/myclass/addexercise/created", method = RequestMethod.GET)
	public String exerciseInput(Model model) throws Exception {	
		List<ExerciseType> list = service.readExerciseType();
		
		model.addAttribute("mode", "created");
		model.addAttribute("list", list);
		return ".myclass.addexercise.created";
	}
	
	@RequestMapping(value = "/myclass/addexercise/created", method = RequestMethod.POST)
	public String exerciseSubmit(Exercise dto, HttpSession session) throws Exception {
	
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"myClass";
		
		service.insertExercise(dto, pathname);
	
		return "redirect:/myclass/addexercise/list";
	}
	@RequestMapping(value="/myclass/addexercise/article")
	public String articleExercise(
			@RequestParam(value="num") int num,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="exerciseName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpSession session,
			Model model) throws Exception {

		searchValue = URLDecoder.decode(searchValue, "utf-8");

		// 해당 상세정보 보여주기
		Exercise dto = service.readExercise(num);
		if(dto==null)
			return "redirect:/myclass/addexercise/list?page="+page;
		
		
        
		//이전글 다음글에 map에 값 담아서 넣기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("exerciseNum", num);

		Exercise preReadDto = service.preReadExercise(map);
		Exercise nextReadDto = service.nextReadExercise(map);
        
		
		//엔터를 띄어쓰기<br>로... (스마트에디터는 엔터를 띄어쓰기 안해도됨)
		//dto.setPic(dto.getPic().replaceAll("\n", "<br>"));

		
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

        return ".myclass.addexercise.article";
	}
	
	@RequestMapping(value="/myclass/addexercise/update", 
			method=RequestMethod.GET)
	public String updateFormExercise(
			@RequestParam int num,
			@RequestParam String page,
			Model model) throws Exception {
		
		List<ExerciseType> list = service.readExerciseType();
		
		Exercise dto = service.readExercise(num);
		if(dto==null) {
			return "redirect:/myclass/addexercise/list?page="+page;
		}
		
		model.addAttribute("list", list);
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		
		return ".myclass.addexercise.created";
	}
	
	@RequestMapping(value="/myclass/addexercise/update", 
			method=RequestMethod.POST)
	public String updateSubmitExercise(
			Exercise dto, 
			@RequestParam String page,
			HttpSession session) throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "myClass";		
	
		// 수정 하기
		service.updateExercise(dto, pathname);		
		
		return "redirect:/myclass/addexercise/list?page="+page;
	}
	
	
	@RequestMapping(value="/myclass/addexercise/deleteFile", 
			method=RequestMethod.GET)
	public String deleteFileExercise(
			@RequestParam int num,
			@RequestParam String page,
			HttpSession session) throws Exception {

		Exercise dto = service.readExercise(num);
		
		if(dto==null) {
			return "redirect:/myclass/addexercise/list?page="+page;
		}
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "myClass";
		
		if(dto.getVideo() != null && dto.getVideo().length()!=0) {
			  fileManager.doFileDelete(dto.getVideo(), pathname);
			  
			  dto.setVideo("");
			  service.updateExercise(dto, pathname);
       }
		
		return "redirect:/myclass/addexercise/update?num="+num+"&page="+page;
	}
	
	@RequestMapping(value="/myclass/addexercise/delete")
	public String deleteExercise(
			@RequestParam int num,
			@RequestParam String page,
			HttpSession session) throws Exception {

		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "myClass";		
 	
		service.deleteExercise(num, pathname);
		
		return "redirect:/myclass/addexercise/list?page="+page;
	}
	
	@RequestMapping(value="/myclass/addexercise/download")
	public void download(
			@RequestParam int num,
			HttpServletRequest req,
			HttpServletResponse resp,
			HttpSession session) throws Exception{
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"myClass";
		Exercise dto=service.readExercise(num);
		boolean flag=false;
		
		if(dto!=null) {
			flag=fileManager.doFileDownload(
					     dto.getVideo(), 
					     dto.getVideo(), pathname, resp);
		}
		
		if(! flag) {
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out=resp.getWriter();
			out.print("<script>alert('파일 다운로드가 실패했습니다.');history.back();</script>");
		}
	}
	
	/*
	 * 재료관련컨트롤러
	 */ 
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

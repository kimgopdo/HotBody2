package com.hotbody.dietClass;

import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
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

import com.hotbody.common.FileManager;
import com.hotbody.common.MyUtil;
import com.hotbody.member.SessionInfo;
import com.hotbody.milelage.Milelage;
import com.hotbody.milelage.MilelageService;
import com.hotbody.order.Order;
import com.hotbody.order.OrderService;

@Controller("dietClass.dietClassController")
public class DietClassController {
	DecimalFormat df = new DecimalFormat("###,###,###,###");
	
	@Autowired
	private DietClassService service;
	
	@Autowired
	private MilelageService serviceM;
	
	@Autowired
	private OrderService serviceO;
	
	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/dietClass/list")
	public String classList(HttpServletRequest req,
								@RequestParam int type) {
		Map<String, Object> map = new HashMap<>();
		map.put("classType", type);
		
		List<DietClass> list = service.listClass(map);
		
		//온라인클래스
		if(type==0) {
			for(DietClass dto: list) {
				dto.setShowTuition("￦ "+df.format(dto.getTuition())+"원");
			}
		}
		
		//오프라인클래스 
		else if(type==1) {
			String date=null;
			
			for(DietClass dto: list) {
				date = dto.getStartDate().substring(0, 4)+"년 ";
				date += dto.getStartDate().substring(4, 6)+"월 ";
				date += dto.getStartDate().substring(6, 8)+"일 ";
				dto.setStartDate(date);
				
				date = dto.getEndDate().substring(0, 4)+"년 ";
				date += dto.getEndDate().substring(4, 6)+"월 ";
				date += dto.getEndDate().substring(6, 8)+"일 ";
				dto.setEndDate(date);
				dto.setShowTuition("￦ "+df.format(dto.getTuition())+"원");
			}
		}
		
		req.setAttribute("diet", list);
		//req.setAttribute("type", type);
		
		return ".dietClass.list";
	}
	
	
	@RequestMapping(value="/dietClass/article")
	public String classArticle(@RequestParam int num,
								HttpServletRequest req,
								@RequestParam int type) {
		Map<String, Object> map = new HashMap<>();
		map.put("classNum", num);
		map.put("classType", type);
		
		DietClass dto = service.readClass(map);
		List<CProgram> list = service.readcProgram(num);
		
		dto.setShowTuition("￦ "+df.format(dto.getTuition())+"원");
		
		if(type==1) {
			String date=null;
			
			date = dto.getStartDate().substring(0, 4)+"년 ";
			date += dto.getStartDate().substring(4, 6)+"월 ";
			date += dto.getStartDate().substring(6, 8)+"일 ";
			dto.setStartDate(date);
			
			date = dto.getEndDate().substring(0, 4)+"년 ";
			date += dto.getEndDate().substring(4, 6)+"월 ";
			date += dto.getEndDate().substring(6, 8)+"일 ";
			dto.setEndDate(date);
		}
		
		req.setAttribute("dto", dto);
		req.setAttribute("cProgram", list);
		
		return ".dietClass.article";
	}
	
	@RequestMapping(value="dietClass/update")
	public String classUpdate(HttpServletRequest req,
							@RequestParam int num,
							@RequestParam int type) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("classNum", num);
		map.put("classType", type);
		
		DietClass dto = service.readClass(map);
		//전체 프로그램 리스트
		List<CProgram> list = service.listcProgram();
		//내가 기존에 선택했던 프로그램 리스트
		List<CProgram> select = service.readcProgram(num);
		//내가 기존에 선택하지 않았던 프로그램 리스트
		List<CProgram> nonselect = new ArrayList<>();
		
		int index=0;
		for(CProgram dto2 : list) {
			for(CProgram dto3 : select) {
				if(dto2.getProgramNum()==dto3.getProgramNum()) {
					index++;
				}
			}
			if(index==0)
				nonselect.add(dto2);
			index=0;
		}
		
		dto.setShowTuition("￦ "+df.format(dto.getTuition())+"원");
		
		req.setAttribute("dto", dto);
		req.setAttribute("nonselect", nonselect);
		req.setAttribute("select", select);
		req.setAttribute("mode", "update");
		
		return ".dietClass.created";
	}
	
	@RequestMapping(value="/dietClass/updateSubmit")
	@ResponseBody
	public Map<String, Object> updateSubmit(DietClass dto,
											HttpSession session) {
		Map<String, Object> model = new HashMap<>();
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root+File.separator+"uploads"+File.separator+"dietClass";
		
		service.updateClass(dto,pathname);
		model.put("state", "true");
		model.put("type", dto.getClassType());
		
		return model;
	}
	
	@RequestMapping(value="/dietClass/deleteFile")
	public String deleteFile(@RequestParam int num,
								@RequestParam int type,
								HttpSession session) {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root+File.separator+"uploads"+File.separator+"dietClass";
		
		Map<String, Object> map = new HashMap<>();
		map.put("classNum", num);
		map.put("classType", type);
		
		DietClass dto = service.readClass(map);
		try {
			if(dto.getSaveFileName()!=null)
				fileManager.doFileDelete(dto.getSaveFileName(), pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		dto.setSaveFileName("");
		dto.setOriginalFileName("");
		
		service.updateClass(dto,pathname);
		
		return "redirect:/dietClass/update?num="+num;
	}
	
	@RequestMapping(value="/dietClass/deleteClass")
	@ResponseBody
	public Map<String, Object> deleteClass(HttpSession session,
											@RequestParam int num,
											@RequestParam int type) {
		
		Map<String, Object> model = new HashMap<>();
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root+File.separator+"uploads"+File.separator+"dietClass";
		
		Map<String, Object> map = new HashMap<>();
		map.put("classNum", num);
		map.put("classType", type);
		
		service.deleteClass(map, pathname);
		model.put("state", "true");
		return model;
	}
	
	@RequestMapping(value="/dietClass/payment")
	public String classPayment(HttpSession session,
								HttpServletRequest req,
								@RequestParam int num,
								@RequestParam int type) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login";
		}
		Milelage mdto = serviceM.selectMilelage(info.getUserId());
		
		int milelage = mdto.getUseableMilelage();
		req.setAttribute("milelage", milelage);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("classNum", num);
		map.put("classType", type);
		
		DietClass dto = service.readClass(map);
		
		dto.setShowTuition("￦ "+df.format(dto.getTuition())+"원");
		
		dto.setPoint((int)(dto.getTuition()*0.01));
		
		req.setAttribute("dto", dto);
		
		
		return ".dietClass.payment";
	}
	
	@RequestMapping(value="dietClass/paymentSubmit")
	@ResponseBody
	public Map<String, Object> paymentSubmit(@RequestParam int payType,
											@RequestParam(defaultValue="off") String payPoint,
											@RequestParam(defaultValue="0") int useMilelage,
											Order odto,
											HttpSession session){
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		odto.setAmount(1);
		odto.setMilelagePay(useMilelage);
		odto.setUserId(info.getUserId());
		
		serviceO.insertOrder(odto);
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", "true");
		
		return model;
	}
	
	/*
	 * 클래스 프로그램 관련
	 */
	
	@RequestMapping(value="/cprogram/created")
	public String cprogramCreated(Model model) {
		model.addAttribute("mode", "created");
		return ".dietClass.classProgram.created";
	}
	
	@RequestMapping(value="/cprogram/update")
	public String cprogramUpdate(@RequestParam int num,
									Model model){
		
		CProgram dto = service.readProgramInfo(num);
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		
		return ".dietClass.classProgram.created";
	}
	
	@RequestMapping(value="/cprogram/updateOk")
	@ResponseBody
	public Map<String, Object> cprogramUpdateOk(CProgram dto,
												HttpSession session){
		Map<String, Object> model = new HashMap<>();
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root+File.separator+"uploads"+File.separator+"dietClass";
		
		service.updatecProgram(dto,pathname);
		model.put("state", "true");
		return model;
	}
	
	@RequestMapping(value="/cprogram/list")
	public String cprogramList(
			@RequestParam(value="page", defaultValue="1") int currentPage,
			Model model) {
		int dataCount;
		int totalPage;
		
		dataCount = service.programCount();
		totalPage = myUtil.pageCount(10, dataCount);
		
		if(totalPage<currentPage)
			currentPage=totalPage;
		
		int start = (currentPage-1)*10+1;
		int end = (currentPage)*10;
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		List<CProgram> list = service.listcProgram(map);

		String paging = myUtil.paging(currentPage, totalPage);
		
		model.addAttribute("list",list);
		model.addAttribute("paging", paging);
		model.addAttribute("dataCount", dataCount);
		
		return ".dietClass.classProgram.list";
	}
	
	@RequestMapping(value="/cprogram/insert")
	@ResponseBody
	public Map<String, Object> insertcProgram(CProgram dto,
										HttpSession session,
										HttpServletRequest req){
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"cProgram";
		
		service.insertcProgram(dto, pathname);
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", "true");
		
		return model;
	}
	
	@RequestMapping(value="/cprogram/delete")
	@ResponseBody
	public Map<String, Object> deletecProgram(@RequestParam int num,
												HttpSession session){
		Map<String, Object> model = new HashMap<>();
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"cProgram";
		
		service.deletecProgram(num,pathname);
		
		model.put("state", "true");
		return model;
	}
	
	@RequestMapping(value="/cprogram/deleteFile")
	public String deletecFile(@RequestParam int num,
								HttpSession session) {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root+File.separator+"uploads"+File.separator+"dietClass";
		
		CProgram dto = service.readProgramInfo(num);
		try {
			if(dto.getSaveFileName()!=null)
				fileManager.doFileDelete(dto.getSaveFileName(), pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		dto.setSaveFileName("");
		dto.setOriginalFileName("");
		
		service.updatecProgram(dto, pathname);
		
		return "redirect:/cprogram/update?num="+num;
	}
	
	/*
	 * 미션 관련
	 */

	@RequestMapping(value="/mission/article", method=RequestMethod.GET)
	public String article(Model model,
			@RequestParam(value="page", defaultValue="1") int current_page,
			HttpServletRequest req,
			@RequestParam int num) {
		Map<String, Object> map = new HashMap<>();
		map.put("classNum", num);
		map.put("classType", 0);
		DietClass dto = service.readClass(map);
		
		int day[] = new int[dto.getOnperiod()];
		String max="";
		
		int dataCount = dto.getOnperiod();
		int rows = 10;
		int total_page = 0;
		
		if(dataCount !=0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		if(total_page<current_page)
			current_page=total_page;
		
		int start = (current_page-1)*rows+1;
		int end = current_page*rows;
		if(end>dto.getOnperiod())
			end = dto.getOnperiod();
		
		List<List<Mission>> list = new ArrayList<>();
		for(int a=start;a<=end;a++) {
			day[a-1] = a;
			map.put("missDay", a);
			List<Mission> list2 = service.readMission(map);
			max += list2.size()+",";
			
			if(list2.size()==0) {
				Mission mdto = new Mission();
				mdto.setMissionContent(null);
				mdto.setMissDay(a);
				list2.add(mdto);
			}
			list.add(list2);
		}

		String cp = req.getContextPath();
		String listUrl = cp+"/mission/article?num="+num;
		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("paging", paging);
		model.addAttribute("max", max);
		model.addAttribute("list", list);
		model.addAttribute("day", day);
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		
		return ".dietClass.mission.article";
	}

	@RequestMapping(value="/mission/update", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateSubmit(@RequestParam Map<String, String> dataMap){
		
		Mission mdto = new Mission();
		int classNum = Integer.parseInt(dataMap.get("classNum"));
		
		Map<String, Object> model = new HashMap<>();
		model.put("classNum", classNum);
		model.put("classType", 0);
		DietClass dto = service.readClass(model);
		mdto.setClassNum(classNum);
		
		for(int a=1;a<=dto.getOnperiod();a++) {
			for(Map.Entry<String, String> entry : dataMap.entrySet()) {
				if(entry.getKey().contains("mission."+a+".")) {
					String lastIndex = entry.getKey().substring(entry.getKey().lastIndexOf(".")+1, entry.getKey().length());
					mdto.setMissIndex(Integer.parseInt(lastIndex));
					mdto.setMissDay(a);
					mdto.setMissionContent(entry.getValue());
					
					int count = service.haveMission(mdto);
					if(count==0 && mdto.getMissionContent()!="")
						service.insertMission(mdto);
					else if(count==0 && mdto.getMissionContent()=="") {
						Map<String, Object> deleteMap = new HashMap<>();
						deleteMap.put("missIndex", mdto.getMissIndex());
						deleteMap.put("missDay", mdto.getMissDay());
						deleteMap.put("classNum", classNum);
						service.deleteMission(deleteMap);
					}
					else 
						service.updateMission(mdto);
				}
			}
		}
		model.put("state", "true");
		return model;
	}
	
	@RequestMapping(value="/mission/delete")
	public String deleteMission(@RequestParam int num,
								@RequestParam int index,
								@RequestParam int day) {
		System.out.println(num+":"+index+":"+day);
		Map<String, Object> map = new HashMap<>();
		map.put("classNum", num);
		map.put("missDay", day);
		map.put("missIndex", index);
		service.deleteMission(map);
		
		return "redirect:/mission/article?num="+num;
	}
	
}

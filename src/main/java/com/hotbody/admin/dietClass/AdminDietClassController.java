package com.hotbody.admin.dietClass;

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
import com.hotbody.dietClass.CProgram;
import com.hotbody.dietClass.DietClass;
import com.hotbody.dietClass.DietClassService;
import com.hotbody.dietClass.Mission;

@Controller("adminDietClass.adminDietClassController")
public class AdminDietClassController {
	DecimalFormat df = new DecimalFormat("###,###,###,###");
	
	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private DietClassService serviceD;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/admin/dietClass/list")
	public String adminDietClassList(Model model) {
		List<DietClass> list = serviceD.listByAdmin();
		int count = serviceD.countClass();
		
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		return ".admin.main.dietClass.list";
	}
	
	@RequestMapping(value="/admin/dietClass/created")
	public String classCreated(Model model) {
		
		List<CProgram> list = serviceD.listcProgram();
		model.addAttribute("cProgram", list);
		model.addAttribute("mode", "created");
		
		return ".admin.main.dietClass.created";
	}
	
	@RequestMapping(value="/admin/dietClass/insert")
	@ResponseBody
	public Map<String, Object> insertdietClass(DietClass dto,
										HttpSession session){
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"dietClass";
		
		serviceD.insertDietClass(dto,pathname);
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", "true");
		
		return model;
	}
	
	@RequestMapping(value="/admin/dietClass/update")
	public String classUpdate(HttpServletRequest req,
							@RequestParam int num,
							@RequestParam int type) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("classNum", num);
		map.put("classType", type);
		
		DietClass dto = serviceD.readClass(map);
		//전체 프로그램 리스트
		List<CProgram> list = serviceD.listcProgram();
		//내가 기존에 선택했던 프로그램 리스트
		List<CProgram> select = serviceD.readcProgram(num);
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
		
		return ".admin.main.dietClass.created";
	}
	
	@RequestMapping(value="/admin/dietClass/updateSubmit")
	@ResponseBody
	public Map<String, Object> updateSubmit(DietClass dto,
											HttpSession session) {
		Map<String, Object> model = new HashMap<>();
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root+File.separator+"uploads"+File.separator+"dietClass";
		
		serviceD.deletepinClass(dto.getClassNum());
		serviceD.updateClass(dto,pathname);
		model.put("state", "true");
		model.put("type", dto.getClassType());
		return model;
	}
	
	@RequestMapping(value="/admin/dietClass/deleteClass")
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
		
		serviceD.deleteClass(map, pathname);
		model.put("state", "true");
		return model;
	}
	
	@RequestMapping(value="/admin/dietClass/article")
	public String classArticle(@RequestParam int num,
								HttpServletRequest req,
								@RequestParam int type) {
		Map<String, Object> map = new HashMap<>();
		map.put("classNum", num);
		map.put("classType", type);
		
		DietClass dto = serviceD.readClass(map);
		List<CProgram> list = serviceD.readcProgram(num);
		
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
		
		return ".admin.main.dietClass.article";
	}
	
	@RequestMapping(value="/admin/dietClass/deleteFile")
	public String deleteFile(@RequestParam int num,
								@RequestParam int type,
								HttpSession session) {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root+File.separator+"uploads"+File.separator+"dietClass";
		
		Map<String, Object> map = new HashMap<>();
		map.put("classNum", num);
		map.put("classType", type);
		
		DietClass dto = serviceD.readClass(map);
		try {
			if(dto.getSaveFileName()!=null)
				fileManager.doFileDelete(dto.getSaveFileName(), pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		dto.setSaveFileName("");
		dto.setOriginalFileName("");
		
		serviceD.updateClass(dto,pathname);
		
		return "redirect:/admin/dietClass/update?num="+num;
	}
	
	/*
	 * 클래스 프로그램 관련
	 */
	
	@RequestMapping(value="/admin/cprogram/created")
	public String cprogramCreated(Model model) {
		model.addAttribute("mode", "created");
		return ".admin.main.classProgram.created";
	}
	
	@RequestMapping(value="/admin/cprogram/update")
	public String cprogramUpdate(@RequestParam int num,
									Model model){
		
		CProgram dto = serviceD.readProgramInfo(num);
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		
		return ".admin.main.classProgram.created";
	}
	
	@RequestMapping(value="/admin/cprogram/updateOk")
	@ResponseBody
	public Map<String, Object> cprogramUpdateOk(CProgram dto,
												HttpSession session){
		Map<String, Object> model = new HashMap<>();
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root+File.separator+"uploads"+File.separator+"dietClass";
		
		serviceD.updatecProgram(dto,pathname);
		model.put("state", "true");
		return model;
	}
	
	@RequestMapping(value="/admin/cprogram/list")
	public String cprogramList(
			@RequestParam(value="page", defaultValue="1") int currentPage,
			Model model) {
		int dataCount;
		int totalPage;
		
		dataCount = serviceD.programCount();
		totalPage = myUtil.pageCount(10, dataCount);
		
		if(totalPage<currentPage)
			currentPage=totalPage;
		
		int start = (currentPage-1)*10+1;
		int end = (currentPage)*10;
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		List<CProgram> list = serviceD.listcProgram(map);

		String paging = myUtil.paging(currentPage, totalPage);
		
		model.addAttribute("list",list);
		model.addAttribute("paging", paging);
		model.addAttribute("dataCount", dataCount);
		
		return ".admin.main.classProgram.list";
	}
	
	@RequestMapping(value="/admin/cprogram/insert")
	@ResponseBody
	public Map<String, Object> insertcProgram(CProgram dto,
										HttpSession session,
										HttpServletRequest req){
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"cProgram";
		
		serviceD.insertcProgram(dto, pathname);
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", "true");
		
		return model;
	}
	
	@RequestMapping(value="/admin/cprogram/delete")
	@ResponseBody
	public Map<String, Object> deletecProgram(@RequestParam int num,
												HttpSession session){
		Map<String, Object> model = new HashMap<>();
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"cProgram";
		
		serviceD.deletecProgram(num,pathname);
		
		model.put("state", "true");
		return model;
	}
	
	@RequestMapping(value="/admin/cprogram/deleteFile")
	public String deletecFile(@RequestParam int num,
								HttpSession session) {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root+File.separator+"uploads"+File.separator+"dietClass";
		
		CProgram dto = serviceD.readProgramInfo(num);
		try {
			if(dto.getSaveFileName()!=null)
				fileManager.doFileDelete(dto.getSaveFileName(), pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		dto.setSaveFileName("");
		dto.setOriginalFileName("");
		
		serviceD.updatecProgram(dto, pathname);
		
		return "redirect:/admin/cprogram/update?num="+num;
	}
	
	/*
	 * 미션 관련
	 */

	@RequestMapping(value="/admin/mission/list")
	public String onClassList(Model model) {
		Map<String, Object> map = new HashMap<>();
		map.put("classType", 0);
		
		List<DietClass> list = serviceD.listClass(map);
		
		model.addAttribute("list", list);
		return ".admin.main.mission.list";
	}
	
	@RequestMapping(value="/admin/mission/article", method=RequestMethod.GET)
	public String article(Model model,
			@RequestParam(value="page", defaultValue="1") int current_page,
			HttpServletRequest req,
			@RequestParam int num) {
		Map<String, Object> map = new HashMap<>();
		map.put("classNum", num);
		map.put("classType", 0);
		DietClass dto = serviceD.readClass(map);
		
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
			List<Mission> list2 = serviceD.readMission(map);
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
		String listUrl = cp+"/admin/mission/article?num="+num;
		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("paging", paging);
		model.addAttribute("max", max);
		model.addAttribute("list", list);
		model.addAttribute("day", day);
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		
		return ".admin.main.mission.article";
	}

	@RequestMapping(value="/admin/mission/update", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateSubmit(@RequestParam Map<String, String> dataMap){
		
		Mission mdto = new Mission();
		int classNum = Integer.parseInt(dataMap.get("classNum"));
		
		Map<String, Object> model = new HashMap<>();
		model.put("classNum", classNum);
		model.put("classType", 0);
		DietClass dto = serviceD.readClass(model);
		mdto.setClassNum(classNum);
		
		for(int a=1;a<=dto.getOnperiod();a++) {
			for(Map.Entry<String, String> entry : dataMap.entrySet()) {
				if(entry.getKey().contains("mission."+a+".")) {
					String lastIndex = entry.getKey().substring(entry.getKey().lastIndexOf(".")+1, entry.getKey().length());
					mdto.setMissIndex(Integer.parseInt(lastIndex));
					mdto.setMissDay(a);
					mdto.setMissionContent(entry.getValue());
					
					int count = serviceD.haveMission(mdto);
					if(count==0 && mdto.getMissionContent()!="")
						serviceD.insertMission(mdto);
					else if(count==0 && mdto.getMissionContent()=="") {
						Map<String, Object> deleteMap = new HashMap<>();
						deleteMap.put("missIndex", mdto.getMissIndex());
						deleteMap.put("missDay", mdto.getMissDay());
						deleteMap.put("classNum", classNum);
						serviceD.deleteMission(deleteMap);
					}
					else 
						serviceD.updateMission(mdto);
				}
			}
		}
		model.put("state", "true");
		return model;
	}
	
	@RequestMapping(value="/admin/mission/delete")
	public String deleteMission(@RequestParam int num,
								@RequestParam int index,
								@RequestParam int day) {
		System.out.println(num+":"+index+":"+day);
		Map<String, Object> map = new HashMap<>();
		map.put("classNum", num);
		map.put("missDay", day);
		map.put("missIndex", index);
		serviceD.deleteMission(map);
		
		return "redirect:/admin/mission/article?num="+num;
	}
	
	@RequestMapping(value="/admin/member/register")
	public String listRegister() {
		return ".admin.main.member.list";
	}
}

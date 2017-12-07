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
import org.springframework.remoting.httpinvoker.HttpInvokerServiceExporter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotbody.common.FileManager;

@Controller("dietClass.dietClassController")
public class DietClassController {
	DecimalFormat df = new DecimalFormat("###,###,###,###");
	
	@Autowired
	private DietClassService service;
	
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="/dietClass/onList")
	public String classList(HttpServletRequest req) {
		
		List<DietClass> list = service.listOnClass();
		
		for(DietClass dto: list) {
			dto.setShowTuition("￦ "+df.format(dto.getTuition())+"원");
		}
		
		req.setAttribute("onClass", list);
		
		return ".dietClass.list";
	}
	
	@RequestMapping(value="/dietClass/offList")
	public String offclassList(HttpServletRequest req) {
		DecimalFormat df = new DecimalFormat("###,###,###,###");
		String date=null;
		List<DietClass> list = service.listOffClass();
		
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
		
		req.setAttribute("offClass", list);
		
		return ".dietClass.offList";
	}
	
	@RequestMapping(value="dietClass/created")
	public String classCreated(HttpServletRequest req) {
		
		List<CProgram> list = service.listcProgram();
		req.setAttribute("cProgram", list);
		req.setAttribute("mode", "created");
		
		return ".dietClass.created";
	}
	
	@RequestMapping(value="/dietClass/insert")
	@ResponseBody
	public Map<String, Object> insertdietClass(DietClass dto,
										HttpSession session){
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"dietClass";
		
		service.insertDietClass(dto,pathname);
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", "true");
		
		return model;
	}
	
	@RequestMapping(value="/dietClass/articleOn")
	public String classArticle(@RequestParam int num,
								HttpServletRequest req) {
		DietClass dto = service.readOnClass(num);
		List<CProgram> list = service.readcProgram(num);
		
		dto.setShowTuition("￦ "+df.format(dto.getTuition())+"원");
		
		req.setAttribute("dto", dto);
		req.setAttribute("cProgram", list);
		
		return ".dietClass.article";
	}
	
	@RequestMapping(value="dietClass/update")
	public String classUpdate(HttpServletRequest req,
							@RequestParam int num) {
		
		DietClass dto = service.readOnClass(num);
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
		String pathname = root+File.separator+"uploads"+File.separator+"notice";
		
		service.updateClass(dto,pathname);
		model.put("state", "true");

		return model;
	}
	
	@RequestMapping(value="/dietClass/deleteFile")
	public String deleteFile(@RequestParam int num,
								HttpSession session) {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root+File.separator+"uploads"+File.separator+"dietClass";
		
		DietClass dto = service.readClass(num);
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
	public Map<String, Object> deleteClass(HttpSession session,
											@RequestParam int num) {
		
		Map<String, Object> model = new HashMap<>();
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root+File.separator+"uploads"+File.separator+"dietClass";
		
		service.deleteClass(num, pathname);
		model.put("state", "true");
		return model;
	}
	
	@RequestMapping(value="/dietClass/payment")
	public String classPayment() {
		return ".dietClass.payment";
	}
	
	@RequestMapping(value="dietClass/survey")
	public String classSurvey() {
		return "dietClass/surveyForm";
	}
	
	
	/*
	 * 클래스 프로그램 관련
	 */
	
	@RequestMapping(value="/cprogram/created")
	public String cprogramCreated() {
		return ".dietClass.classProgram.created";
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
	
}

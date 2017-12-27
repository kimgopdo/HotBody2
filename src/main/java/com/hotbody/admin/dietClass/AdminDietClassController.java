package com.hotbody.admin.dietClass;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotbody.dietClass.CProgram;
import com.hotbody.dietClass.DietClass;
import com.hotbody.dietClass.DietClassService;

@Controller("adminDietClass.adminDietClassController")
public class AdminDietClassController {
	
	@Autowired
	DietClassService serviceD;
	
	@RequestMapping(value="/admin/dietClass/list")
	public String adminDietClassList(Model model) {
		List<DietClass> list = serviceD.listByAdmin();
		model.addAttribute("list", list);
		
		return ".admin.main.dietClass.list";
	}
	
	@RequestMapping(value="/admin/dietClass/created")
	public String classCreated(HttpServletRequest req) {
		
		List<CProgram> list = serviceD.listcProgram();
		req.setAttribute("cProgram", list);
		req.setAttribute("mode", "created");
		
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
	
}

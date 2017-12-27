package com.hotbody.admin.dietClass;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		return ".admin.dietClass.list";
	}
}

package com.hotbody.myclass;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MyClassController {	
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
	public String listIngre() throws Exception{
		return ".myclass.addingrerdients.list";
	}
	
	@RequestMapping(value = "/myclass/addingrerdients/created", method = RequestMethod.GET)
	public String createdForm(Model model) throws Exception {
		model.addAttribute("mode", "created");
		return ".myclass.addingrerdients.created";
	}
	
	
	
}

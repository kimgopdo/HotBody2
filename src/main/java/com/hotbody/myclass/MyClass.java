package com.hotbody.myclass;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MyClass {	
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
	
	@RequestMapping(value="/myclass/diary/inputForm", method=RequestMethod.GET)
	public String inputForm() throws Exception{
		return ".myclass.diary.inputForm";
	}
}

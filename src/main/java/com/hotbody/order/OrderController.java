package com.hotbody.order;

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


import com.hotbody.common.MyUtil;
import com.hotbody.member.SessionInfo;



@Controller("orderController")
public class OrderController {

	@Autowired
	private OrderService service;
	@Autowired
	private MyUtil myUtil;

	


}

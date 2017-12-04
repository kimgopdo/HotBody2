package com.hotbody.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("orderController")
public class OrderController {
	
	public String oderMain() throws Exception{
		return ".shopLayout";
	}
	
	@RequestMapping(value="/order/orderList",method=RequestMethod.GET)
	public String orderForm() throws Exception{
		
		return ".order.orderList";
		
	}
	
	@RequestMapping(value="/order/cancelList",method=RequestMethod.GET)
	public String cancelForm() throws Exception{
		
		return ".order.cancelList";
		
	}
	
	@RequestMapping(value="/mileage/mileageList",method=RequestMethod.GET)
	public String mileageForm() throws Exception{
		
		return ".mileage.mileageList";
		
	}

}

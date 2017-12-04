package com.hotbody.hotShop.payment;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("hotShop.payment")
public class PaymentController {
	
	@RequestMapping(value="/hotShop/payment")
	public String paymentForm() {
		return ".hotShop.payPage";
	}
}

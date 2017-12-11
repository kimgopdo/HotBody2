package com.hotbody.order;

import java.util.List;
import java.util.Map;

public interface OrderService {
	public List<Order> listOrder(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public int insertOrder(Order dto);

}

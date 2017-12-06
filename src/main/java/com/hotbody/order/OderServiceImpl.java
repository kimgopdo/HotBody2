package com.hotbody.order;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotbody.common.FileManager;
import com.hotbody.common.dao.CommonDAO;
@Service("order.orderService")
public class OderServiceImpl implements OrderService {
	
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public List<Order> listOrder(Map<String, Object> map) {

		List<Order> list =null;
		try {
			list=dao.selectList("order.listOrder",map);
			
		} catch (Exception e) {
			System.out.println(e.toString());
			
			
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("order.dataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}

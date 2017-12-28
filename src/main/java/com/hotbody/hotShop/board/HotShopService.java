package com.hotbody.hotShop.board;

import java.util.List;
import java.util.Map;

import com.hotbody.hotShop.qna.Qna;
import com.hotbody.hotShop.review.Review;

public interface HotShopService {
	public int insertProductList(HotShop dto, String pathname);
	public List<HotShop> productList(Map<String, Object> map);
	public HotShop productArticle(Map<String, Object> map);
	public List<Qna> productArticle_QnA(Map<String, Object> map);
	public List<Review> productArticle_Review(Map<String, Object> map);
	public int productUpdate(HotShop dto, String pathname);
	public int insertSchedule(Schedule dto);
	public List<Schedule> readSchedules();
	public List<Supply> readSupply();
	public int insertProductIn(ProductIn dto);
	public List<ProductIn> readProductIn(Map<String, Object> map);
	public int dataCount();
	public int dataCount_qna(Map<String, Object> map);
	public int dataCount_review(Map<String, Object> map);
	public int productHitCount(int pdnum);
	public int insertPayment(Payment dto);
	public int readDelOrder(String userId);
	public List<Payment> readDelOrderProduct(int oderNum);
	public int insertBcl(Map<String, Object> map);
	public int insertSci(Map<String, Object> map);
	public int deleteBcl(int code);
	public int deleteSci(int code);
	public int productDataCount(Map<String, Object> map);
	public int hide(int code);
	public int show(int code);
	public int insertProductDis(ProductDis dto);
	public int productDisDataCount();
	public List<ProductDis> readProductDis(Map<String, Object> map);
	public int readPdRawPrice(Map<String, Object> map);
	public List<Chart> readRealChart(String checkDate);
}

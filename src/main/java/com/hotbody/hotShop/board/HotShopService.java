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
	int readDelOrder(String userId);
	List<Payment> readDelOrderProduct(int oderNum);
}

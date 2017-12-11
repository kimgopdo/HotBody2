package com.hotbody.order;

public class Order {
	
	private String payDate,imgSaveFileName,pdBoardName,delState;
	private int delOrder,amount,totalPay,rnum;
	
	private String cartDate, userId;
	private int milelagePay, cartOrder, classNum, pdNum, milelage;
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getImgSaveFileName() {
		return imgSaveFileName;
	}
	public void setImgSaveFileName(String imgSaveFileName) {
		this.imgSaveFileName = imgSaveFileName;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}

	public String getPdBoardName() {
		return pdBoardName;
	}
	public void setPdBoardName(String pdBoardName) {
		this.pdBoardName = pdBoardName;
	}
	public String getDelState() {
		return delState;
	}
	public void setDelState(String delState) {
		this.delState = delState;
	}
	public int getDelOrder() {
		return delOrder;
	}
	public void setDelOrder(int delOrder) {
		this.delOrder = delOrder;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getTotalPay() {
		return totalPay;
	}
	public void setTotalPay(int totalPay) {
		this.totalPay = totalPay;
	}
	public String getCartDate() {
		return cartDate;
	}
	public void setCartDate(String cartDate) {
		this.cartDate = cartDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getMilelagePay() {
		return milelagePay;
	}
	public void setMilelagePay(int milelagePay) {
		this.milelagePay = milelagePay;
	}
	public int getCartOrder() {
		return cartOrder;
	}
	public void setCartOrder(int cartOrder) {
		this.cartOrder = cartOrder;
	}
	public int getClassNum() {
		return classNum;
	}
	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}
	public int getPdNum() {
		return pdNum;
	}
	public void setPdNum(int pdNum) {
		this.pdNum = pdNum;
	}
	public int getMilelage() {
		return milelage;
	}
	public void setMilelage(int milelage) {
		this.milelage = milelage;
	}
	
	
	

}

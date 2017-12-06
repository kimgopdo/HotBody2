package com.hotbody.order;

public class Order {
	
	private String payDate,img,pdBoardName,delState;
	private int delOrder,amount,totalPay;
	
	
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
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
	
	
	

}

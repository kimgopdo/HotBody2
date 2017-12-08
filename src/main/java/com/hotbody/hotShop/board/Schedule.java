package com.hotbody.hotShop.board;

public class Schedule {
	private int sdcode;
	private String sdname;
	private String startdate;
	private String enddate;
	private String starttime;
	private String endtime;
	private String color;
	
	
	public int getSdcode() {
		return sdcode;
	}
	public void setSdcode(int sdcode) {
		this.sdcode = sdcode;
	}
	public String getSdname() {
		return sdname;
	}
	public void setSdname(String sdname) {
		this.sdname = sdname;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	
	
}

package com.hotbody.myclass;

//유용한정보
public class Information {	
	private int infoNum, ListNum; // 정보코드,가짜리스트번호
	private String subject, content; // 정보제목,정보내용

	
	
	public int getListNum() {
		return ListNum;
	}

	public void setListNum(int listNum) {
		ListNum = listNum;
	}

	public int getInfoNum() {
		return infoNum;
	}

	public void setInfoNum(int infoNum) {
		this.infoNum = infoNum;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}

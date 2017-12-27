package com.hotbody.qna2;

	public class Qna2 {
		private int listNum, qna2Code;
		private int groupNum, depth, orderNo, parent, HitCount;
		private String userId, subject, content, created;
//		private String saveFile, originalFile;
//		private long fileSize;
		
		public int getListNum() {
			return listNum;
		}
		public int getHitCount() {
			return HitCount;
		}
		public void setHitCount(int hitCount) {
			this.HitCount = hitCount;
		}
		public void setListNum(int listNum) {
			this.listNum = listNum;
		}
		public int getQna2Code() {
			return qna2Code;
		}
		public void setQna2Code(int qna2Code) {
			this.qna2Code = qna2Code;
		}
		public int getGroupNum() {
			return groupNum;
		}
		public void setGroupNum(int groupNum) {
			this.groupNum = groupNum;
		}
		public int getDepth() {
			return depth;
		}
		public void setDepth(int depth) {
			this.depth = depth;
		}
		public int getOrderNo() {
			return orderNo;
		}
		public void setOrderNo(int orderNo) {
			this.orderNo = orderNo;
		}
		public int getParent() {
			return parent;
		}
		public void setParent(int parent) {
			this.parent = parent;
		}
		
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
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
		public String getCreated() {
			return created;
		}
		public void setCreated(String created) {
			this.created = created;
		}
		
		
		
	//qnaCode NUMBER NOT NULL
	//userId VARCHAR2(50) NOT NULL
	//subject  VARCHAR2(255) NOT NULL
	//content  CLOB NOT NULL
	//groupNum NUMBER NOT NULL
	//depth    NUMBER(9) NOT NULL
	//orderNo  NUMBER(9) NOT NULL
	//parent   NUMBER NOT NULL
	//hitCount NUMBER DEFAULT 0
	//created  DATE DEFAULT SYSDATE
	//saveFile VARCHAR2(50) NOT NULL 
	//originalFile VARCHAR2(50) NOT NULL

	
}

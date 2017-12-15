package com.hotbody.notice;

import org.springframework.web.multipart.MultipartFile;

public class Notice {
	private int listNum, noticeCode;
	private int hitCount, notice;
	private long fileSize;
	private String userId, userName, subject, content, created;
	private String saveFile, originalFile;
	private int replyCount;
	
	
	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public int getNotice() {
		return notice;
	}

	public void setNotice(int notice) {
		this.notice = notice;
	}

	private MultipartFile upload;

	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public int getNoticeCode() {
		return noticeCode;
	}

	public void setNoticeCode(int noticeCode) {
		this.noticeCode = noticeCode;
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

	public String getSaveFile() {
		return saveFile;
	}

	public void setSaveFile(String saveFile) {
		this.saveFile = saveFile;
	}

	public String getOriginalFile() {
		return originalFile;
	}

	public void setOriginalFile(String originalFile) {
		this.originalFile = originalFile;
	}

	public int getHitCount() {
		return hitCount;
	}

	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	

	
}

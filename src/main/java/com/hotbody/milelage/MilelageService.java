package com.hotbody.milelage;

import java.util.List;
import java.util.Map;

public interface MilelageService {

	public Milelage selectMilelage(String userId);
	public List<Milelage> listMilelage(Map<String, Object> map);
	public List<Message> listMessage(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public int checkUserId2(String userId2);
	
	
	public int writeMessage(Message dto, String pathname);
	public int insertFile(Message dto);
	public List<Message> listFile(int num);
	public Message readFile(int fileNum);
	public Message readingMessage(int mCode);
	public int deleteFile(Map<String, Object> map);
	public int mDataCount(Map<String, Object> map);
	public int fileCount(int mCode);
}

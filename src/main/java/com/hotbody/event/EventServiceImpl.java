package com.hotbody.event;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotbody.common.FileManager;
import com.hotbody.common.dao.CommonDAO;

@Service("event.eventService")
public class EventServiceImpl implements EventService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	private String pathname;
	
	@Override
	public int insertEvent(Event dto, String pathname) {
		int result=0;
		try {
			if (dto.getUpload() !=null && !dto.getUpload().isEmpty()) {
				String saveFile = fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setSaveFile(saveFile);
				dto.setOriginalFile(dto.getUpload().getOriginalFilename());		
			}
			
			result=dao.insertData("event.insertEvent", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Event> listEvent(Map<String, Object> map) {
		List<Event> list=null;
		
		try {
			list=dao.selectList("event.listEvent", map);
			
		} catch (Exception e) {		
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("event.dataCount", map);
		} catch (Exception e) {			
		}
		return result;
	}

	@Override
	public Event readEvent(int eventCode) {
		Event dto=null;
		
		try {		
			//게시물 가져오기
			dto=dao.selectOne("event.readEvent", eventCode);
		} catch (Exception e) {		
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateHitCount(int eventCode) {
		int result = 0;
		
		try {
			result=dao.updateData("event.updateHitCount", eventCode);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Event preReadEvent(Map<String, Object> map) {
		Event dto=null;
		
		try {
			dto=dao.selectOne("event.preReadEvent", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public Event nextReadEvent(Map<String, Object> map) {
		Event dto=null;
		
		try {
			dto=dao.selectOne("event.nextReadEvent", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public int updateEvent(Event dto, String pathname) {
		int result = 0;
		 try {
			 if(dto.getUpload() !=null && !dto.getUpload().isEmpty()) {
				 fileManager.doFileDelete(dto.getSaveFile(), pathname);
				 
				 String saveFile = fileManager.doFileUpload(dto.getUpload(), pathname);
				 dto.setSaveFile(saveFile);
				 dto.setOriginalFile(dto.getUpload().getOriginalFilename());
			 }	 
			 result =dao.updateData("event.updateEvent", dto);
			 
		} catch (Exception e) {
			System.out.println(e.toString());
		}	
		return result;
	}

	@Override
	public int deleteEvent(int eventCode, String pathname) {
		int result = 0;		
		try {
			Event dto = readEvent(eventCode);
			if(dto != null & dto.getSaveFile() != null)
				fileManager.doFileDelete(dto.getSaveFile(), pathname);
			
			result=dao.deleteData("event.deleteEvent", eventCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<Event> listEventTop() {
		List<Event> list = null;
		try {
			list = dao.selectList("event.listEventTop");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	public String getPathname() {
		return pathname;
	}

	public void setPathname(String pathname) {
		this.pathname = pathname;
	}

	@Override
	public int insertReply(Reply dto) {
		int result=0;
		try {
			result=dao.insertData("event.insertReply", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list=null;
		try {
			list=dao.selectList("event.listReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int replyDataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("event.replyDataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteReply(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.deleteData("event.deleteReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}

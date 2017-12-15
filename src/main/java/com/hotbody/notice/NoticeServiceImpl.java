package com.hotbody.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotbody.common.FileManager;
import com.hotbody.common.dao.CommonDAO;

@Service("notice.noticeService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	private String pathname;
	
	@Override
	public int insertNotice(Notice dto, String pathname) {
		int result=0;
		try {
			if (dto.getUpload() !=null && !dto.getUpload().isEmpty()) {
				String saveFile = fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setSaveFile(saveFile);
				dto.setOriginalFile(dto.getUpload().getOriginalFilename());
				dto.setFileSize(dto.getUpload().getSize());
			}
			result=dao.insertData("notice.insertNotice", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Notice> listNotice(Map<String, Object> map) {
		List<Notice> list=null;
		
		try {
			list=dao.selectList("notice.listNotice", map);
			
		} catch (Exception e) {		
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("notice.dataCount", map);
		} catch (Exception e) {			
		}
		return result;
	}

	@Override
	public Notice readNotice(int noticeCode) {
		Notice dto=null;
		
		try {		
			//게시물 가져오기
			dto=dao.selectOne("notice.readNotice", noticeCode);
		} catch (Exception e) {		
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateHitCount(int noticeCode) {
		int result = 0;
		
		try {
			result=dao.updateData("notice.updateHitCount", noticeCode);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Notice preReadNotice(Map<String, Object> map) {
		Notice dto=null;
		
		try {
			dto=dao.selectOne("notice.preReadNotice", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public Notice nextReadNotice(Map<String, Object> map) {
		Notice dto=null;
		
		try {
			dto=dao.selectOne("notice.nextReadNotice", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public int updateNotice(Notice dto, String pathname) {
		int result = 0;
		 try {
			 if(dto.getUpload() !=null && !dto.getUpload().isEmpty()) {
				 fileManager.doFileDelete(dto.getSaveFile(), pathname);
				 
				 String saveFile = fileManager.doFileUpload(dto.getUpload(), pathname);
				 dto.setSaveFile(saveFile);
				 dto.setOriginalFile(dto.getUpload().getOriginalFilename());
			 }	 
			 result =dao.updateData("notice.updateNotice", dto);
			 
		} catch (Exception e) {
			System.out.println(e.toString());
		}	
		return result;
	}

	@Override
	public int deleteNotice(int noticeCode, String pathname) {
		int result = 0;		
		try {
			Notice dto = readNotice(noticeCode);
			if(dto != null & dto.getSaveFile() != null)
				fileManager.doFileDelete(dto.getSaveFile(), pathname);
			
			result=dao.deleteData("notice.deleteNotice", noticeCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<Notice> listNoticeTop() {
		List<Notice> list = null;
		try {
			list = dao.selectList("notice.listNoticeTop");
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
			result=dao.insertData("notice.insertReply", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list=null;
		try {
			list=dao.selectList("notice.listReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int replyDataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("notice.replyDataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Reply> listReplyAnswer(int answer) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int replyCountAnswer(int answer) {
		// TODO Auto-generated method stub
		return 0;
	}
}

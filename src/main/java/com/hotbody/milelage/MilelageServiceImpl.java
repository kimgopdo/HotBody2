package com.hotbody.milelage;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hotbody.common.FileManager;
import com.hotbody.common.dao.CommonDAO;
import com.hotbody.member.SessionInfo;
@Service("milelage.milelageService")
public class MilelageServiceImpl implements MilelageService{

	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;



	@Override
	public Message readingMessage(int mCode) {
		Message dto=null;
		
		try {
			dto=dao.selectOne("milelage.readingMessage",mCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int writeMessage(Message dto, String pathname) {
		int result=0;

		try {
			int seq=dao.selectOne("milelage.seq");
			dto.setmCode(seq);
			
			result=dao.insertData("milelage.insertMessage", dto);
			
			// 파일 업로드
			if(! dto.getUploadFile().isEmpty()) {
				for(MultipartFile mf:dto.getUploadFile()) {
					if(mf.isEmpty())
						continue;
					
					String fileName=fileManager.doFileUpload(mf, pathname);
					if(fileName!=null) {
						String oFileName=mf.getOriginalFilename();
						long fileSize=mf.getSize();
						
						dto.setoFileName(oFileName);
						dto.setFileName(fileName);
						dto.setFileSize(fileSize);
						
						insertFile(dto);
					}
				}
			}
			
			result=dao.updateData("milelage.updateMessage", dto);
			
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}


	@Override
	public int mDataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("milelage.mDataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertFile(Message dto) {
		int result=0;
		try {
			result=dao.insertData("milelage.insertFile", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Message> listFile(int mCode) {
		List<Message> listFile =null;
		try {
			listFile=dao.selectList("milelage.fileList", mCode);

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return listFile;
	}


	@Override
	public int fileCount(int mCode) {
		int result=0;
		try {
			result=dao.selectOne("milelage.fileCount",mCode);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Message readFile(int fileNum) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int deleteFile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMessage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int checkUserId2(String userId2) {
		int result=0;
		try {
			result= dao.selectOne("milelage.checkUserId2",userId2);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}


	@Override
	public Milelage selectMilelage(String userId) {
		Milelage dto=null;
		try {
			dto= dao.selectOne("milelage.selectMilelage",userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}


	@Override
	public List<Milelage> listMilelage(Map<String, Object> map) {
		List<Milelage> list=null;
		try {
			list= dao.selectList("milelage.listMilelage",map);
			
		} catch (Exception e) {
			System.out.println(e.toString());
				
		}
		
		return list;
	}


	@Override
	public List<Message> listMessage(Map<String, Object> map) {
		List<Message> list=null;
		try {
			list= dao.selectList("milelage.listMessage",map);
			
		} catch (Exception e) {
			System.out.println(e.toString());
				
		}
		
		return list;
	}


	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("milelage.dataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	
	
}

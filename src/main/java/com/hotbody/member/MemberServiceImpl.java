package com.hotbody.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotbody.common.dao.CommonDAO;

@Service("member.memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private CommonDAO dao;
	
	@Override
	public Member readMember(String userId) {
		Member dto = null;
		
		try {
			dto = dao.selectOne("member.readMember", userId);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int insertMember(Member dto) {
		int result = 0;
		
		try {
			if(dto.getEmail1() != null && dto.getEmail1().length() != 0 && dto.getEmail2() != null && dto.getEmail2().length() != 0)
				dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
			
			if(dto.getTel1() != null && dto.getTel1().length() != 0 && dto.getTel2() != null && dto.getTel2().length() != 0 && dto.getTel3() != null && dto.getTel3().length() != 0)
				dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
			
			dto.setGrade(0);
			
			dao.insertData("member.insertMember1", dto);
			dao.insertData("member.insertMember2", dto);
			result=1;
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}


}

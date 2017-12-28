package com.hotbody.member;

import java.util.List;
import java.util.Map;

public interface MemberService {
	public Member readMember(String userId);
	public int insertMember(Member dto);
	public List<Member> listMember(Map<String, Object> map);
	public int countMember(Map<String, Object> map);
	public List<Member> registerList(Map<String, Object> map);
	public int countRegister(Map<String, Object> map);
	
}

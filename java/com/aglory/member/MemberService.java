package com.aglory.member;

import java.util.List;
import java.util.Map;


public interface MemberService {

	
	void setNewMember(Member member);
	
	List<Member> getAllMemberList();
	
	Member getMemberById(String bid);
	
	void updateAuth(Map<String, Object> auth);
	
	Member existUsername(String username);
	
}

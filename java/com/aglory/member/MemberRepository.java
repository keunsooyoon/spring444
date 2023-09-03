package com.aglory.member;

import java.util.List;
import java.util.Map;


public interface MemberRepository {

	
	void setNewMember(Member member);
	
	List<Member> getAllMemberList();
	
	Member getMemberById(String bid);
	
	public void updateAuth(Map<String, Object> auth);
	
	Member existUsername(String username);
	
}

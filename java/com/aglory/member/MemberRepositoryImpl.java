package com.aglory.member;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberRepositoryImpl implements MemberRepository {

	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	
	@Override
	public void setNewMember(Member member) {
		this.sqlSessionTemplate.insert("member.insert", member);


	}

	@Override
	public List<Member> getAllMemberList() {
		return this.sqlSessionTemplate.selectList("member.select_list");

	}

	@Override
	public Member getMemberById(String bid) {
		return this.sqlSessionTemplate.selectOne("member.select_detail", bid);

	}
	
	public void updateAuth(Map<String, Object> auth) {
		this.sqlSessionTemplate.update("member.update_auth", auth);
	}

	
	public Member existUsername(String username) {
		
		return sqlSessionTemplate.selectOne("member.select_one",username);
	}
}

package com.aglory.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository	
public class NoticeRepositoryImpl implements NoticeRepository {

	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void setNewNotice(Notice notice) {
		this.sqlSessionTemplate.insert("notice.insert", notice);
	}

	@Override
	public List<Notice> getAllNoticeList() {
		return this.sqlSessionTemplate.selectList("notice.select_list");
	}

	@Override
	public Notice getNoticeById(String nid) {
		return this.sqlSessionTemplate.selectOne("notice.select_detail", nid);
	}

}

package com.aglory.notice;

import java.util.List;


public interface NoticeRepository {

	
	void setNewNotice(Notice notice);
	
	List<Notice> getAllNoticeList();
	
	Notice getNoticeById(String bid);
	

	
	
}

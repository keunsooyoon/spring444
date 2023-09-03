package com.aglory.notice;

import java.util.List;


public interface NoticeService {

	
	void setNewNotice(Notice notice);
	
	List<Notice> getAllNoticeList();
	
	Notice getNoticeById(String bid);
}

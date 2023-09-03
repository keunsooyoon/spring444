package com.aglory.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	NoticeRepository noticeRepository;

	@Override
	public void setNewNotice(Notice notice) {
		noticeRepository.setNewNotice(notice);
	}

	@Override
	public List<Notice> getAllNoticeList() {
		return noticeRepository.getAllNoticeList();
	}

	@Override
	public Notice getNoticeById(String nid) {
		return noticeRepository.getNoticeById(nid);
	}

}

package com.aglory.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/notice")
@Controller
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	
	

	@RequestMapping("/addnotice")
	public String requestAddNoticeForm(@ModelAttribute("NewNotice") Notice notice) {

		return "notice/addnotice";
	}

	@PostMapping("/addnotice")
	public String submitAddNoticeForm(@ModelAttribute("NewNotice") Notice notice) {

		noticeService.setNewNotice(notice);
		return "redirect:/notice/list";
	}

	@GetMapping("/list")
	public String NoticeList(Model model) {
		List<Notice> list = noticeService.getAllNoticeList();
		model.addAttribute("noticeList", list);

		return "notice/list";
	}

	@GetMapping("/detail")
	public String requestNoticeById(@RequestParam("nid") String nid, Model model) {
		// 주 게시물
		Notice noticeById = noticeService.getNoticeById(nid);
		model.addAttribute("notice", noticeById);

		return "notice/detail";
	}

}

package com.aglory.main;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("mail")
@EnableAsync
@Controller
public class MailController {

	@Autowired
	private MailService mailService;
	
	@RequestMapping(value = "/sendmail", method = RequestMethod.GET)
	public void sendMail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		mailService.sendMail("austiny@snu.ac.kr", "게시물이 등록되었습니다.", "내용은 없습니다.");
		out.println("메일 전송 완료");
	}
	
}
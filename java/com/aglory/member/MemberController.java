package com.aglory.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@RequestMapping("/member")
@Controller
public class MemberController {

	
	@Autowired  //DI
	private MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;

	@RequestMapping("/addmember")
	public String requestAddMemberForm(@ModelAttribute("NewMember") Member member) {
		
		return "member/addmember";
	}
	
	@PostMapping("/addmember")
	public String submitAddMemberForm(@ModelAttribute("NewMember") Member member) {
		
		//회원 정보 디비 등록시 비번을 암호화 스프링 시큐리티 필수 사항
		String encodedPassword = bcryptPasswordEncoder.encode(member.getPassword());
		member.setPassword(encodedPassword);
		
		memberService.setNewMember(member);
		
		return "redirect:/member/list";
	}
	
	
	@GetMapping("/list")
	public String MemberList(Model model) {
	    List<Member> list = memberService.getAllMemberList();
	    model.addAttribute("memberList", list);

	    return "member/list";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public void updateAuth(@RequestParam Map<String, Object> auth) {
		
		this.memberService.updateAuth(auth);
	}
	
	
	
	@GetMapping("/detail")
	public String requestMemberById(@RequestParam("mid") String mid, Model model) {
		//주 게시물
		Member memberById = memberService.getMemberById(mid);
		model.addAttribute("member", memberById);
		
		return "member/detail";
	}
	
	
}

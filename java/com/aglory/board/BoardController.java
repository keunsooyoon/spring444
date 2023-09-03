package com.aglory.board;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aglory.main.MailService;
import com.aglory.member.Member;
import com.aglory.member.MemberService;





@RequestMapping("/board")
@Controller
public class BoardController {

	@Autowired  //DI
	BoardService boardService;
	
	@Autowired
	MailService mailService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	


//	
//	
	@RequestMapping("/addboard")
	public String requestAddBoardForm(@ModelAttribute("NewBoard") Board board) {
		
		return "board/addboard";
	}
	
	@PostMapping("/addboard")
	public String submitAddBoardForm(@ModelAttribute("NewBoard") Board board) {
		
		System.out.println(board.getBcontent());
		System.out.println(board.getBtitle());
		System.out.println(board.getBcate());
		
		boardService.setNewBoard(board);
		
		
// 관리자 화면에서 작성하는 게시물은 메일을 발송할 필요가 없음		
//		User user = userService.existUsername(board.getBwriter());
		
//		String to = "austiny@snu.ac.kr";
//		String subject = board.getBwriter() + " 님이 게시판에 글을 등록하셨습니다.";
//		String body = board.getBcontent();
//		
//		mailService.sendMail(to, subject, body);
		
		return "redirect:/board/list";
	}
	
	
	// 관리자 페이지용 전체 게시물 조회용 
	@GetMapping("/list")
	public String BoardList(Model model, Authentication authentication) {
		
		String username = authentication.getName();
	    List<Board> list = sqlSessionTemplate.selectList("board.select_all");
	    model.addAttribute("boardList", list);

	    return "board/list";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public void updateStatus(@RequestParam Map<String, Object> status) {
		
//		System.out.println((String)status.get("bstatus"));
//		System.out.println((String)status.get("bid"));
		
		this.boardService.updateStatus(status);
	}
	
	
	
	
	@GetMapping("/detail")
	public String requestBoardById(@RequestParam("bid") String bid, Model model) {
		//주 게시물
		

		
		Board boardById = boardService.getBoardById(bid);
		model.addAttribute("board", boardById);
		
		
		// 답변 게시물
		List<Board> list = boardService.getReplyById(bid);
		int cnt = list.size();
		model.addAttribute("replyList",list);
		model.addAttribute("cnt", cnt);
		
		
		return "board/detail";
	}
	

	
	@ResponseBody
	@RequestMapping("/replynew")
	public void replynew(@RequestParam Map<String, Object> map) {
		
		String rpid = (String)map.get("rpwriter"); //리플 작성자
		String bpid = (String)map.get("bpwriter"); //원본 작성자

		boardService.replynewBoard(map);

		Member member = memberService.existUsername(bpid);
		
		String to = member.getMemail();
		String subject = bpid + " 님의 글에 댓글이 달렸습니다.";
		String body = (String)map.get("bcontent");
		
		mailService.sendMail(to, subject, body);
		
		System.out.println("최종 테스트" + body);
		
	}
	

}

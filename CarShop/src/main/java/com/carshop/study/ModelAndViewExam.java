package com.carshop.study;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.carshop.board.BoardDTO;
import com.carshop.board.BoardService;

@Controller
@RequestMapping("/study")
public class ModelAndViewExam {
	
	
	private BoardService boardService;
	
	@GetMapping("/modelandview")
	public ModelAndView modelandview() {
		ModelAndView modelAndView = new ModelAndView();
		List<BoardDTO> list = boardService.getAllBoardList();
		modelAndView.addObject("test", list);
		modelAndView.setViewName("study/modelandview");
		return modelAndView;
	}

}

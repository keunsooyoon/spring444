package com.carshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carshop.board.BoardDTO;
import com.carshop.board.BoardRepository;
import com.carshop.board.BoardService;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired	//DI 의존성 주입  IoC  제어의 역전
	private BoardRepository boardRepository;


	@Override
	public List<BoardDTO> getAllBoardList() {
		// TODO Auto-generated method stub
		return boardRepository.getAllBoardList();
	}

}

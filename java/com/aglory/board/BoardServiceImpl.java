package com.aglory.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardRepository boardRepository;
	
	public void setNewBoard(Board board) {
		boardRepository.setNewBoard(board);
	}
	
	
	public List<Board> getAllBoardList(String username) {
		return boardRepository.getAllBoardList(username);
	}
	
	public Board getBoardById(String bid) {
		
		return boardRepository.getBoardById(bid);
	}
	
	public void replynewBoard(Map<String, Object> map) {
		boardRepository.replynewBoard(map);
	}
	
	public List<Board> getReplyById(String bid) {
		return boardRepository.getReplyById(bid);
	}
	
	public void updateStatus(Map<String, Object> status) {
		boardRepository.updateStatus(status);
	}
}

package com.aglory.board;

import java.util.List;
import java.util.Map;

public interface BoardService {

	void setNewBoard(Board board);
	
	List<Board> getAllBoardList(String username);
	
	Board getBoardById(String bid);
	
	void replynewBoard(Map<String, Object> map);
	
	List<Board> getReplyById(String bid);
	
	public void updateStatus(Map<String, Object> status);
	
	
}

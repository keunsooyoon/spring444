package com.aglory.board;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class BoardRepositoryImpl implements BoardRepository {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void setNewBoard(Board board) {
		this.sqlSessionTemplate.insert("board.insert", board);
	}

	public List<Board> getAllBoardList(String username) {
		return this.sqlSessionTemplate.selectList("board.select_list", username);

	}

	public Board getBoardById(String bid) {

		return this.sqlSessionTemplate.selectOne("board.select_detail", bid);

	}

	public void replynewBoard(Map<String, Object> map) {
		this.sqlSessionTemplate.insert("board.insert_reply", map);

	}

	public List<Board> getReplyById(String bid) {
		return this.sqlSessionTemplate.selectList("board.select_reply", bid);
	}

	public void updateStatus(Map<String, Object> status) {
		this.sqlSessionTemplate.update("board.update_status", status);
	}
	
}
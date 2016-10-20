package com.simple.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.simple.dao.BoardDao;
import com.simple.model.Board;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
	@Resource(name="boardDao")
	private BoardDao boardDao;
	
	public List<Board> getBoardList(){
		return boardDao.getBoardList();
	}

	public Board getSelectOne(int idx) {
		return boardDao.getSelectOne(idx);
	}

	public void insert(Board board) {
		boardDao.insert(board);
	}

	public void update(Board board) {
		boardDao.update(board);
	}

	public void delete(int idx) {
		boardDao.delete(idx);
	}
	
}

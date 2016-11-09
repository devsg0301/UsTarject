package com.sunset.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sunset.board.dao.BoardDao;
import com.sunset.model.Tboard;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
	@Resource(name="boardDao")
	private BoardDao boardDao;
	
	public List<Tboard> getBoardList(){
		return boardDao.getBoardList();
	}

	public Tboard getSelectOne(int idx) {
		return boardDao.getSelectOne(idx);
	}

	public void insertBoard(Tboard tboard) {
		boardDao.insertBoard(tboard);
	}

	public void updateBoard(Tboard tboard) {
		boardDao.updateBoard(tboard);
	}

	public void deleteBoard(int idx) {
		boardDao.deleteBoard(idx);
	}
	
}

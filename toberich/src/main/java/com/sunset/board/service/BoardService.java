package com.sunset.board.service;

import java.util.List;

import com.sunset.model.Tboard;

public interface BoardService {
	
	public List<Tboard> getBoardList();

	public Tboard getSelectOne(int idx);

	public void insertBoard(Tboard tboard);

	public void updateBoard(Tboard tboard);

	public void deleteBoard(int idx);

}

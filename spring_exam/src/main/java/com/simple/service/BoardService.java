package com.simple.service;

import java.util.List;

import com.simple.model.Board;

public interface BoardService {
	
	public List<Board> getBoardList();

	public Board getSelectOne(int idx);

	public void insert(Board board);

	public void update(Board board);

	public void delete(int idx);

}

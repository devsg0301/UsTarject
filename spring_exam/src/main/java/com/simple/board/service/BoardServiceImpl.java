package com.simple.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.simple.board.dao.BoardMapper;
import com.simple.board.vo.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
	@Resource(name="boardMapper")
	private BoardMapper boardMapper;
	
	@Override
	public List<BoardVO> getBoardList(){
		return null;
	}
	
}

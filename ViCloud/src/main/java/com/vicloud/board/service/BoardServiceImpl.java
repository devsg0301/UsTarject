package com.vicloud.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.vicloud.board.dao.BoardDao;
import com.vicloud.model.Tboard;
import com.vicloud.model.Tboard_comment;

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
	
	public List<Tboard_comment> boardCommentList(int idx){
		return boardDao.boardCommentList(idx);
	}
	
	public Integer maxSeqNo(int idx){
		return boardDao.maxSeqNo(idx);
	}
	
	public Integer maxIdxNo(int idx){
		return boardDao.maxIdxNo(idx);
	}
	
	public Integer maxSeqReNo(int idx, int idx_no, int seq, int gap){
		return boardDao.maxSeqReNo(idx, idx_no, seq, gap);
	}
	
	public void updateSeqNo(int idx, int seq_no){
		boardDao.updateSeqNo(idx, seq_no);
	}

	public void insertBoardComment(Tboard_comment tboard_comment){
		boardDao.insertBoardComment(tboard_comment);
	}
	
	public void deleteBoardComment(int seq, String insert_id){
		boardDao.deleteBoardComment(seq, insert_id);
	}
	
	public void deleteBoardReComment(int idx, int idx_no, int seq, int gap){
		boardDao.deleteBoardReComment(idx, idx_no, seq, gap);
	}
	
}

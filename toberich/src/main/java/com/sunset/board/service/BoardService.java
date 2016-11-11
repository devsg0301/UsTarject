package com.sunset.board.service;

import java.util.List;

import com.sunset.model.Tboard;
import com.sunset.model.Tboard_comment;

public interface BoardService {
	
	public List<Tboard> getBoardList();

	public Tboard getSelectOne(int idx);

	public void insertBoard(Tboard tboard);

	public void updateBoard(Tboard tboard);

	public void deleteBoard(int idx);
	
	public List<Tboard_comment> boardCommentList(int idx);

	public Integer maxSeqNo(int idx);

	public Integer maxIdxNo(int idx);
	
	public Integer maxSeqReNo(int idx, int idx_no, int seq, int gap);
	
	public void updateSeqNo(int idx, int seq_no);
	
	public void insertBoardComment(Tboard_comment tboard_comment);
	
	public void deleteBoardComment(int seq, String insert_id);
	
	public void deleteBoardReComment(int idx, int idx_no, int seq, int gap);

}

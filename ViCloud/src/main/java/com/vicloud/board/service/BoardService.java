package com.vicloud.board.service;

import java.util.List;

import com.vicloud.model.Tboard;
import com.vicloud.model.Tboard_comment;
import com.vicloud.model.Tbroadcast;
import com.vicloud.model.Tbroadcast_comment;

public interface BoardService {
	
	public List<Tbroadcast> getBroadcastList(int rnum, String category, String genre, String searchWord);

	public Integer totalBroadcast(String category, String genre, String searchWord);

	public List getCategoryList();

	public List getGenerList(String category);
	
	public Tbroadcast broadcastDetail(int idx);
	
	public Tbroadcast getSelectBroadcast(int idx);

	public void insertBroadcast(Tbroadcast tbroadcast);
	
	public void updateBroadcast(Tbroadcast tbroadcast);
	
	public List<Tbroadcast_comment> broadcastCommentList(int idx);
	
	public void insertBroadcastComment(Tbroadcast_comment tbroadcast_comment);
	
	public Integer maxSeqNo(int idx);
	
	public Integer maxIdxNo(int idx);
	
	public Integer maxSeqReNo(int idx, int idx_no, int seq, int gap);

	/* *************************************************************** */
	
	public List<Tboard> getBoardList();
	
	public Tboard getSelectOne(int idx);

	public void insertBoard(Tboard tboard);

	public void updateBoard(Tboard tboard);

	public void deleteBoard(int idx);
	
	public List<Tboard_comment> boardCommentList(int idx);
	
	public void updateSeqNo(int idx, int seq_no);
	
	public void insertBoardComment(Tboard_comment tboard_comment);
	
	public void deleteBoardComment(int seq, String insert_id);
	
	public void deleteBoardReComment(int idx, int idx_no, int seq, int gap);





}

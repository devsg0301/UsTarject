package com.beemosg.board.service;

import java.util.List;

import com.beemosg.model.Tboard;
import com.beemosg.model.Tboard_comment;
import com.beemosg.model.Tbroadcast;
import com.beemosg.model.Tbroadcast_comment;

public interface BoardService {
	
	public void updateHitCount(String foldername) throws Exception;
	
	public List<Tbroadcast> getBroadcastList(int rnum, String category, String genre, String foldername, String searchWord) throws Exception ;

	public Integer totalBroadcast(String category, String genre, String foldername, String searchWord) throws Exception ;

	public List getCategoryList() throws Exception;

	public List getGenerList(String category) throws Exception;

	public List getFolderList(String category, String genre) throws Exception;
	
	public Tbroadcast broadcastDetail(int idx) throws Exception;
	
	public Tbroadcast getSelectBroadcast(int idx) throws Exception;

	public void insertBroadcast(Tbroadcast tbroadcast) throws Exception;
	
	public void updateBroadcast(Tbroadcast tbroadcast) throws Exception;
	
	public List<Tbroadcast_comment> broadcastCommentList(int idx) throws Exception;
	
	public void insertBroadcastComment(Tbroadcast_comment tbroadcast_comment) throws Exception;
	
	public Integer maxSeqNo(int idx) throws Exception;
	
	public Integer maxIdxNo(int idx) throws Exception;
	
	public Integer maxSeqReNo(int idx, int idx_no, int seq, int gap) throws Exception;

	/* *************************************************************** */
	
	public List<Tboard> getBoardList() throws Exception;
	
	public Tboard getSelectOne(int idx) throws Exception;

	public void insertBoard(Tboard tboard) throws Exception;

	public void updateBoard(Tboard tboard) throws Exception;

	public void deleteBoard(int idx) throws Exception;
	
	public List<Tboard_comment> boardCommentList(int idx) throws Exception;
	
	public void updateSeqNo(int idx, int seq_no) throws Exception;
	
	public void insertBoardComment(Tboard_comment tboard_comment) throws Exception;
	
	public void deleteBoardComment(int seq, String insert_id) throws Exception;
	
	public void deleteBoardReComment(int idx, int idx_no, int seq, int gap) throws Exception;







}

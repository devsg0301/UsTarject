package com.beemosg.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.beemosg.board.dao.BoardDao;
import com.beemosg.model.Tboard;
import com.beemosg.model.Tboard_comment;
import com.beemosg.model.Tbroadcast;
import com.beemosg.model.Tbroadcast_comment;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
	@Resource(name="boardDao")
	private BoardDao boardDao;
	
	public void updateHitCount(String foldername) throws Exception {
		boardDao.updateHitCount(foldername);
	}
	
	public List<Tbroadcast> getBroadcastList(int rnum, String category, String genre, String foldername, String searchWord) throws Exception {
		return boardDao.getBroadcastList(rnum, category, genre, foldername, searchWord);
	}
	
	public Integer totalBroadcast(String category, String genre, String foldername, String searchWord) throws Exception {
		return boardDao.totalBroadcast(category, genre, foldername, searchWord);
	}
	
	public List getCategoryList() throws Exception {
		return boardDao.getCategoryList();
	}
	
	public List getGenerList(String category) throws Exception {
		return boardDao.getGenerList(category);
	}
	
	public List getFolderList(String category, String genre) throws Exception {
		return boardDao.getFolderList(category, genre);
	}
	
	public Tbroadcast broadcastDetail(int idx) throws Exception {
		return boardDao.broadcastDetail(idx);
	}
	
	public Tbroadcast getSelectBroadcast(int idx) throws Exception {
		return boardDao.getSelectBroadcast(idx);
	}
	
	public void insertBroadcast(Tbroadcast tbroadcast) throws Exception {
		boardDao.insertBroadcast(tbroadcast);
	}
	
	public void updateBroadcast(Tbroadcast tbroadcast) throws Exception {
		boardDao.updateBroadcast(tbroadcast);
	}
	
	public List<Tbroadcast_comment> broadcastCommentList(int idx) throws Exception {
		return boardDao.broadcastCommentList(idx);
	}
	
	public void insertBroadcastComment(Tbroadcast_comment tbroadcast_comment) throws Exception {
		boardDao.insertBroadcastComment(tbroadcast_comment);
	}
	
	public Integer maxSeqNo(int idx) throws Exception {
		return boardDao.maxSeqNo(idx);
	}
	
	public Integer maxIdxNo(int idx) throws Exception {
		return boardDao.maxIdxNo(idx);
	}
	
	public Integer maxSeqReNo(int idx, int idx_no, int seq, int gap) throws Exception {
		return boardDao.maxSeqReNo(idx, idx_no, seq, gap);
	}
	
	public List<Tboard> getBoardList(int rnum, String gubun) throws Exception{
		return boardDao.getBoardList(rnum, gubun);
	}
	public Tboard getSelectOne(int idx) throws Exception{
		return boardDao.getSelectOne(idx);
	}
	
	public void insertBoard(Tboard tboard) throws Exception{
		boardDao.insertBoard(tboard);
	}

	public void updateCustomer(int idx) throws Exception{
		boardDao.updateCustomer(idx);
	}

	/* ******************************************************************** */

	public void updateBoard(Tboard tboard) throws Exception{
		boardDao.updateBoard(tboard);
	}

	public void deleteBoard(int idx) throws Exception{
		boardDao.deleteBoard(idx);
	}
	
	public List<Tboard_comment> boardCommentList(int idx) throws Exception{
		return boardDao.boardCommentList(idx);
	}
	
	public void updateSeqNo(int idx, int seq_no) throws Exception{
		boardDao.updateSeqNo(idx, seq_no);
	}

	public void insertBoardComment(Tboard_comment tboard_comment) throws Exception{
		boardDao.insertBoardComment(tboard_comment);
	}
	
	public void deleteBoardComment(int seq, String insert_id) throws Exception{
		boardDao.deleteBoardComment(seq, insert_id);
	}
	
	public void deleteBoardReComment(int idx, int idx_no, int seq, int gap) throws Exception{
		boardDao.deleteBoardReComment(idx, idx_no, seq, gap);
	}


}

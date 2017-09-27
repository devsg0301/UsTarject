package com.vicloud.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.vicloud.board.dao.BoardDao;
import com.vicloud.model.Tboard;
import com.vicloud.model.Tboard_comment;
import com.vicloud.model.Tbroadcast;
import com.vicloud.model.Tbroadcast_comment;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
	@Resource(name="boardDao")
	private BoardDao boardDao;
	
	public List<Tbroadcast> getBroadcastList(int rnum, String category, String genre, String searchWord) {
		return boardDao.getBroadcastList(rnum, category, genre, searchWord);
	}
	
	public Integer totalBroadcast(String category, String genre, String searchWord) {
		return boardDao.totalBroadcast(category, genre, searchWord);
	}
	
	public List getCategoryList() {
		return boardDao.getCategoryList();
	}
	
	public List getGenerList(String category) {
		return boardDao.getGenerList(category);
	}
	
	public Tbroadcast broadcastDetail(int idx){
		return boardDao.broadcastDetail(idx);
	}
	
	public Tbroadcast getSelectBroadcast(int idx) {
		return boardDao.getSelectBroadcast(idx);
	}
	
	public void insertBroadcast(Tbroadcast tbroadcast){
		boardDao.insertBroadcast(tbroadcast);
	}
	
	public void updateBroadcast(Tbroadcast tbroadcast){
		boardDao.insertBroadcast(tbroadcast);
	}
	
	public List<Tbroadcast_comment> broadcastCommentList(int idx){
		return boardDao.broadcastCommentList(idx);
	}
	
	public void insertBroadcastComment(Tbroadcast_comment tbroadcast_comment){
		boardDao.insertBroadcastComment(tbroadcast_comment);
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
	
	/* ******************************************************************** */
	
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

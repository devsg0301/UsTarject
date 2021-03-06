package com.vicloud.board.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.vicloud.model.Tboard;
import com.vicloud.model.Tboard_comment;
import com.vicloud.model.Tbroadcast;
import com.vicloud.model.Tbroadcast_comment;

@Service(value = "boardDao")
public class BoardDao {
    @Resource(name = "boardMapper")
    private BoardMapper boardMapper;
    
    public List<Tbroadcast> getBroadcastList(int rnum, String category, String genre, String foldername, String searchWord){
    	return this.boardMapper.getBroadcastList(rnum, category, genre, foldername, searchWord);
    }

    public Integer totalBroadcast(String category, String genre, String foldername, String searchWord) {
    	return this.boardMapper.totalBroadcast(category, genre, foldername, searchWord);
    }

    public List getCategoryList() {
    	return this.boardMapper.getCategoryList();
    }

    public List getGenerList(String category) {
    	return this.boardMapper.getGenerList(category);
    }
    
    public List getFolderList(String category, String genre) {
		return this.boardMapper.getFolderList(category, genre);
	}

    public Tbroadcast broadcastDetail(int idx){
    	return this.boardMapper.broadcastDetail(idx);
    }
    
    public Tbroadcast getSelectBroadcast(int idx) {
    	return this.boardMapper.getSelectBroadcast(idx);
    }
    
    public void insertBroadcast(Tbroadcast tbroadcast) {
    	this.boardMapper.insertBroadcast(tbroadcast);
    }
    
    public void updateBroadcast(Tbroadcast tbroadcast) {
    	this.boardMapper.updateBroadcast(tbroadcast);
    }
    
    public List<Tbroadcast_comment> broadcastCommentList(int idx){
    	return this.boardMapper.broadcastCommentList(idx);
    }

    public void insertBroadcastComment(Tbroadcast_comment tbroadcast_comment){
    	this.boardMapper.insertBroadcastComment(tbroadcast_comment);
    }
    
    public Integer maxSeqNo(int idx){
    	return this.boardMapper.maxSeqNo(idx);
    }
    
    public Integer maxIdxNo(int idx){
    	return this.boardMapper.maxIdxNo(idx);
    }
    
    public Integer maxSeqReNo(int idx, int idx_no, int seq, int gap){
    	return this.boardMapper.maxSeqReNo(idx, idx_no, seq, gap);
    }
    
    /* ********************************************************************* */
    
    public List<Tboard> getBoardList() {
        return this.boardMapper.boardList();
    }

    public Tboard getSelectOne(int idx) {
        return this.boardMapper.selectOne(idx);
    }
    
    public void insertBoard(Tboard tboard) {
        this.boardMapper.insertBoard(tboard);
    }

    public void updateBoard(Tboard tboard) {
        this.boardMapper.updateBoard(tboard);
    }

    public void deleteBoard(int idx) {
        this.boardMapper.deleteBoard(idx);
    }
    
    public List<Tboard_comment> boardCommentList(int idx){
    	return this.boardMapper.boardCommentList(idx);
    }
    
    public void updateSeqNo(int idx, int seq_no){
    	this.boardMapper.updateSeqNo(idx, seq_no);
    }

    public void insertBoardComment(Tboard_comment tboard_comment){
    	this.boardMapper.insertBoardComment(tboard_comment);
    }
    
    public void deleteBoardComment(int seq, String insert_id){
    	this.boardMapper.deleteBoardComment(seq, insert_id);
    }
    
    public void deleteBoardReComment(int idx, int idx_no, int seq, int gap){
    	this.boardMapper.deleteBoardReComment(idx, idx_no, seq, gap);
    }

}

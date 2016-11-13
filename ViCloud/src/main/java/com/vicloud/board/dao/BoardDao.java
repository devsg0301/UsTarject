package com.vicloud.board.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.vicloud.model.Tboard;
import com.vicloud.model.Tboard_comment;

@Service(value = "boardDao")
public class BoardDao {
    @Resource(name = "boardMapper")
    private BoardMapper boardMapper;

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
    
    public Integer maxSeqNo(int idx){
    	return this.boardMapper.maxSeqNo(idx);
    }
    
    public Integer maxIdxNo(int idx){
    	return this.boardMapper.maxIdxNo(idx);
    }
    
    public Integer maxSeqReNo(int idx, int idx_no, int seq, int gap){
    	return this.boardMapper.maxSeqReNo(idx, idx_no, seq, gap);
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

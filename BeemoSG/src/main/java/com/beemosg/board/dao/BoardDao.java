package com.beemosg.board.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.beemosg.model.Tboard;
import com.beemosg.model.Tboard_comment;
import com.beemosg.model.Tbroadcast;
import com.beemosg.model.Tbroadcast_comment;

@Service(value = "boardDao")
public class BoardDao {
    @Resource(name = "boardMapper")
    private BoardMapper boardMapper;
    
    public void updateHitCount(String foldername) throws Exception{
    	this.boardMapper.updateHitCount(foldername);
    }

    public void updateHitCountIdx(int idx) throws Exception{
    	this.boardMapper.updateHitCountIdx(idx);
    }
    
    public List<Tbroadcast> getBroadcastList(int rnum, String category, String genre, String foldername, String searchWord, String country) throws Exception{
    	return this.boardMapper.getBroadcastList(rnum, category, genre, foldername, searchWord, country);
    }

    public Integer totalBroadcast(String category, String genre, String foldername, String searchWord, String country) throws Exception{
    	return this.boardMapper.totalBroadcast(category, genre, foldername, searchWord, country);
    }

    public List getCategoryList() throws Exception{
    	return this.boardMapper.getCategoryList();
    }

    public List getGenerList(String category) throws Exception{
    	return this.boardMapper.getGenerList(category);
    }
    
    public List getFolderList(String category, String genre, String foldername, String searchWord, String country) throws Exception{
		return this.boardMapper.getFolderList(category, genre, foldername, searchWord, country);
	}

    public Tbroadcast broadcastDetail(int idx) throws Exception{
    	return this.boardMapper.broadcastDetail(idx);
    }
    
    public Tbroadcast getSelectBroadcast(int idx) throws Exception{
    	return this.boardMapper.getSelectBroadcast(idx);
    }
    
    public void insertBroadcast(Tbroadcast tbroadcast) throws Exception{
    	this.boardMapper.insertBroadcast(tbroadcast);
    }
    
    public void updateBroadcast(Tbroadcast tbroadcast) throws Exception{
    	this.boardMapper.updateBroadcast(tbroadcast);
    }

    public void deleteBroadcast(String idx) throws Exception{
    	this.boardMapper.deleteBroadcast(idx);
    }
    
    public List<Tbroadcast_comment> broadcastCommentList(int idx) throws Exception{
    	return this.boardMapper.broadcastCommentList(idx);
    }

    public void insertBroadcastComment(Tbroadcast_comment tbroadcast_comment) throws Exception{
    	this.boardMapper.insertBroadcastComment(tbroadcast_comment);
    }
    
    public Integer maxSeqNo(int idx) throws Exception{
    	return this.boardMapper.maxSeqNo(idx);
    }
    
    public Integer maxIdxNo(int idx) throws Exception{
    	return this.boardMapper.maxIdxNo(idx);
    }
    
    public Integer maxSeqReNo(int idx, int idx_no, int seq, int gap) throws Exception{
    	return this.boardMapper.maxSeqReNo(idx, idx_no, seq, gap);
    }
    
    public List<Tboard> getBoardList(int rnum, String gubun) throws Exception{
    	return this.boardMapper.boardList(rnum, gubun);
    }
    
    public Tboard getSelectOne(int idx) throws Exception{
    	return this.boardMapper.selectOne(idx);
    }
    
    public void insertBoard(Tboard tboard) throws Exception{
    	this.boardMapper.insertBoard(tboard);
    }
    
    public void updateCustomer(int idx) throws Exception{
    	this.boardMapper.updateCustomer(idx);
    }
    
    /* ********************************************************************* */

    public void updateBoard(Tboard tboard) throws Exception{
    	this.boardMapper.updateBoard(tboard);
    }

    public void deleteBoard(int idx) throws Exception{
        this.boardMapper.deleteBoard(idx);
    }
    
    public List<Tboard_comment> boardCommentList(int idx) throws Exception{
    	return this.boardMapper.boardCommentList(idx);
    }
    
    public void updateSeqNo(int idx, int seq_no) throws Exception{
    	this.boardMapper.updateSeqNo(idx, seq_no);
    }

    public void insertBoardComment(Tboard_comment tboard_comment) throws Exception{
    	this.boardMapper.insertBoardComment(tboard_comment);
    }
    
    public void deleteBoardComment(int seq, String insert_id) throws Exception{
    	this.boardMapper.deleteBoardComment(seq, insert_id);
    }
    
    public void deleteBoardReComment(int idx, int idx_no, int seq, int gap) throws Exception{
    	this.boardMapper.deleteBoardReComment(idx, idx_no, seq, gap);
    }

}

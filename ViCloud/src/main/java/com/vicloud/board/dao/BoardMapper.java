package com.vicloud.board.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.vicloud.model.Tboard;
import com.vicloud.model.Tboard_comment;
import com.vicloud.model.Tbroadcast;

@Repository(value = "boardMapper")
public interface BoardMapper {
	
	List<Tbroadcast> getBroadcastList(int rnum, String category, String genre, String searchWord);
	Integer totalBroadcast(String category, String genre, String searchWord);
	List getCategoryList();
	List getGenerList(String category);
	Tbroadcast broadcastDetail(int idx);
	Tbroadcast getSelectBroadcast(int idx);
	void insertBroadcast(Tbroadcast tbroadcast);
	void updateBroadcast(Tbroadcast tbroadcast);
	
	List<Tboard> boardList();
    Tboard selectOne(int idx);
    void insertBoard(Tboard tboard);
    void updateBoard(Tboard tboard);
    void deleteBoard(int idx);
    
    List<Tboard_comment> boardCommentList(int idx);
    Integer maxSeqNo(int idx);
    Integer maxIdxNo(int idx);
    Integer maxSeqReNo(int idx, int idx_no, int seq, int gap);
    void updateSeqNo(int idx, int seq_no);
    void insertBoardComment(Tboard_comment tboard_comment);
    void deleteBoardComment(int seq, String insert_id);
    void deleteBoardReComment(int idx, int idx_no, int seq, int gap);
    
}
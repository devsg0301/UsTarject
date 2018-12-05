package com.beemosg.board.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.beemosg.model.Tboard;
import com.beemosg.model.Tboard_comment;
import com.beemosg.model.Tbroadcast;
import com.beemosg.model.Tbroadcast_comment;
import com.beemosg.model.Tlogin_history;

@Repository(value = "boardMapper")
public interface BoardMapper {
	
	void updateHitCount(String foldername) throws Exception;
	void updateHitCountIdx(int idx) throws Exception;
	List<Tbroadcast> getBroadcastList(int rnum, String category, String genre, String foldername, String searchWord, String country) throws Exception;
	Integer totalBroadcast(String category, String genre, String foldername, String searchWord, String country) throws Exception;
	List getCategoryList() throws Exception;
	List getGenerList(String category) throws Exception;
	List getFolderList(String category, String genre, String foldername, String searchWord, String country) throws Exception;
	Tbroadcast broadcastDetail(int idx) throws Exception;
	List getTvFolderList() throws Exception;
	Tbroadcast getSelectBroadcast(int idx) throws Exception;
	void insertBroadcast(Tbroadcast tbroadcast) throws Exception;
	void updateBroadcast(Tbroadcast tbroadcast) throws Exception;
	void deleteBroadcast(String idx) throws Exception;
	List<Tbroadcast_comment> broadcastCommentList(int idx) throws Exception;
	Integer maxSeqNo(int idx) throws Exception;
	Integer maxIdxNo(int idx) throws Exception;
	Integer maxSeqReNo(int idx, int idx_no, int seq, int gap) throws Exception;
	void insertBroadcastComment(Tbroadcast_comment tbroadcast_comment) throws Exception;
	List<Tboard> boardList(int rnum, String gubun) throws Exception;
	Tboard selectOne(int idx) throws Exception;
	void insertBoard(Tboard tboard) throws Exception;
	void updateCustomer(int idx) throws Exception;
	List<Tlogin_history> selectLoginHistoryList(int rnum) throws Exception;
	List getLoginHistoryList() throws Exception;
	
	/* ********************************************************************* */
	
    void updateBoard(Tboard tboard) throws Exception;
    void deleteBoard(int idx) throws Exception;
    
    List<Tboard_comment> boardCommentList(int idx) throws Exception;
    void updateSeqNo(int idx, int seq_no) throws Exception;
    void insertBoardComment(Tboard_comment tboard_comment) throws Exception;
    void deleteBoardComment(int seq, String insert_id) throws Exception;
    void deleteBoardReComment(int idx, int idx_no, int seq, int gap) throws Exception;
    
}
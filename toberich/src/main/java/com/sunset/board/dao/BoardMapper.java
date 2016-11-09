package com.sunset.board.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sunset.model.Tboard;

@Repository(value = "boardMapper")
public interface BoardMapper {
	List<Tboard> boardList();
    Tboard selectOne(int idx);
    void insertBoard(Tboard tboard);
    void updateBoard(Tboard tboard);
    void deleteBoard(int idx);

}
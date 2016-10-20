package com.simple.dao;

import java.util.List;
import org.springframework.stereotype.Repository;

import com.simple.model.Board;

@Repository(value = "boardMapper")
public interface BoardMapper {
	List<Board> boardList();
    Board selectOne(int idx);
    void insert(Board board);
    void update(Board board);
    void delete(int idx);

}
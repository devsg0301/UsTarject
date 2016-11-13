package com.simple.board.dao;

import java.util.List;
import org.springframework.stereotype.Repository;

import com.simple.board.vo.BoardVO;

@Repository(value = "boardMapper")
public interface BoardMapper {
    List<BoardVO> select();

    BoardVO selectOne(int idx);
    void insert(BoardVO boardVO);
    void update(BoardVO boardVO);
    void delete(int idx);
}
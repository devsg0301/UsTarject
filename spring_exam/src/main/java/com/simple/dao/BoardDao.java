package com.simple.dao;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.simple.model.Board;

@Service(value = "boardDao")
public class BoardDao {
    @Resource(name = "boardMapper")
    private BoardMapper boardMapper;

    public List<Board> getBoardList() {
        return this.boardMapper.boardList();
    }

    public Board getSelectOne(int idx) {
        return this.boardMapper.selectOne(idx);
    }
    
    public void insert(Board board) {
         this.boardMapper.insert(board);
    }

    public void update(Board board) {
         this.boardMapper.update(board);
    }

    public void delete(int idx) {
         this.boardMapper.delete(idx);
    }
}

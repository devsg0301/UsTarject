package com.simple.board.dao;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.simple.board.vo.BoardVO;

@Service(value = "boardDao")
public class BoardDao {
    @Resource(name = "boardMapper")
    private BoardMapper boardMapper;

    public List<BoardVO> getSelect() {
        return this.boardMapper.select();
    }

    public BoardVO getSelectOne(int idx) {
        return this.boardMapper.selectOne(idx);
    }

    public void insert(BoardVO boardVO) {
         this.boardMapper.insert(boardVO);
    }

    public void update(BoardVO boardVO) {
         this.boardMapper.update(boardVO);
    }

    public void delete(int idx) {
         this.boardMapper.delete(idx);
    }
}

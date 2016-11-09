package com.sunset.board.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sunset.model.Tboard;

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
}

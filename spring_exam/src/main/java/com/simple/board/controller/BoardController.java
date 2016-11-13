package com.simple.board.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simple.board.dao.BoardDao;
import com.simple.board.vo.BoardVO;

@Controller(value = "boardController")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Resource(name="boardDao")
	private BoardDao boardDao;
	/*
	@RequestMapping(value="/getBoardList.do")
	public ModelAndView getBoardList(){
		List<BoardVO> list = boardservice.getBoardList();
		ModelAndView mv = new ModelAndView("list");
		mv.addObject("list", list);
		
		logger.debug("/getBoardList.do");
		
		return mv;
	}*/
	
	// 게시판 목록
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String dispBbsList(Model model) {
        logger.info("display view Board list");
        List<BoardVO> list = this.boardDao.getSelect();
        model.addAttribute("list", list);

        logger.info("total count" + list.size() );

        return "board/list";
    }

    // 게시판 상세보
    // PathVariable 어노테이션을 이용하여 RESTful 방식 적용
    // board/1 -> id = 1; id = 게시물 번호로 인식함.
    // 일반 적으로 (@ReuqstParam(value = "boardVO", required = false, defaultValue = "0"), int idx, Model model)
    @RequestMapping("/{idx}")
    public String dispBbsView(@PathVariable int idx, Model model) {
        logger.info("display view Board view idx = {}", idx);
        BoardVO object = this.boardDao.getSelectOne(idx);

        model.addAttribute("object", object);
        return "board/view";
    }

    // 게시판 쓰기
    @RequestMapping(value = "/write", method = RequestMethod.GET)
    public String dispBbsWrite(@RequestParam(value="idx", defaultValue="0") int idx, Model model) {
        logger.info("display view Board write");

        if (idx > 0) {
            BoardVO object = this.boardDao.getSelectOne(idx);
            model.addAttribute("object", object);
        }

        return "board/write";
    }

    @RequestMapping(value = "/write_ok", method = RequestMethod.POST)
    public String procBbsWrite(@ModelAttribute("boardVO") BoardVO boardVO, RedirectAttributes redirectAttributes) {
        Integer idx = boardVO.getIdx();

        if (idx == null || idx == 0) {
            this.boardDao.insert(boardVO);
            redirectAttributes.addFlashAttribute("message", "추가되었습니다.");
            return "redirect:/";
        } else {
            this.boardDao.update(boardVO);
            redirectAttributes.addFlashAttribute("message", "수정되었습니다.");
            return "redirect:/";
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String procBbsDelete(@RequestParam(value = "idx", required = false) int idx) {
    	logger.info("delete Board");
        this.boardDao.delete(idx);
        return "redirect:/";
    }

}

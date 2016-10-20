package com.simple.controller;

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

import com.simple.model.Board;
import com.simple.service.BoardService;

@Controller(value = "boardController")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Resource(name="boardService")
	private BoardService boardService;
	/*
	@RequestMapping(value="/getBoardList.do")
	public ModelAndView getBoardList(){
		List<Board> list = boardservice.getBoardList();
		ModelAndView mv = new ModelAndView("list");
		mv.addObject("list", list);
		
		logger.debug("/getBoardList.do");
		
		return mv;
	}*/
	
	// 게시판 목록
    @RequestMapping(value = "/board.do", method = RequestMethod.GET)
    public String dispBbsList(Model model) {
        logger.info("display view Board list");
        List<Board> list = this.boardService.getBoardList();
        model.addAttribute("list", list);

        logger.info("total count" + list.size() );

        return "board/list";
    }

    // 게시판 상세보
    // PathVariable 어노테이션을 이용하여 RESTful 방식 적용
    // board/1 -> id = 1; id = 게시물 번호로 인식함.
    // 일반 적으로 (@ReuqstParam(value = "board", required = false, defaultValue = "0"), int idx, Model model)
    @RequestMapping("/{idx}.do")
    public String dispBbsView(@PathVariable int idx, Model model) {
        logger.info("display view Board view idx = {}", idx);
        Board object = this.boardService.getSelectOne(idx);

        model.addAttribute("object", object);
        return "board/view";
    }

    // 게시판 쓰기
    @RequestMapping(value = "/write.do", method = RequestMethod.GET)
    public String dispBbsWrite(@RequestParam(value="idx", defaultValue="0") int idx, Model model) {
        logger.info("display view Board write");

        if (idx > 0) {
            Board object = this.boardService.getSelectOne(idx);
            model.addAttribute("object", object);
        }

        return "board/write";
    }

    @RequestMapping(value = "/write_ok.do", method = RequestMethod.POST)
    public String procBbsWrite(@ModelAttribute("board") Board board, RedirectAttributes redirectAttributes) {
        Integer idx = board.getIdx();

        if (idx == null || idx == 0) {
            this.boardService.insert(board);
            redirectAttributes.addFlashAttribute("message", "추가되었습니다.");
            return "redirect:/board.do";
        } else {
            this.boardService.update(board);
            redirectAttributes.addFlashAttribute("message", "수정되었습니다.");
            return "redirect:/board.do";
        }
    }

    @RequestMapping(value = "/delete.do", method = RequestMethod.POST)
    public String procBbsDelete(@RequestParam(value = "idx", required = false) int idx) {
    	logger.info("delete Board");
        this.boardService.delete(idx);
        return "redirect:/board.do";
    }

}

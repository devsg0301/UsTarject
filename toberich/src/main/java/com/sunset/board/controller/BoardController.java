package com.sunset.board.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

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

import com.sunset.board.service.BoardService;
import com.sunset.model.Tboard;
import com.sunset.model.Tcustomer;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	// 메인페이지 이동
	@RequestMapping(value = "/board/board.do", method = RequestMethod.GET)
	public String displayMain(HttpSession session, Model model){
		logger.info("board page start");
		System.out.println("board page start");
		if(session.getAttribute("userLoginInfo") == null || "".equals(session.getAttribute("userLoginInfo"))){
			logger.info("You don't login.");
			System.out.println("You don't login.");
			return "defaults/login";
		}
		
		logger.info("display view Board list");
		System.out.println("display view Board list");
        List<Tboard> board_list = this.boardService.getBoardList();
        model.addAttribute("board_list", board_list);
        model.addAttribute("dropdown", "board");

        logger.info("total count" + board_list.size() );
		

		return "board/board";
	}
	
	// 게시판 상세보기
    // PathVariable 어노테이션을 이용하여 RESTful 방식 적용
    // board/1 -> id = 1; id = 게시물 번호로 인식함.
    // 일반 적으로 (@ReuqstParam(value = "board", required = false, defaultValue = "0"), int idx, Model model)
    @RequestMapping("/board/{idx}.do")
    public String displayBoardDetailView(@PathVariable int idx, Model model, HttpSession session) {
        logger.info("display view Board view idx = {}", idx);
        System.out.println("display view Board view idx = " + idx);
        
        if(session.getAttribute("userLoginInfo") == null || "".equals(session.getAttribute("userLoginInfo"))){
			logger.info("You don't login.");
			System.out.println("You don't login.");
			return "defaults/login";
		}
        Tboard tboard = this.boardService.getSelectOne(idx);

        model.addAttribute("tboard", tboard);
        model.addAttribute("dropdown", "board");
        return "board/view";
    }
    
    // 게시판 쓰기
    @RequestMapping(value = "/board/write.do", method = RequestMethod.GET)
    public String displayBoardWrite(@RequestParam(value="idx", defaultValue="0") int idx, Model model, HttpSession session) {
        logger.info("display view Board write");
        System.out.println("display view Board write");
        
        if(session.getAttribute("userLoginInfo") == null || "".equals(session.getAttribute("userLoginInfo"))){
			logger.info("You don't login.");
			System.out.println("You don't login.");
			return "defaults/login";
		}

        if (idx > 0) { // 수정하기를 눌렀을 경우
        	logger.info("display view Board modify");
        	System.out.println("display view Board modify");
            Tboard tboard = this.boardService.getSelectOne(idx);
            model.addAttribute("tboard", tboard);
        }
        model.addAttribute("dropdown", "board");

        return "board/write";
    }
    
    @RequestMapping(value = "/board/write_ok.do", method = RequestMethod.POST)
    public String procBbsWrite(@ModelAttribute("tboard") Tboard tboard, RedirectAttributes redirectAttributes, HttpSession session) {
    	logger.info("display view Board write_ok");
        System.out.println("display view Board write_ok");
        
        Tcustomer customer = (Tcustomer) session.getAttribute("userLoginInfo");
        
        if(session.getAttribute("userLoginInfo") == null || "".equals(session.getAttribute("userLoginInfo"))){
			logger.info("You don't login.");
			System.out.println("You don't login.");
			return "defaults/login";
		}
        
        Integer idx = tboard.getIdx();
        tboard.setAuthor(customer.getCust_name());
        tboard.setInsert_id(customer.getCust_id());
        
        if (idx == null || idx == 0) { //새로입력
            this.boardService.insertBoard(tboard);
            redirectAttributes.addFlashAttribute("message", "추가되었습니다.");
            System.out.println("Board insert ok");
            return "redirect:/board/board.do";
        } else { //수정
            this.boardService.updateBoard(tboard);
            redirectAttributes.addFlashAttribute("message", "수정되었습니다.");
            System.out.println("Board modify ok");
            return "redirect:/board/board.do";
        }
    }
}

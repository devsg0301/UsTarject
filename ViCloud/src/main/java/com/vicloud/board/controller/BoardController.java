package com.vicloud.board.controller;

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

import com.vicloud.board.service.BoardService;
import com.vicloud.model.Tboard;
import com.vicloud.model.Tboard_comment;
import com.vicloud.model.Tbroadcast;
import com.vicloud.model.Tcustomer;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	// 블로그 이동
	@RequestMapping(value = "/blog/blog-home.do", method = RequestMethod.GET)
	public String displayBlog(HttpSession session, Model model){
		logger.info("main page start");
		System.out.println("start page blog-home");
		
		List<Tbroadcast> broadcastList = this.boardService.getBroadcastList();
		
		model.addAttribute("broadcastList", broadcastList);
		model.addAttribute("dropdown", "blog");
		
		return "blog/blog-home";
	}
	
	// 게시판 상세보기
    // PathVariable 어노테이션을 이용하여 RESTful 방식 적용
    // board/1 -> id = 1; id = 게시물 번호로 인식함.
    // 일반 적으로 (@ReuqstParam(value = "board", required = false, defaultValue = "0"), int idx, Model model)
    @RequestMapping("/blog/{idx}.do")
    public String displayBlogDetailView(@PathVariable int idx, Model model, HttpSession session) {
        logger.info("display view Board view idx = {}", idx);
        System.out.println("display view Board view idx = " + idx);
        
//		if(session.getAttribute("userLoginInfo") == null || "".equals(session.getAttribute("userLoginInfo"))){
//			logger.info("You don't login.");
//			System.out.println("You don't login.");
//			return "defaults/login";
//		}
        Tbroadcast broadcastDetail = this.boardService.broadcastDetail(idx);
        
        //List<Tboard_comment> tboard_comment_list = this.boardService.boardCommentList(idx); // 댓글 보기

        model.addAttribute("broadcastDetail", broadcastDetail);
        //model.addAttribute("tboard_comment_list", tboard_comment_list);
        //model.addAttribute("total_comments", tboard_comment_list.size());
        model.addAttribute("dropdown", "blog");
        return "blog/blog-post";
    }
    
    // 게시판 쓰기 폼
    @RequestMapping(value = "/blog/blog-add.do", method = RequestMethod.GET)
    public String displayBoardAdd(@RequestParam(value="idx", defaultValue="0") int idx, Model model, HttpSession session) {
        logger.info("display view Board add");
        System.out.println("display view Board add");
        
//        if(session.getAttribute("userLoginInfo") == null || "".equals(session.getAttribute("userLoginInfo"))){
//			logger.info("You don't login.");
//			System.out.println("You don't login.");
//			return "defaults/login";
//		}

        if (idx > 0) { // 수정하기를 눌렀을 경우
        	logger.info("display view Board modify");
        	System.out.println("display view Board modify");
        	Tbroadcast broadcast = this.boardService.getSelectBroadcast(idx);
            model.addAttribute("broadcast", broadcast);
        }
        model.addAttribute("dropdown", "blog");

        return "blog/blog-add";
    }
    
    // 게시판 쓰기 저장
    @RequestMapping(value = "/blog/add_ok.do", method = RequestMethod.POST)
    public String procBoardAdd(@ModelAttribute("tbroadcast") Tbroadcast tbroadcast, RedirectAttributes redirectAttributes, HttpSession session) {
    	logger.info("display view Board write_ok");
        System.out.println("display view Board write_ok");
        
//        Tcustomer customer = (Tcustomer) session.getAttribute("userLoginInfo");
//        
//        if(session.getAttribute("userLoginInfo") == null || "".equals(session.getAttribute("userLoginInfo"))){
//			logger.info("You don't login.");
//			System.out.println("You don't login.");
//			return "defaults/login";
//		}
        
        Integer idx = tbroadcast.getIdx();
        tbroadcast.setGrade("all");
        tbroadcast.setUrl("http://39.125.133.27:8081/LocalUser/data/"+tbroadcast.getCategory()+"/"+tbroadcast.getGenre() + "/" + tbroadcast.getFilename());
        
        System.out.println(tbroadcast.getGenre());
        
        if (idx == null || idx == 0) { //새로입력
            this.boardService.insertBroadcast(tbroadcast);
            redirectAttributes.addFlashAttribute("message", "추가되었습니다.");
            System.out.println("Sucess Board insert");
            return "redirect:/blog/blog-home.do";
        } else { //수정
            this.boardService.updateBroadcast(tbroadcast);
            redirectAttributes.addFlashAttribute("message", "수정되었습니다.");
            System.out.println("Sucess Board modify");
            return "redirect:/blog/blog-home.do";
        }
    }
    
/* 
 * ************************************************************************************************************
 * */
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
        List<Tboard> tboard_list = this.boardService.getBoardList();
        model.addAttribute("tboard_list", tboard_list);
        model.addAttribute("dropdown", "board");

        logger.info("total count" + tboard_list.size() );
		

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
        
        List<Tboard_comment> tboard_comment_list = this.boardService.boardCommentList(idx); // 댓글 보기

        model.addAttribute("tboard", tboard);
        model.addAttribute("tboard_comment_list", tboard_comment_list);
        model.addAttribute("total_comments", tboard_comment_list.size());
        model.addAttribute("dropdown", "board");
        return "board/view";
    }
    
    // 게시판 쓰기 폼
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
    
    // 게시판 쓰기 저장
    @RequestMapping(value = "/board/write_ok.do", method = RequestMethod.POST)
    public String procBoardWrite(@ModelAttribute("tboard") Tboard tboard, RedirectAttributes redirectAttributes, HttpSession session) {
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
            System.out.println("Sucess Board insert");
            return "redirect:/board/board.do";
        } else { //수정
            this.boardService.updateBoard(tboard);
            redirectAttributes.addFlashAttribute("message", "수정되었습니다.");
            System.out.println("Sucess Board modify");
            return "redirect:/board/board.do";
        }
    }
    
    //댓글 저장
    @RequestMapping(value = "/board/comment_ok.do", method = RequestMethod.POST)
    public String procBoardCommentWrite(@ModelAttribute("tboard_comment") Tboard_comment tboard_comment, HttpSession session){
    	logger.info("Start Board comment write.");
        System.out.println("Start Board comment write.");
    	
    	Tcustomer customer = (Tcustomer) session.getAttribute("userLoginInfo");
    	
    	int idx 	= tboard_comment.getIdx();
    	int seq 	= tboard_comment.getSeq();
    	int idx_no	= tboard_comment.getIdx_no();
    	int seq_re	= tboard_comment.getSeq_re();
    	int seq_no 	= tboard_comment.getSeq_no();
    	int gap 	= tboard_comment.getGap();
    	
    	System.out.println("idx : " + idx + ", seq : " + seq + ", seq_re : " + seq_re + ", seq_no : " + seq_no + ", gap : " + gap);
    	
    	if("0".equals(seq_re) || "".equals(seq_re)){ //가장 최상위 댓글일 경우
    		Integer maxSeqNo = this.boardService.maxSeqNo(idx);
    		Integer maxIdxNo = this.boardService.maxIdxNo(idx);
    		tboard_comment.setSeq_no(maxSeqNo + 1);
    		tboard_comment.setIdx_no(maxIdxNo + 1);
    	}else{
    		Integer max_seq_no = this.boardService.maxSeqReNo(idx, idx_no, seq, gap); //댓글 쓰려는 곳 중에 마지막 번호
    		if(max_seq_no != null){
    			seq_no = max_seq_no;
    		}
    		this.boardService.updateSeqNo(idx, seq_no); //댓글의 순서를 정하기 위해 기존 댓글을 1씩 증가한다.
    		tboard_comment.setSeq_no(seq_no + 1); //지금 쓸 댓글의 순서를 정한다.
    		tboard_comment.setGap(gap + 2); //댓글의 간격을 증가한다.
    		tboard_comment.setSeq_re(seq); //상위 댓글번호를  seq_re에 입력
    	}
    	
    	tboard_comment.setAuthor(customer.getCust_name());
    	tboard_comment.setInsert_id(customer.getCust_id());
    	
    	this.boardService.insertBoardComment(tboard_comment);
    	System.out.println("Sucess Board comment insert");
    	
    	return "redirect:/board/"+ idx +".do";
    }
    
    //댓글 삭제
    @RequestMapping(value = "/board/comment_delete.do", method = RequestMethod.GET)
    public String deleteBoardComment(@RequestParam(value="idx") int idx, @RequestParam(value="idx_no") int idx_no, 
    		@RequestParam(value="seq") int seq, @RequestParam(value="gap") int gap, HttpSession session){
    	logger.info("Start Board comment delete.");
        System.out.println("Start Board comment delete.");
        
        System.out.println("idx : " + idx + ", seq : " + seq);
        Tcustomer customer = (Tcustomer) session.getAttribute("userLoginInfo");
        
        this.boardService.deleteBoardComment(seq, customer.getCust_id()); //선택 댓글 삭제
        System.out.println("Sucess Board comment delete.");
        this.boardService.deleteBoardReComment(idx, idx_no, seq, gap); //선택 댓글의 하위 댓글 삭제
        System.out.println("Sucess Board reComment delete.");
        
    	return "redirect:/board/"+ idx +".do";
    }
}

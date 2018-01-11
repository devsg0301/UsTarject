package com.beemosg.board.controller;

import java.io.File;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;	
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.beemosg.board.service.BoardService;
import com.beemosg.common.Const;
import com.beemosg.model.Tboard;
import com.beemosg.model.Tboard_comment;
import com.beemosg.model.Tbroadcast;
import com.beemosg.model.Tbroadcast_comment;
import com.beemosg.model.Tcustomer;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	// sgCloud 이동
	@RequestMapping(value = "/sgCloud/sgCloud_main.do", method = RequestMethod.GET)
	public String displaySgCloud(@RequestParam(value="rnum", defaultValue="1") int rnum, 
			@RequestParam(value="category", defaultValue="") String category,
			@RequestParam(value="genre", defaultValue="") String genre,			
			@RequestParam(value="genre2", defaultValue="") String genre2,			
			@RequestParam(value="foldername", defaultValue="") String foldername,			
			@RequestParam(value="searchWord", defaultValue="") String searchWord,
			HttpSession session, HttpServletRequest request, Model model) throws Exception {
		logger.info("sgCloud Main");
		int totalBroadcast = 0;
		int prev = 0;
		int next = 0;
		List genreList = null;
		List folderList = null;
		Tcustomer customer = null;
		boolean isMobile = false;
		
		try{			
			if(session.getAttribute(Const.USER_KEY) == null || "".equals(session.getAttribute(Const.USER_KEY))){
				logger.info("You don't login.");
				model.addAttribute("forwardUrl", "/sgCloud/sgCloud_main.do");
				return "defaults/login";
			}else{
				isMobile = isMobile(request.getHeader("User-Agent"));
				customer = (Tcustomer)session.getAttribute(Const.USER_KEY);
				if(!customer.getCust_gb().equals("20")){
					if(isMobile){
    					return "redirect:/sgCloud/sgCloud_board.do?gubun=level&check=ok#view_position";
    				}else{
    					return "redirect:/sgCloud/sgCloud_board.do?gubun=level&check=ok";
    				}
				}
			}

			if(!foldername.equals("")){
				this.boardService.updateHitCount(foldername);
			}
			
			if(!"".equals(searchWord) && searchWord != null){
				searchWord = "%"+ searchWord +"%";
			}else{
				searchWord = "%%";
			}
			//if(category.equals("all") || category.equals("")){
				//category = "%%";
				//genre = "%%";
				//foldername = "%%";
			//}else{
				category = "%" + category + "%";
				genreList = this.boardService.getGenerList(category);
				//if(!genre.equals("")){
					genre = "%" + genre + "%";
					foldername = "%" + foldername.replaceAll("%20", " ") + "%";
					folderList = this.boardService.getFolderList(category, genre);
				//}else{
					//genre = "%%";
					//foldername = "%%";
				//}
			//}
	
			logger.info("rnum : " + rnum);
			logger.info("category : " + category + ", genre : " + genre + ", foldername : " + foldername + ", searchWord : " + searchWord);
			
			List<Tbroadcast> broadcastList = this.boardService.getBroadcastList((rnum * 16) - 15, category, genre, foldername, searchWord);
			totalBroadcast = boardService.totalBroadcast(category, genre, foldername, searchWord);
			
			if(rnum > 1){
				prev = rnum - 1;
			}
			if(rnum < totalBroadcast / 16 ){
				next = rnum + 1;
			}else if(rnum == totalBroadcast / 16){
				if(totalBroadcast % 16 > 0){
					next = rnum + 1;
				}
			}
			logger.info("prev : " + prev + ", next : " + next);
			
			List categoryList = this.boardService.getCategoryList();
			
			model.addAttribute("broadcastList", broadcastList);
			model.addAttribute("searchWord", searchWord.replaceAll("%", ""));
			model.addAttribute("categoryList", categoryList);
			model.addAttribute("category", category.replaceAll("%", ""));
			model.addAttribute("genreList", genreList);
			model.addAttribute("genre", genre.replaceAll("%", ""));
			model.addAttribute("folderList", folderList);
			model.addAttribute("foldername", foldername.replaceAll("%", ""));
			model.addAttribute("totalBroadcast", totalBroadcast);
			model.addAttribute("rnum", rnum);
			model.addAttribute("prev", prev);
			model.addAttribute("next", next);
			model.addAttribute("dropdown", "sgCloud");
		}
		catch(Exception e){
			logger.error("sgCloud/sgCloud_main.do ERROR, " + e.getMessage());
		}
		return "sgCloud/sgCloud_main";
	}
	
	// 게시판 상세보기
    // PathVariable 어노테이션을 이용하여 RESTful 방식 적용
    // board/1 -> id = 1; id = 게시물 번호로 인식함.
    // 일반 적으로 (@ReuqstParam(value = "board", required = false, defaultValue = "0"), int idx, Model model)
    @RequestMapping("/sgCloud/{idx}.do")
    public String displaySgCloudDetailView(@PathVariable int idx, Model model, HttpSession session, HttpServletRequest request) throws Exception {
        logger.info("display view Board view idx = {}", idx);
        Tcustomer customer = null;
        boolean isMobile = false;
        try{
        	if(session.getAttribute(Const.USER_KEY) == null || "".equals(session.getAttribute(Const.USER_KEY))){
        		logger.info("You don't login.");
        		model.addAttribute("forwardUrl", "/sgCloud/" + idx + ".do");
        		return "defaults/login";
        	}else{
        		isMobile = isMobile(request.getHeader("User-Agent"));
        		customer = (Tcustomer)session.getAttribute(Const.USER_KEY);
        		if(!customer.getCust_gb().equals("20")){
        			if(isMobile){
    					return "redirect:/sgCloud/sgCloud_board.do?gubun=level&check=ok#view_position";
    				}else{
    					return "redirect:/sgCloud/sgCloud_board.do?gubun=level&check=ok";
    				}
        		}
        	}
	        //Tcustomer customer = (Tcustomer) session.getAttribute(Const.USER_KEY);
	        
	        Tbroadcast broadcastDetail = this.boardService.broadcastDetail(idx);
	        
	        List<Tbroadcast_comment> tbroadcast_comment_list = this.boardService.broadcastCommentList(idx); // 댓글 보기
	
	        model.addAttribute("broadcastDetail", broadcastDetail);
	        model.addAttribute("tbroadcast_comment_list", tbroadcast_comment_list);
	        model.addAttribute("idx", idx);
	        model.addAttribute("customer", customer);
	        //model.addAttribute("total_comments", tboard_comment_list.size());
	        model.addAttribute("dropdown", "sgCloud");
        }
        catch(Exception e){
			logger.error("sgCloud/"+ idx +".do ERROR, " + e.getMessage());
		}
        return "sgCloud/sgCloud_view";
    }
    
    // 게시판 쓰기 폼
    @RequestMapping(value = "/sgCloud/sgCloud_add.do", method = RequestMethod.GET)
    public String displayBroadcastAdd(@RequestParam(value="idx", defaultValue="0") int idx, Model model, HttpSession session, HttpServletRequest request) throws Exception {
        logger.info("display view Board add");
        Tcustomer customer = null;
        try{
	        if(session.getAttribute(Const.USER_KEY) == null || "".equals(session.getAttribute(Const.USER_KEY))){
				logger.info("You don't login.");
				//request.setAttribute("forwardUrl", "/sgCloud/sgCloud_add.do");
				model.addAttribute("forwardUrl", "/sgCloud/sgCloud_add.do");
				return "defaults/login";
			}else{
				customer = (Tcustomer)session.getAttribute(Const.USER_KEY);
				if(!customer.getAdmin_yn().equals("1")){
					return "redirect:/sgCloud/sgCloud_main.do";
				}
			}
	        
	        if (idx > 0) { // 수정하기를 눌렀을 경우
	        	logger.info("display view Board modify");
	        	Tbroadcast tbroadcast = this.boardService.getSelectBroadcast(idx);
	        	if(!tbroadcast.getSub_url().equals("")){
	        		tbroadcast.setSub_check(true);
	        	}
	        	int nFileIndex = tbroadcast.getFilename().lastIndexOf(".");
	        	int lastIndex = tbroadcast.getFilename().length();
	        	
	        	tbroadcast.setExtension(tbroadcast.getFilename().substring(nFileIndex, lastIndex));
	            model.addAttribute("broadcast", tbroadcast);
	        }
	        model.addAttribute("dropdown", "file_add");
        }
        catch(Exception e){
			logger.error("sgCloud/sgCloud_add.do ERROR, " + e.getMessage());
		}
        return "sgCloud/sgCloud_add";
    }
    
    // 게시판 쓰기 저장
    @RequestMapping(value = "/sgCloud/add_ok.do", method = RequestMethod.POST)
    public String procBroadcastAdd(@ModelAttribute("tbroadcast") Tbroadcast tbroadcast, 
    		RedirectAttributes redirectAttributes, HttpSession session, HttpServletRequest request) throws Exception {
    	logger.info("display view Broadcast write_ok");

    	Tcustomer customer = null;
    	boolean isMobile = false;
    	try{
    		if(session.getAttribute(Const.USER_KEY) == null || "".equals(session.getAttribute(Const.USER_KEY))){
    			logger.info("You don't login.");
    			return "defaults/login";
    		}else{
    			isMobile = isMobile(request.getHeader("User-Agent"));
    			customer = (Tcustomer)session.getAttribute(Const.USER_KEY);
    			if(!customer.getCust_gb().equals("20")){
    				if(isMobile){
    					return "redirect:/sgCloud/sgCloud_board.do?gubun=level&check=ok#view_position";
    				}else{
    					return "redirect:/sgCloud/sgCloud_board.do?gubun=level&check=ok";
    				}
    			}
    		}
	        
    		if(tbroadcast.getCategory().equals("UTILITY") || tbroadcast.getExtension().equals("none")){
	        	tbroadcast.setExtension("");
	        }else if(tbroadcast.getExtension() == null || tbroadcast.getExtension().equals("")){
	        	tbroadcast.setExtension(".mp4");
	        }
	
	        tbroadcast.setFilename(tbroadcast.getTitle()+tbroadcast.getExtension());
	        
	        //int nFileIndex = tbroadcast.getFilename().lastIndexOf(".");        
	        
	        Integer idx = tbroadcast.getIdx();
	        if(tbroadcast.getCategory().equals("MUSIC")){
	        	tbroadcast.setFile_url(tbroadcast.getCategory() + "/" + tbroadcast.getGenre() + "/" + tbroadcast.getFoldername() + "/" + tbroadcast.getAlbumname() + "/" + tbroadcast.getFilename());
	        }else{
	        	tbroadcast.setFile_url(tbroadcast.getCategory() + "/" + tbroadcast.getGenre() + "/" + tbroadcast.getFoldername() + "/" + tbroadcast.getFilename());
	        }
	        if(tbroadcast.isSub_check()){
	        	tbroadcast.setSub_url(tbroadcast.getTitle());
	        }else{
	        	tbroadcast.setSub_url("");
	        }
	        if(tbroadcast.getGrade().equals("전체")){
	        	tbroadcast.setGrade("0");
	        }
	        
	        if (idx == null || idx == 0) { //새로입력
	            this.boardService.insertBroadcast(tbroadcast);
	            redirectAttributes.addFlashAttribute("message", "추가되었습니다.");
	            logger.info("Sucess Board insert");
	        } else { //수정
	            this.boardService.updateBroadcast(tbroadcast);
	            redirectAttributes.addFlashAttribute("message", "수정되었습니다.");
	            logger.info("Sucess Board modify");
	        }
    	}
    	catch(Exception e){
			logger.error("sgCloud/add_ok.do ERROR, " + e.getMessage());
		}
    	
        return "redirect:/sgCloud/sgCloud_main.do";
    }
    
    //댓글 저장
    @RequestMapping(value = "/broadcast/comment_ok.do", method = RequestMethod.POST)
    public String procBroadcastCommentWrite(@ModelAttribute("tbroadcast_comment") Tbroadcast_comment tbroadcast_comment, 
    		Model model, HttpSession session, HttpServletRequest request) throws Exception {
    	logger.info("Start Broadcast comment write.");
    	
    	Tcustomer customer = null;
    	int idx 	= tbroadcast_comment.getIdx();
    	int seq_re	= tbroadcast_comment.getSeq_re();
    	int gap 	= tbroadcast_comment.getGap();    	
    	boolean isMobile = false;
    	try{
    		if(session.getAttribute(Const.USER_KEY) == null || "".equals(session.getAttribute(Const.USER_KEY))){
    			logger.info("You don't login.");
    			//model.addAttribute("forwardUrl", "/broadcast/comment_ok.do");
    			return "defaults/login";
    		}else{
    			isMobile = isMobile(request.getHeader("User-Agent"));
    			customer = (Tcustomer)session.getAttribute(Const.USER_KEY);
    			if(!customer.getCust_gb().equals("20")){
    				if(isMobile){
    					return "redirect:/sgCloud/sgCloud_board.do?gubun=level&check=ok#view_position";
    				}else{
    					return "redirect:/sgCloud/sgCloud_board.do?gubun=level&check=ok";
    				}
    			}
    		}
	    	//customer = (Tcustomer) session.getAttribute(Const.USER_KEY);
	    	
	    	if(seq_re == 0){ //가장 최상위 댓글일 경우
	    		Integer maxSeqNo = this.boardService.maxSeqNo(idx);
	    		if(maxSeqNo == null){
	    			maxSeqNo = 0;
	    		}
	    		Integer maxIdxNo = this.boardService.maxIdxNo(idx);
	    		if(maxIdxNo == null){
	    			maxIdxNo = 0;
	    		}
	    		tbroadcast_comment.setSeq_no(maxSeqNo + 1);
	    		tbroadcast_comment.setIdx_no(maxIdxNo + 1);
	    		tbroadcast_comment.setGap(0);
	    	}else{
	    		int seq = tbroadcast_comment.getSeq();
	    		int idx_no	= tbroadcast_comment.getIdx_no();
	    		int seq_no 	= tbroadcast_comment.getSeq_no();
	    		Integer max_seq_no = this.boardService.maxSeqReNo(idx, idx_no, seq, gap); //댓글 쓰려는 곳 중에 마지막 번호
	    		if(max_seq_no != null){
	    			seq_no = max_seq_no;
	    		}
	    		this.boardService.updateSeqNo(idx, seq_no); //댓글의 순서를 정하기 위해 기존 댓글을 1씩 증가한다.
	    		tbroadcast_comment.setSeq_no(seq_no + 1); //지금 쓸 댓글의 순서를 정한다.
	    		tbroadcast_comment.setGap(gap + 2); //댓글의 간격을 증가한다.
	    		tbroadcast_comment.setSeq_re(seq); //상위 댓글번호를  seq_re에 입력
	    	}
	    	
	    	tbroadcast_comment.setAuthor(customer.getCust_name());
	    	tbroadcast_comment.setInsert_id(customer.getCust_id());
	    	
	    	this.boardService.insertBroadcastComment(tbroadcast_comment);
	    	logger.info("Sucess Broadcast comment insert");
    	}
    	catch(Exception e){
			logger.error("broadcast/comment_ok.do ERROR, " + e.getMessage());
		}
    	return "redirect:/sgCloud/"+ idx +".do";
    }
    
    // 파일다운로드
    @RequestMapping(value = "/sgCloud/fileDownload.do", method = RequestMethod.GET)
    public void fileDownload(@RequestParam(value="fileUrl", defaultValue="") String fileUrl, Model model,
    		@RequestParam(value="fileName", defaultValue="") String fileName, @RequestHeader("User-Agent") String userAgent, 
    		HttpServletResponse response, HttpServletRequest request, HttpSession session) throws Exception{
    	
    	Tcustomer customer = null;
        //File file = new File(fileUrl);
        try {
	        InputStream is = null;
	        customer = (Tcustomer)session.getAttribute(Const.USER_KEY);
	        
	        logger.info("------Download Start------");
	        logger.info("Cust ID : " + customer.getCust_id());
	        logger.info("fileName : " + fileName + ", fileUrl : " + fileUrl);
	        
	        char[] txtChar = fileUrl.toCharArray();
	        for (int j = 0; j < txtChar.length; j++) {
	            if (txtChar[j] >= '\uAC00' && txtChar[j] <= '\uD7A3' || txtChar[j] == '\u0020' || txtChar[j] == 'ㆍ') {
	                String targetText = String.valueOf(txtChar[j]);
	                try {
	                	if(txtChar[j] == '\u0020'){ //공백 문자변환
	                		fileUrl = fileUrl.replace(targetText, "%20");
	                	} else if(txtChar[j] == 'ㆍ'){//ㆍ 문자변환
	                		fileUrl = fileUrl.replace(targetText, "%E3%86%8D");
	                	} else{
	                		fileUrl = fileUrl.replace(targetText, URLEncoder.encode(targetText, "UTF-8"));
	                	} 
	                } catch (UnsupportedEncodingException e) {
	                    e.printStackTrace();
	                }
	            } 
	        }
	        
	        URL url = new URL("http://211.200.138.35:8081/LocalUser/data/" + fileUrl);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        is = conn.getInputStream();
	        
	        int file_size = conn.getContentLength();
	        
	        switch (getBrowser(userAgent)) {
	            case Chrome:
	            case Opear:
	            case Firefox:
	                response.setHeader("Content-Disposition", "attachment; filename=\""
	                        + new String(fileName.getBytes("UTF-8"), "ISO-8859-1").replaceAll("\\+", "%20") + "\"");
	                break;
	            case MSIE:
	                response.setHeader("Content-Disposition", "attachment;filename="
	                        + URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20") + ";");
	                
	                break;
	            default:
	                response.setHeader("Content-Disposition", "attachment;filename=" 
	                		+ URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20") + ";");
	                break;
	        }
	
	        response.setContentType("application/octet-stream;charset=utf-8");
	        response.setContentLength(file_size);
	        response.setHeader("Pragma", "no-cache;");
	        response.setHeader("Expires", "-1;");
	        response.setHeader("Content-Transfer-Encoding", "binary");
	        response.setHeader("Connection", "close");
	        FileCopyUtils.copy(is, response.getOutputStream());
	        logger.info("------Download End------");
        } catch (Exception e) {
        	logger.error("fileDownload ERROR, " + e.getMessage());
		}
    	
    	/*
    	OutputStream os = null;
    	URLConnection uCon = null;
    	
    	InputStream is = null;
    	try {
			System.out.println("------Download Start------");
			
			byte[] buf;
			int byteRead;
			int byteWritten = 0;
			
			URL url = new URL(fileurl);
			os = new BufferedOutputStream(new FileOutputStream(""));
			
			uCon = url.openConnection();
			is = uCon.getInputStream();
			buf = new byte[size];
			
			while((byteRead = is.read(buf)) != -1){
				os.write(buf, 0, byteRead);
				byteWritten += byteRead;
			}
			
			System.out.println("Download Successfully.");
			System.out.println("of bytes : " + byteWritten);
			System.out.println("------Download End-------");
    	
    	} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try{
				is.close();
				os.close();
			} catch(IOException e){
				e.printStackTrace();
			}
		}
    	*/
    	/*
    	model.addAttribute("fileName", fileName);
    	model.addAttribute("fileUrl", fileUrl);
    	
    	request.setAttribute("fileName", fileName);
    	request.setAttribute("fileUrl", fileUrl);
    	
    	return "sgCloud/fileDownload";
    	*/
    }
    
    private Browser getBrowser(String userAgent) {
        if (userAgent.contains("MSIE") || userAgent.contains("Trident")) {
            return Browser.MSIE;
        } else if (userAgent.contains("Chrome")) {
            return Browser.Chrome;
        } else if (userAgent.contains("Opera")) {
            return Browser.Opear;
        }
        return Browser.Firefox;
    }
    
    private boolean isMobile(String agent){
    	if (agent.indexOf("iPhone") > -1 && agent.indexOf("Mobile") > -1) {
    		return true;
    	} else if (agent.indexOf("Android") > -1 && agent.indexOf("Mobile") > -1) {
    		return true;
    	}else{
    		return false;
    	}
    }

    private enum Browser {
        MSIE, Chrome, Opear, Firefox
    }
     // 
 	@RequestMapping(value = "/sgCloud/sgCloud_board.do", method = RequestMethod.GET)
 	public String displayBoard(@RequestParam(value="rnum", defaultValue="1") int rnum,
 			@RequestParam(value="gubun", defaultValue="level") String gubun,
 			@RequestParam(value="check", defaultValue="no") String check,
 			HttpSession session, Model model) throws Exception {
 		logger.info("sgCloud Main");
 		int totalBoard = 0;
 		int prev = 0;
 		int next = 0; 		
 		Tcustomer customer = null;
 		try{
 			if(session.getAttribute(Const.USER_KEY) == null || "".equals(session.getAttribute(Const.USER_KEY))){
 				logger.info("You don't login.");
 				model.addAttribute("forwardUrl", "/sgCloud/sgCloud_main.do");
 				return "defaults/login";
 			}
 			
 			customer = (Tcustomer)session.getAttribute(Const.USER_KEY);
 			
 			logger.info("rnum : " + rnum);
 			
 			List<Tboard> boardList = this.boardService.getBoardList((rnum * 16) - 15, gubun);
 			
 			if(rnum > 1){
 				prev = rnum - 1;
 			}
 			if(rnum < totalBoard / 16 ){
 				next = rnum + 1;
 			}else if(rnum == totalBoard / 16){
 				if(totalBoard % 16 > 0){
 					next = rnum + 1;
 				}
 			}
 			logger.info("prev : " + prev + ", next : " + next);
 			
 			
 			model.addAttribute("totalBoard", totalBoard);
 			model.addAttribute("boardList", boardList);
 			model.addAttribute("rnum", rnum);
 			model.addAttribute("prev", prev);
 			model.addAttribute("next", next);
 			model.addAttribute("gubun", gubun);
 			model.addAttribute("check", check);
 			model.addAttribute("dropdown", gubun);
 		}
 		catch(Exception e){
 			logger.error("sgCloud/sgCloud_board.do ERROR, " + e.getMessage());
 		}
 		return "sgCloud/sgCloud_board";
 	}
 	
 	// 게시판 쓰기 폼
 	@RequestMapping(value = "/sgCloud/sgCloud_boardwrite.do", method = RequestMethod.GET)
 	public String displayBoardWrite(@RequestParam(value="idx", defaultValue="0") int idx,
 			@RequestParam(value="gubun", defaultValue="level") String gubun,
 			Model model, HttpSession session) throws Exception{
 		logger.info("display view Board write");
 		
 		try {
	 		if(session.getAttribute(Const.USER_KEY) == null || "".equals(session.getAttribute(Const.USER_KEY))){
	 			logger.info("You don't login.");
	 			model.addAttribute("forwardUrl", "/sgCloud/sgCloud_boardwrite.do");
	 			return "defaults/login";
	 		}
	 		
	 		if (idx > 0) { // 수정하기를 눌렀을 경우
	 			logger.info("display view Board modify");
	 			Tboard board = this.boardService.getSelectOne(idx);
	 			model.addAttribute("board", board);
	 		}
	 		model.addAttribute("dropdown", gubun);
	 		model.addAttribute("gubun", gubun);
 		
 		} catch (Exception e) {
 			logger.error("sgCloud/sgCloud_boardwrite.do ERROR, " + e.getMessage());
 		}
 		return "sgCloud/sgCloud_boardwrite";
 	}
 	
 	// 게시판 쓰기 저장
 	@RequestMapping(value = "/sgCloud/sgCloud_boardwrite_ok.do", method = RequestMethod.POST)
 	public String procBoardWrite(@ModelAttribute("tboard") Tboard tboard,
 			RedirectAttributes redirectAttributes, Model model, HttpSession session) throws Exception{
 		logger.info("display view Board write_ok");
 		
 		Tcustomer customer = null;
 		
 		try {
	 		if(session.getAttribute(Const.USER_KEY) == null || "".equals(session.getAttribute(Const.USER_KEY))){
	 			logger.info("You don't login.");
	 			model.addAttribute("forwardUrl", "/sgCloud/sgCloud_boardwrite.do");
	 			return "defaults/login";
	 		}
	 		
	 		customer = (Tcustomer) session.getAttribute(Const.USER_KEY);
	 		
	 		Integer idx = tboard.getIdx();
	 		tboard.setAuthor(customer.getCust_name());
	 		tboard.setInsert_id(customer.getCust_id());
	 		
	 		if (idx == null || idx == 0) { //새로입력
	 			this.boardService.insertBoard(tboard);
	 			redirectAttributes.addFlashAttribute("message", "추가되었습니다.");
	 			logger.info("Sucess Board insert");	 			
	 		} else { //수정
	 			this.boardService.updateBoard(tboard);
	 			redirectAttributes.addFlashAttribute("message", "수정되었습니다.");
	 			logger.info("Sucess Board modify");	 			
	 		}
 		} catch (Exception e) {
 			logger.error("sgCloud/sgCloud_boardWrite_ok.do ERROR, " + e.getMessage());
 		}
 		return "redirect:/sgCloud/sgCloud_board.do?gubun="+tboard.getGubun();
 	}
 	
 	@RequestMapping("/sgCloud/levelup/{idx}.do")
    public String updateCustgb(@PathVariable int idx, Model model, HttpSession session) throws Exception {
        logger.info("Update Cust_gb idx = {}", idx);
        Tcustomer customer = null;
        
        try{
        	if(session.getAttribute(Const.USER_KEY) == null || "".equals(session.getAttribute(Const.USER_KEY))){
        		logger.info("You don't login.");
        		return "defaults/login";
        	}else{
        		customer = (Tcustomer)session.getAttribute(Const.USER_KEY);
        		if(!customer.getAdmin_yn().equals("1")){
        			return "redirect:/sgCloud/sgCloud_main.do";
        		}
        	}
	        
        	this.boardService.updateCustomer(idx);
	
	        //model.addAttribute("total_comments", tboard_comment_list.size());
	        model.addAttribute("dropdown", "level");
        }
        catch(Exception e){
			logger.error("sgCloud/"+ idx +".do ERROR, " + e.getMessage());
		}
        return "redirect:/sgCloud/sgCloud_board.do?gubun=level";
    }

    
/* 
 * ************************************************************************************************************
 * */
	/*// 메인페이지 이동
	@RequestMapping(value = "/board/board.do", method = RequestMethod.GET)
	public String displayMain(HttpSession session, Model model) throws Exception{
		logger.info("board page start");
		System.out.println("board page start");
		if(session.getAttribute(Const.USER_KEY) == null || "".equals(session.getAttribute(Const.USER_KEY))){
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
	*/
	// 게시판 상세보기
    // PathVariable 어노테이션을 이용하여 RESTful 방식 적용
    // board/1 -> id = 1; id = 게시물 번호로 인식함.
    // 일반 적으로 (@ReuqstParam(value = "board", required = false, defaultValue = "0"), int idx, Model model)
    @RequestMapping("/board/{idx}.do")
    public String displayBoardDetailView(@PathVariable int idx, Model model, HttpSession session) throws Exception{
        logger.info("display view Board view idx = {}", idx);
        System.out.println("display view Board view idx = " + idx);
        
        if(session.getAttribute(Const.USER_KEY) == null || "".equals(session.getAttribute(Const.USER_KEY))){
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
    
    
    //댓글 저장
    @RequestMapping(value = "/board/comment_ok.do", method = RequestMethod.POST)
    public String procBoardCommentWrite(@ModelAttribute("tboard_comment") Tboard_comment tboard_comment, HttpSession session) throws Exception{
    	logger.info("Start Board comment write.");
    	
    	Tcustomer customer = (Tcustomer) session.getAttribute(Const.USER_KEY);
    	
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
    		@RequestParam(value="seq") int seq, @RequestParam(value="gap") int gap, HttpSession session) throws Exception{
    	logger.info("Start Board comment delete.");
        System.out.println("Start Board comment delete.");
        
        System.out.println("idx : " + idx + ", seq : " + seq);
        Tcustomer customer = (Tcustomer) session.getAttribute(Const.USER_KEY);
        
        this.boardService.deleteBoardComment(seq, customer.getCust_id()); //선택 댓글 삭제
        System.out.println("Sucess Board comment delete.");
        this.boardService.deleteBoardReComment(idx, idx_no, seq, gap); //선택 댓글의 하위 댓글 삭제
        System.out.println("Sucess Board reComment delete.");
        
    	return "redirect:/board/"+ idx +".do";
    }
}

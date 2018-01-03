<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<c:set var="path_root"  value="${pageContext.request.contextPath}" scope="application"/>

<!DOCTYPE html>
<html lang="ko">

<head>
	<c:import url="../common/includecommon.jsp" />
<style type="text/css">
</style>

<script type="text/javascript">

	$(document).ready(function () {
		$("#gubun").val("${gubun}");
		
		$("#select_gubun").change(function(){
			alert("asdf"+$(this).val());
			$("#gubun").val($(this).val());
		});
	});

	var tmpUser = navigator.userAgent;
	
	function fileSearch(){
		var searchWord = $("#searchWord").val();
		location.href = "/sgCloud/sgCloud_main.do?searchWord="+searchWord;
	}
	
	/* 검색 - enter값 이벤트   */
	function EventSearchGo(e){
		var form = document.boardForm;
		if(e.keyCode == '13'){
			fileSearch();
		}
	}
	
	function fileDownload(fileUrl, fileName){
		//var eFileUrl = encodeURIComponent(fileUrl);
		//var eFileName = encodeURIComponent(fileName);
		//alert(eFileUrl);
		
		location.href = "/sgCloud/fileDownload.do?fileName="+fileName+"&fileUrl="+fileUrl;
	}
	
	function fileSearch(category, genre){
		if (!(tmpUser.indexOf("iPhone") > 0 || tmpUser.indexOf("iPod") > 0 || tmpUser.indexOf("Android ") > 0 )){
			location.href = "/sgCloud/sgCloud_main.do?category=" + category + "&genre=" + encodeURI(genre);
		}else{
			location.href = "/sgCloud/sgCloud_main.do?category=" + category + "&genre=" + encodeURI(genre) + "#view_position";
		}
	}
	
	function folderSearch(category, genre, foldername){
		if (!(tmpUser.indexOf("iPhone") > 0 || tmpUser.indexOf("iPod") > 0 || tmpUser.indexOf("Android ") > 0 )){
			location.href = "/sgCloud/sgCloud_main.do?category=" + category + "&genre=" + encodeURI(genre) + "&foldername=" + encodeURI(foldername);
		}else{
			location.href = "/sgCloud/sgCloud_main.do?category=" + category + "&genre=" + encodeURI(genre) + "&foldername=" + encodeURI(foldername) + "#view_position";
		}
	}
	
	function paging(rnum, gubun){
		if (!(tmpUser.indexOf("iPhone") > 0 || tmpUser.indexOf("iPod") > 0 || tmpUser.indexOf("Android ") > 0 )){		
			location.href = "/sgCloud/sgCloud_main.do?rnum=" + rnum + "&gubun=" + gubun;
		}else{
			location.href = "/sgCloud/sgCloud_main.do?rnum=" + rnum + "&gubun=" + gubun + "#view_position";
		}
	}

</script>
</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <c:import url="../common/header.jsp" />
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container" style="background-color: #fff; box-shadow: 0px 0px 10px 0px #6f6f6f;">
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb_sgcloud">
                    <li>
                    	<a href="/defaults/main.do">Home</a>
                    </li>
                    <li>
                    	<a href="/sgCloud/sgCloud_main.do">sgCloud</a>
                    </li>
                    <li class="active">등업게시판</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">
			<div class="col-md-3">
	            <div class="side-menu">
					<nav class="navbar navbar-default" role="navigation">
		            	<div class="side-menu-container">
		            		<ul class="nav navbar-nav">
			            		<li class="active"><a href="/sgCloud/sgCloud_main.do"><i class="fa fa-cloud"></i> 전체</a></li>
			            		<!-- Dropdown-->
					            <li class="panel panel-default" id="dropdown">
					                <a data-toggle="collapse" href="#dropdown-tv1">
					                    <i class="fa fa-television"></i> TV프로그램 <span class="caret"></span>
					                </a>
					
					                <!-- Dropdown level 1 -->
					                <div id="dropdown-tv1" class="panel-collapse collapse" >
					                    <div class="panel-body">
					                        <ul class="nav navbar-nav">
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('TV','');"><i class="fa fa-caret-right"></i>전체</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('TV','드라마');"><i class="fa fa-caret-right"></i>드라마</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('TV','예능');"><i class="fa fa-caret-right"></i>예능</a></li>
					                        </ul>
					                    </div>
					                </div>
					            </li>
					            <!-- Dropdown-->
					            <li class="panel panel-default" id="dropdown">
					                <a style="" data-toggle="collapse" href="#dropdown-movie1" >
					                    <i class="fa fa-video-camera"></i> 영화 <span class="caret"></span>
					                </a>
					
					                <!-- Dropdown level 1 -->
					                <div id="dropdown-movie1" class="panel-collapse collapse " >
					                    <div class="panel-body">
					                        <ul class="nav navbar-nav">
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('MOVIE','');"><i class="fa fa-caret-right"></i>전체</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('MOVIE','액션ㆍ전쟁');"><i class="fa fa-caret-right"></i>액션ㆍ전쟁</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('MOVIE','스릴러ㆍ범죄');"><i class="fa fa-caret-right"></i>스릴러ㆍ범죄</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('MOVIE','로멘스ㆍ멜로');"><i class="fa fa-caret-right"></i>로멘스ㆍ멜로</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('MOVIE','드라마ㆍ가족');"><i class="fa fa-caret-right"></i>드라마ㆍ가족</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('MOVIE','SFㆍ환타지');"><i class="fa fa-caret-right"></i>SFㆍ환타지</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('MOVIE','공포ㆍ호러');"><i class="fa fa-caret-right"></i>공포ㆍ호러</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('MOVIE','코미디');"><i class="fa fa-caret-right"></i>코미디</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('MOVIE','애니');"><i class="fa fa-caret-right"></i>애니</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('MOVIE','뮤지컬ㆍ음악');"><i class="fa fa-caret-right"></i>뮤지컬ㆍ음악</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('MOVIE','다큐멘터리');"><i class="fa fa-caret-right"></i>다큐멘터리</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('MOVIE','스포츠');"><i class="fa fa-caret-right"></i>스포츠</a></li>
					                        </ul>
					                    </div>
					                </div>
					            </li>
					            <li class=""><a style="" href="javascript:fileSearch('MUSIC','');"><i class="fa fa-music"></i> 노래</a></li>
					            <!-- Dropdown-->
					            <li class="panel panel-default" id="dropdown">
					                <a style="" data-toggle="collapse" href="#dropdown-utility1" >
					                    <i class="fa fa-database"></i> 유틸리티 <span class="caret"></span>
					                </a>
					
					                <!-- Dropdown level 1 -->
					                <div id="dropdown-utility1" class="panel-collapse collapse">
					                    <div class="panel-body">
					                        <ul class="nav navbar-nav">
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('UTILITY','');"><i class="fa fa-caret-right"></i>전체</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('UTILITY','소프트웨어');"><i class="fa fa-caret-right"></i>소프트웨어</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('UTILITY','보안ㆍ백신');"><i class="fa fa-caret-right"></i>보안ㆍ백신</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('UTILITY','기타설치');"><i class="fa fa-caret-right"></i>기타설치</a></li>
					                        </ul>
					                    </div>
					                </div>
					            </li>

					            <li class="panel panel-default" id="dropdown">
					                <a style="color: #333;" data-toggle="collapse" href="#dropdown-board1" aria-expanded="true">
					                    <i class="fa fa-database"></i> 자유게시판 <span class="caret"></span>
					                </a>
					
					                <!-- Dropdown level 1 -->
					                <div id="dropdown-board1" class="panel-collapse collapse in">
					                    <div class="panel-body">
					                        <ul class="nav navbar-nav">
	                                            <li style="padding-left:30px;"><a style="<c:if test="${gubun == 'level'}">font-weight: 600; color: #333;</c:if>" href="/sgCloud/sgCloud_board.do?gubun=level"><i class="fa fa-caret-right"></i>등업게시판</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${gubun == 'request'}">font-weight: 600; color: #333;</c:if>" href="/sgCloud/sgCloud_board.do?gubun=request"><i class="fa fa-caret-right"></i>자료요청게시판</a></li>
					                        </ul>
					                    </div>
					                </div>
					            </li>
					            <!-- Dropdown-->
					            <li class="" id="view_position"><a href="/sgCloud/sgCloud_add.do"><i class="fa fa-upload"></i> 파일추가</a></li>
							</ul>
			            </div>
		            </nav>
	            </div>
            </div>
            
            <div class="col-md-9">
				<div class="panel panel-default">
					<!-- Default panel contents -->
					<div class="panel-heading">
						<c:if test="${gubun == 'level'}">
							<span>등업게시판</span>
						</c:if>
						<c:if test="${gubun == 'request'}">
							<span>자료요청게시판</span>
						</c:if>						
					</div>
					<div class="well">
			            <form id="form" name="form" method="post" action="/sgCloud/sgCloud_boardwrite_ok.do">
			            	<input type="hidden" name="idx" id="idx" value="${board.idx}" />
			            	<div class="form-group">
								<label for="author" class="cols-sm-2 control-label">작성자</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
										<input type="text" class="form-control" id="author" name="author" value="${sessionScope.user.cust_name}" readonly>
									</div>
								</div>
							</div>	
							<div class="form-group">
								<label for="gubun" class="cols-sm-2 control-label">분류</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-list-ul" aria-hidden="true"></i></span>
										<select class="form-control" id="select_gubun">
											<option <c:if test="${board.gubun == 'level'}">selected</c:if> value="level">등업</option>
											<option <c:if test="${board.gubun == 'request'}">selected</c:if> value="request">자료요청</option>
										</select>
			                            <input type="hidden" class="form-control" id="gubun" name="gubun" value="${board.gubun}"/>
									</div>
								</div>
							</div>
		            		<div class="form-group">
								<label for="title" class="cols-sm-2 control-label">제목</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
										<input type="text" class="form-control" id="title" name="title" value="${board.title}" placeholder="Enter your Title" required data-validation-required-message="Please enter title.">
									</div>
								</div>
							</div>							
							<div class="form-group">
								<label for="content" class="cols-sm-2 control-label">내용</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
										<input type="text" class="form-control" id="content" name="content" value="${board.content}" placeholder="Enter your content"/>
									</div>
								</div>
							</div>							
							<div class="form-group">
								<button type="submit" class="btn btn-primary btn-lg btn-block">Register</button>
							</div>
		                </form>
		            </div>
				</div>
            </div>
        </div>
        <!-- /.row -->

        <!-- Footer -->
        <footer>
            <c:import url="../common/footer.jsp" />
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->

</body>

</html>

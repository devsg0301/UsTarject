<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>

<c:set var="path_root"  value="${pageContext.request.contextPath}" scope="application"/>

<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="../common/includecommon.jsp" />

<script type="text/javascript">

	var tmpUser = navigator.userAgent;

	function searchGo(){
		var searchWord = $("#searchWord").val();
		location.href = "/sgCloud/sgCloud_main.do?searchWord="+searchWord;
	}
	
	/* 검색 - enter값 이벤트   */
	function EventSearchGo(e){
		var form = document.boardForm;
		if(e.keyCode == '13'){
			searchGo();
		}
	}

	function fileDownload(fileUrl, fileName){
		//var eFileUrl = encodeURIComponent(fileUrl);
		//var eFileName = encodeURIComponent(fileName);
		//alert(eFileUrl);
		if(tmpUser.indexOf("iPhone") > 0 || tmpUser.indexOf("iPod") > 0){
			alert("아이폰은 파일을 다운로드 할 수 없습니다.");
			return;
		}
		
		location.href = "/sgCloud/fileDownload.do?fileName="+fileName+"&fileUrl="+fileUrl;
	}
	
	function fileSearch(category, genre, country){
		if (!(tmpUser.indexOf("iPhone") > 0 || tmpUser.indexOf("iPod") > 0 || tmpUser.indexOf("Android ") > 0 )){
			location.href = "/sgCloud/sgCloud_main.do?category=" + category + "&genre=" + genre + "&country=" + country;
		}else{
			location.href = "/sgCloud/sgCloud_main.do?category=" + category + "&genre=" + genre + "&country=" + country + "#view_position";
		}
	}
	
	function folderSearch(category, genre, foldername){
		if (!(tmpUser.indexOf("iPhone") > 0 || tmpUser.indexOf("iPod") > 0 || tmpUser.indexOf("Android ") > 0 )){
			location.href = "/sgCloud/sgCloud_main.do?category=" + category + "&genre=" + genre + "&foldername=" + foldername;
		}else{
			location.href = "/sgCloud/sgCloud_main.do?category=" + category + "&genre=" + genre + "&foldername=" + foldername + "#view_position";
		}
	}

	function paging(searchWord, rnum, category, genre, foldername, country){
		if (!(tmpUser.indexOf("iPhone") > 0 || tmpUser.indexOf("iPod") > 0 || tmpUser.indexOf("Android ") > 0 )){		
			location.href = "/sgCloud/sgCloud_main.do?searchWord=" + searchWord + "&rnum=" + rnum + "&category=" + category + "&genre=" + genre + "&foldername=" + foldername + "&country=" + country;
		}else{
			location.href = "/sgCloud/sgCloud_main.do?searchWord=" + searchWord + "&rnum=" + rnum + "&category=" + category + "&genre=" + genre + "&foldername=" + foldername + "&country=" + country + "#view_position";
		}
	}
	
	function goUrl(gubun){
		if (!(tmpUser.indexOf("iPhone") > 0 || tmpUser.indexOf("iPod") > 0 || tmpUser.indexOf("Android ") > 0 )){
			location.href = "/sgCloud/sgCloud_board.do?gubun=" + gubun;
		}else{
			location.href = "/sgCloud/sgCloud_board.do?gubun=" + gubun + "#view_position";
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
                    <li class="active">
                    	sgCloud
                    </li>
                </ol>
            </div>
        </div>
        <!-- Page Heading/Breadcrumbs -->
        <div class="">
            <div class="inbox-head">
	            <h3>sgCloud</h3>
                <div class="input-append pull-right position">
                    <input type="text" class="sr-input" placeholder="파일 검색" id="searchWord" onkeydown="javascript:EventSearchGo(event);">
                    <button class="btn sr-btn" type="button" onClick="searchGo();"><i class="fa fa-search"></i></button>
                </div>
	        </div>
        </div>
        <!-- /.row -->

        <div class="row">
        	 <!-- sgCloud SidsgCloud Widgets Column -->
            <div class="col-md-3">
	            <div class="side-menu">
					<nav class="navbar navbar-default" role="navigation">
		            	<div class="side-menu-container">
		            		<ul class="nav navbar-nav">
			            		<li class="active"><a style="<c:if test="${category == ''}">font-weight: 600; color: #333;</c:if>" href="javascript:goUrlHeader('/sgCloud/sgCloud_main.do');"><i class="fa fa-cloud"></i> 전체</a></li>
			            		<!-- Dropdown-->
					            <li class="panel panel-default" id="dropdown">
					                <a style="<c:if test="${category == 'TV'}">color: #333;</c:if>" data-toggle="collapse" href="#dropdown-tv1" <c:if test="${category == 'TV'}">aria-expanded="true"</c:if>>
					                    <i class="fa fa-television"></i> TV프로그램 <span class="caret"></span>
					                </a>
					
					                <!-- Dropdown level 1 -->
					                <div id="dropdown-tv1" class="panel-collapse collapse <c:if test="${category == 'TV'}">in</c:if>" <c:if test="${category == 'TV'}">aria-expanded="true"</c:if>>
					                    <div class="panel-body">
					                        <ul class="nav navbar-nav">
	                                            <li style="padding-left:30px;"><a style="<c:if test="${category == 'TV' && genre == ''}">font-weight: 600; color: #333;</c:if>" href="javascript:fileSearch('TV','','');"><i class="fa fa-caret-right"></i>전체</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '드라마' && country == 'KO'}">font-weight: 600; color: #333;</c:if>" href="javascript:fileSearch('TV','드라마','KO');"><i class="fa fa-caret-right"></i>한국드라마</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '드라마' && country == 'EN'}">font-weight: 600; color: #333;</c:if>" href="javascript:fileSearch('TV','드라마','EN');"><i class="fa fa-caret-right"></i>외국드라마</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '예능'}">font-weight: 600; color: #333;</c:if>" href="javascript:fileSearch('TV','예능','');"><i class="fa fa-caret-right"></i>예능</a></li>
					                        </ul>
					                    </div>
					                </div>
					            </li>
					            <!-- Dropdown-->
					            <li class="panel panel-default" id="dropdown">
					                <a style="<c:if test="${category == 'MOVIE'}">color: #333;</c:if>" data-toggle="collapse" href="#dropdown-movie1" <c:if test="${category == 'MOVIE'}">aria-expanded="true"</c:if>>
					                    <i class="fa fa-video-camera"></i> 영화 <span class="caret"></span>
					                </a>
					
					                <!-- Dropdown level 1 -->
					                <div id="dropdown-movie1" class="panel-collapse collapse <c:if test="${category == 'MOVIE'}">in</c:if>" <c:if test="${category == 'TV'}">aria-expanded="true"</c:if>>
					                    <div class="panel-body">
					                        <ul class="nav navbar-nav">
	                                            <li style="padding-left:30px;"><a style="<c:if test="${category == 'MOVIE' && genre == ''}">font-weight: 600; color: #333;</c:if>" href="javascript:fileSearch('MOVIE','','');"><i class="fa fa-caret-right"></i>전체</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '액션ㆍ전쟁'}">font-weight: 600; color: #333;</c:if>" href="javascript:fileSearch('MOVIE','액션ㆍ전쟁','');"><i class="fa fa-caret-right"></i>액션ㆍ전쟁</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '스릴러ㆍ범죄'}">font-weight: 600; color: #333;</c:if>" href="javascript:fileSearch('MOVIE','스릴러ㆍ범죄','');"><i class="fa fa-caret-right"></i>스릴러ㆍ범죄</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '로멘스ㆍ멜로'}">font-weight: 600; color: #333;</c:if>" href="javascript:fileSearch('MOVIE','로멘스ㆍ멜로','');"><i class="fa fa-caret-right"></i>로멘스ㆍ멜로</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '드라마ㆍ가족'}">font-weight: 600; color: #333;</c:if>" href="javascript:fileSearch('MOVIE','드라마ㆍ가족','');"><i class="fa fa-caret-right"></i>드라마ㆍ가족</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == 'SFㆍ환타지'}">font-weight: 600; color: #333;</c:if>" href="javascript:fileSearch('MOVIE','SFㆍ환타지','');"><i class="fa fa-caret-right"></i>SFㆍ환타지</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '공포ㆍ호러'}">font-weight: 600; color: #333;</c:if>" href="javascript:fileSearch('MOVIE','공포ㆍ호러','');"><i class="fa fa-caret-right"></i>공포ㆍ호러</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '코미디'}">font-weight: 600; color: #333;</c:if>" href="javascript:fileSearch('MOVIE','코미디','');"><i class="fa fa-caret-right"></i>코미디</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '애니'}">font-weight: 600; color: #333;</c:if>" href="javascript:fileSearch('MOVIE','애니','');"><i class="fa fa-caret-right"></i>애니</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '뮤지컬ㆍ음악'}">font-weight: 600; color: #333;</c:if>" href="javascript:fileSearch('MOVIE','뮤지컬ㆍ음악','');"><i class="fa fa-caret-right"></i>뮤지컬ㆍ음악</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '다큐멘터리'}">font-weight: 600; color: #333;</c:if>" href="javascript:fileSearch('MOVIE','다큐멘터리','');"><i class="fa fa-caret-right"></i>다큐멘터리</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '스포츠'}">font-weight: 600; color: #333;</c:if>" href="javascript:fileSearch('MOVIE','스포츠','');"><i class="fa fa-caret-right"></i>스포츠</a></li>
					                        </ul>
					                    </div>
					                </div>
					            </li>
					            <li class=""><a style="<c:if test="${category == 'MUSIC'}">font-weight: 600; color: #333;</c:if>" href="javascript:fileSearch('MUSIC','','');"><i class="fa fa-music"></i> 노래</a></li>
					            <!-- Dropdown-->
					            <li class="panel panel-default" id="dropdown">
					                <a style="<c:if test="${category == 'UTILITY'}">color: #333;</c:if>" data-toggle="collapse" href="#dropdown-utility1" <c:if test="${category == 'UTILITY'}">aria-expanded="true"</c:if>>
					                    <i class="fa fa-database"></i> 유틸리티 <span class="caret"></span>
					                </a>
					
					                <!-- Dropdown level 1 -->
					                <div id="dropdown-utility1" class="panel-collapse collapse <c:if test="${category == 'UTILITY'}">in</c:if>" <c:if test="${category == 'UTILITY'}">aria-expanded="true"</c:if>>
					                    <div class="panel-body">
					                        <ul class="nav navbar-nav">
	                                            <li style="padding-left:30px;"><a style="<c:if test="${category == 'UTILITY' && genre == ''}">font-weight: 600; color: #333;</c:if>" href="javascript:fileSearch('UTILITY','','');"><i class="fa fa-caret-right"></i>전체</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '소프트웨어'}">font-weight: 600; color: #333;</c:if>" href="javascript:fileSearch('UTILITY','소프트웨어','');"><i class="fa fa-caret-right"></i>소프트웨어</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '보안ㆍ백신'}">font-weight: 600; color: #333;</c:if>" href="javascript:fileSearch('UTILITY','보안ㆍ백신','');"><i class="fa fa-caret-right"></i>보안ㆍ백신</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '기타설치'}">font-weight: 600; color: #333;</c:if>" href="javascript:fileSearch('UTILITY','기타설치','');"><i class="fa fa-caret-right"></i>기타설치</a></li>
					                        </ul>
					                    </div>
					                </div>
					            </li>
					            <li class="panel panel-default" id="dropdown">
					                <a style="" data-toggle="collapse" href="#dropdown-board1">
					                    <i class="fa fa-list-alt"></i> 자유게시판 <span class="caret"></span>
					                </a>
					
					                <!-- Dropdown level 1 -->
					                <div id="dropdown-board1" class="panel-collapse collapse">
					                    <div class="panel-body">
					                        <ul class="nav navbar-nav">
	                                            <li style="padding-left:30px;"><a href="javascript:goUrl('level');"><i class="fa fa-caret-right"></i>등업게시판</a></li>
	                                            <li style="padding-left:30px;"><a href="javascript:goUrl('request');"><i class="fa fa-caret-right"></i>자료요청게시판</a></li>
					                        </ul>
					                    </div>
					                </div>
					            </li>
					            <li class="" id="view_position"><a href="/sgCloud/sgCloud_add.do"><i class="fa fa-upload"></i> 파일등록</a></li>
							</ul>
			            </div>
		            </nav>
	            </div>
            </div>

            <!-- sgCloud Entries Column -->
            <div class="col-md-9">
				<div class="panel panel-default">
					<!-- Default panel contents -->
					<div class="panel-heading">
						<c:forEach var="folderList" items="${folderList}" end="10">
							<button type="button" style="<c:if test="${folderList.category == 'TV' && folderList.foldername != foldername}">background-color: #f1fff9;</c:if> 
														 <c:if test="${folderList.category == 'MOVIE' && folderList.foldername != foldername}">background-color: #fbffe9;</c:if>
														 <c:if test="${folderList.category == 'MUSIC' && folderList.foldername != foldername}">background-color: #fff0f7;</c:if>
														 <c:if test="${folderList.category == 'UTILITY' && folderList.foldername != foldername}">background-color: #dcdcdc;</c:if>" 
												  class="btn <c:if test="${folderList.foldername == foldername}">btn-default-${folderList.category}</c:if>
												  			 <c:if test="${folderList.foldername != foldername}">btn-default</c:if> btn-round-sm btn-sm" 
												  onclick="javascript:folderSearch('${folderList.category}','${folderList.genre}','${folderList.foldername}');">${folderList.foldername}</button>
						</c:forEach>
						<c:if test="${fn:length(folderList) > 10}">
							<span style="font-size: 20px;">.....</span>
						</c:if>
					</div>
					<table class="table">
						<tbody>
							<tr>
			                	<th>장르</th>
			                    <th>제목</th>
			                    <th>파일</th>
							</tr>
							<c:forEach var="broadcastList" items="${broadcastList}">
								<tr>
				                	<td class="view-message dont-show">${broadcastList.genre}</td>
				                    <td class="view-message">
				                    	<fmt:parseDate var="dateString" value="${broadcastList.play_date}" pattern="yyyy-MM-dd" />										
				                    	<a href="/sgCloud/${broadcastList.idx}.do">${broadcastList.title} <span style="font-size: 10px;"><fmt:formatDate value="${dateString}" pattern="yyyy.MM.dd(E)"/></span></a>
				                    </td>
				                    <td class="view-message inbox-small-cells">
				                    	<a href="javascript:;" onclick="fileDownload('${broadcastList.file_url}','${broadcastList.filename}');">
				                    		다운 <i class="fa fa-download"></i>
				                    	</a>
				                    	<c:if test="${broadcastList.sub_url != ''}">
				                    	<a href="javascript:;" onclick="fileDownload('${broadcastList.category}/${broadcastList.genre}/${broadcastList.foldername}/${broadcastList.sub_url}.smi','${broadcastList.sub_url}.smi');">
				                    		&nbsp;&nbsp;자막 <i class="fa fa-cc"></i>
				                    	</a>
				                    	</c:if>
				                    </td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
                <!-- Pager -->
                <ul class="pager">
                	<c:if test="${prev != 0 }">
	                    <li class="previous">
	                        <a href="javascript:paging('${searchWord}','${prev}','${category}','${genre}','${foldername}','${country}');">&larr; Prev</a>
	                    </li>
                    </c:if>
                    <c:if test="${next != 0 }">
	                    <li class="next">
	                        <a href="javascript:paging('${searchWord}','${next}','${category}','${genre}','${foldername}','${country}');">Next &rarr;</a>
	                    </li>
	                </c:if>
                </ul>

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

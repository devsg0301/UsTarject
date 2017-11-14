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
	
	function folderSearch(category, genre, foldername){
		location.href = "/sgCloud/sgCloud_main.do?category=" + category + "&genre=" + encodeURI(genre) + "&foldername=" + encodeURI(foldername);
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
    <div class="container">
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
                    <button class="btn sr-btn" type="button" onClick="fileSearch();"><i class="fa fa-search"></i></button>
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
			            		<li class="active"><a style="<c:if test="${category == ''}">font-weight: 600; color: #333;</c:if>" href="/sgCloud/sgCloud_main.do"><i class="fa fa-cloud"></i> 전체</a></li>
			            		<!-- Dropdown-->
					            <li class="panel panel-default" id="dropdown">
					                <a style="<c:if test="${category == 'TV'}">color: #333;</c:if>" data-toggle="collapse" href="#dropdown-tv1" <c:if test="${category == 'TV'}">aria-expanded="true"</c:if>>
					                    <i class="fa fa-television"></i> TV프로그램 <span class="caret"></span>
					                </a>
					
					                <!-- Dropdown level 1 -->
					                <div id="dropdown-tv1" class="panel-collapse collapse <c:if test="${category == 'TV'}">in</c:if>" <c:if test="${category == 'TV'}">aria-expanded="true"</c:if>>
					                    <div class="panel-body">
					                        <ul class="nav navbar-nav">
	                                            <li style="padding-left:30px;"><a style="<c:if test="${category == 'TV' && genre == ''}">font-weight: 600; color: #333;</c:if>" href="/sgCloud/sgCloud_main.do?category=TV"><i class="fa fa-caret-right"></i>전체</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '드라마'}">font-weight: 600; color: #333;</c:if>" href="/sgCloud/sgCloud_main.do?category=TV&genre=드라마"><i class="fa fa-caret-right"></i>드라마</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '예능'}">font-weight: 600; color: #333;</c:if>" href="/sgCloud/sgCloud_main.do?category=TV&genre=예능"><i class="fa fa-caret-right"></i>예능</a></li>
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
	                                            <li style="padding-left:30px;"><a style="<c:if test="${category == 'MOVIE' && genre == ''}">font-weight: 600; color: #333;</c:if>" href="/sgCloud/sgCloud_main.do?category=MOVIE"><i class="fa fa-caret-right"></i>전체</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '액션ㆍ전쟁'}">font-weight: 600; color: #333;</c:if>" href="/sgCloud/sgCloud_main.do?category=MOVIE&genre=액션ㆍ전쟁"><i class="fa fa-caret-right"></i>액션ㆍ전쟁</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '스릴러ㆍ범죄'}">font-weight: 600; color: #333;</c:if>" href="/sgCloud/sgCloud_main.do?category=MOVIE&genre=스릴러ㆍ범죄"><i class="fa fa-caret-right"></i>스릴러ㆍ범죄</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '로멘스ㆍ멜로'}">font-weight: 600; color: #333;</c:if>" href="/sgCloud/sgCloud_main.do?category=MOVIE&genre=로멘스ㆍ멜로"><i class="fa fa-caret-right"></i>로멘스ㆍ멜로</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '드라마ㆍ가족'}">font-weight: 600; color: #333;</c:if>" href="/sgCloud/sgCloud_main.do?category=MOVIE&genre=드라마ㆍ가족"><i class="fa fa-caret-right"></i>드라마ㆍ가족</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == 'SFㆍ환타지'}">font-weight: 600; color: #333;</c:if>" href="/sgCloud/sgCloud_main.do?category=MOVIE&genre=SFㆍ환타지"><i class="fa fa-caret-right"></i>SFㆍ환타지</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '공포ㆍ호러'}">font-weight: 600; color: #333;</c:if>" href="/sgCloud/sgCloud_main.do?category=MOVIE&genre=공포ㆍ호러"><i class="fa fa-caret-right"></i>공포ㆍ호러</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '코미디'}">font-weight: 600; color: #333;</c:if>" href="/sgCloud/sgCloud_main.do?category=MOVIE&genre=코미디"><i class="fa fa-caret-right"></i>코미디</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '애니'}">font-weight: 600; color: #333;</c:if>" href="/sgCloud/sgCloud_main.do?category=MOVIE&genre=애니"><i class="fa fa-caret-right"></i>애니</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '뮤지컬ㆍ음악'}">font-weight: 600; color: #333;</c:if>" href="/sgCloud/sgCloud_main.do?category=MOVIE&genre=뮤지컬ㆍ음악"><i class="fa fa-caret-right"></i>뮤지컬ㆍ음악</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '다큐멘터리'}">font-weight: 600; color: #333;</c:if>" href="/sgCloud/sgCloud_main.do?category=MOVIE&genre=다큐멘터리"><i class="fa fa-caret-right"></i>다큐멘터리</a></li>
	                                            <li style="padding-left:30px;"><a style="<c:if test="${genre == '스포츠'}">font-weight: 600; color: #333;</c:if>" href="/sgCloud/sgCloud_main.do?category=MOVIE&genre=스포츠"><i class="fa fa-caret-right"></i>스포츠</a></li>
					                        </ul>
					                    </div>
					                </div>
					            </li>
					            <li class=""><a style="<c:if test="${category == 'MUSIC'}">font-weight: 600; color: #333;</c:if>" href="/sgCloud/sgCloud_main.do?category=MUSIC"><i class="fa fa-music"></i> 노래</a></li>
					            <li class=""><a href="/sgCloud/sgCloud_add.do"><i class="fa fa-upload"></i> 파일추가</a></li>
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
						<c:forEach var="folderList" items="${folderList}" end="20">
							<button type="button" style="<c:if test="${folderList.category == 'TV' && folderList.foldername != foldername}">background-color: #f1fff9;</c:if> 
														 <c:if test="${folderList.category == 'MOVIE' && folderList.foldername != foldername}">background-color: #fbffe9;</c:if>
														 <c:if test="${folderList.category == 'MUSIC' && folderList.foldername != foldername}">background-color: #fff0f7;</c:if>" 
												  class="btn <c:if test="${folderList.foldername == foldername}">btn-default-${folderList.category}</c:if>
												  			 <c:if test="${folderList.foldername != foldername}">btn-default</c:if> btn-round-sm btn-sm" 
												  onclick="javascript:folderSearch('${folderList.category}','${folderList.genre}','${folderList.foldername}');">${folderList.foldername}</button>
						</c:forEach>
						<c:if test="${fn:length(folderList) > 20}">
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
				                    <td class="view-message"><a href="/sgCloud/${broadcastList.idx}.do">${broadcastList.title}</a></td>
				                    <td class="view-message inbox-small-cells">
				                    	<a href="#" onclick="fileDownload('${broadcastList.file_url}','${broadcastList.filename}');">
				                    		다운 <i class="fa fa-download"></i>&nbsp;&nbsp;
				                    	</a>
				                    	<c:if test="${broadcastList.sub_url != ''}">
				                    	<a href="#" onclick="fileDownload('${broadcastList.category}/${broadcastList.genre}/${broadcastList.foldername}/${broadcastList.sub_url}.smi','${broadcastList.sub_url}.smi');">
				                    		자막 <i class="fa fa-cc"></i>
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
	                        <a href="/sgCloud/sgCloud_main.do?searchWord=${searchWord }&rnum=${prev }&category=${category}&genre=${genre}&foldername=${foldername}">&larr; Prev</a>
	                    </li>
                    </c:if>
                    <c:if test="${next != 0 }">
	                    <li class="next">
	                        <a href="/sgCloud/sgCloud_main.do?searchWord=${searchWord }&rnum=${next }&category=${category}&genre=${genre}&foldername=${foldername}">Next &rarr;</a>
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

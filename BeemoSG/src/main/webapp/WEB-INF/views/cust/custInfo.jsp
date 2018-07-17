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
	var tmpUser = navigator.userAgent;
		
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
                    <li>
                    	<a href="/sgCloud/sgCloud_main.do">sgCloud</a>
                    </li>
                    <li class="active">회원정보</li>
                </ol>
            </div>
        </div>
        <div class="">
            <div class="inbox-head">
	            <h3>sgCloud</h3>
                <div class="input-append pull-right position">
                    <input type="text" class="sr-input" placeholder="파일 검색" id="mainSearchWord" onkeydown="javascript:EventSearchGo(event);">
                    <button class="btn sr-btn" type="button" onClick="searchGo();"><i class="fas fa-search"></i></button>
                </div>
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
			            		<li class="active"><a href="/sgCloud/sgCloud_main.do"><i class="fas fa-cloud"></i> 전체</a></li>
			            		<!-- Dropdown-->
					            <li class="panel panel-default" id="dropdown">
					                <a data-toggle="collapse" href="#dropdown-tv1">
					                    <i class="fas fa-tv"></i> TV프로그램 <span class="caret"></span>
					                </a>
					
					                <!-- Dropdown level 1 -->
					                <div id="dropdown-tv1" class="panel-collapse collapse" >
					                    <div class="panel-body">
					                        <ul class="nav navbar-nav">
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('TV','','');"><i class="fas fa-caret-right"></i>전체</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('TV','드라마','KO');"><i class="fas fa-caret-right"></i>한국드라마</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('TV','드라마','EN');"><i class="fas fa-caret-right"></i>외국드라마</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('TV','예능','');"><i class="fas fa-caret-right"></i>예능</a></li>
					                        </ul>
					                    </div>
					                </div>
					            </li>
					            <!-- Dropdown-->
					            <li class="panel panel-default" id="dropdown">
					                <a style="" data-toggle="collapse" href="#dropdown-movie1" >
					                    <i class="fas fa-video"></i> 영화 <span class="caret"></span>
					                </a>
					
					                <!-- Dropdown level 1 -->
					                <div id="dropdown-movie1" class="panel-collapse collapse " >
					                    <div class="panel-body">
					                        <ul class="nav navbar-nav">
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('MOVIE','','');"><i class="fas fa-caret-right"></i>전체</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('MOVIE','액션ㆍ전쟁','');"><i class="fas fa-caret-right"></i>액션ㆍ전쟁</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('MOVIE','스릴러ㆍ범죄','');"><i class="fas fa-caret-right"></i>스릴러ㆍ범죄</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('MOVIE','로멘스ㆍ멜로','');"><i class="fas fa-caret-right"></i>로멘스ㆍ멜로</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('MOVIE','드라마ㆍ가족','');"><i class="fas fa-caret-right"></i>드라마ㆍ가족</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('MOVIE','SFㆍ환타지','');"><i class="fas fa-caret-right"></i>SFㆍ환타지</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('MOVIE','공포ㆍ호러','');"><i class="fas fa-caret-right"></i>공포ㆍ호러</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('MOVIE','코미디','');"><i class="fas fa-caret-right"></i>코미디</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('MOVIE','애니','');"><i class="fas fa-caret-right"></i>애니</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('MOVIE','뮤지컬ㆍ음악','');"><i class="fas fa-caret-right"></i>뮤지컬ㆍ음악</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('MOVIE','다큐멘터리','');"><i class="fas fa-caret-right"></i>다큐멘터리</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('MOVIE','스포츠','');"><i class="fas fa-caret-right"></i>스포츠</a></li>
					                        </ul>
					                    </div>
					                </div>
					            </li>
					            <li class=""><a style="" href="javascript:fileSearch('ANIMATION','','');"><i class="fab fa-leanpub"></i> 애니</a></li>
					            <li class=""><a style="" href="javascript:fileSearch('MUSIC','','');"><i class="fas fa-music"></i> 노래</a></li>
					            <!-- Dropdown-->
					            <li class="panel panel-default" id="dropdown">
					                <a style="" data-toggle="collapse" href="#dropdown-utility1" >
					                    <i class="fas fa-database"></i> 유틸리티 <span class="caret"></span>
					                </a>
					
					                <!-- Dropdown level 1 -->
					                <div id="dropdown-utility1" class="panel-collapse collapse">
					                    <div class="panel-body">
					                        <ul class="nav navbar-nav">
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('UTILITY','','');"><i class="fas fa-caret-right"></i>전체</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('UTILITY','소프트웨어','');"><i class="fas fa-caret-right"></i>소프트웨어</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('UTILITY','보안ㆍ백신','');"><i class="fas fa-caret-right"></i>보안ㆍ백신</a></li>
	                                            <li style="padding-left:30px;"><a style="" href="javascript:fileSearch('UTILITY','기타설치','');"><i class="fas fa-caret-right"></i>기타설치</a></li>
					                        </ul>
					                    </div>
					                </div>
					            </li>

					            <li class="panel panel-default" id="dropdown">
					                <a style="color: #333;" data-toggle="collapse" href="#dropdown-board1" aria-expanded="true">
					                    <i class="fas fa-list-alt"></i> 자유게시판 <span class="caret"></span>
					                </a>
					
					                <!-- Dropdown level 1 -->
					                <div id="dropdown-board1" class="panel-collapse collapse in">
					                    <div class="panel-body">
					                        <ul class="nav navbar-nav">
	                                            <li style="padding-left:30px;"><a href="javascript:goUrl('level');"><i class="fas fa-caret-right"></i>등업게시판</a></li>
	                                            <li style="padding-left:30px;"><a href="javascript:goUrl('request');"><i class="fas fa-caret-right"></i>자료요청게시판</a></li>
					                        </ul>
					                    </div>
					                </div>
					            </li>
					            <!-- Dropdown-->
					            <li class="" id="view_position"><a href="/sgCloud/sgCloud_add.do"><i class="fas fa-upload"></i> 파일등록</a></li>
							</ul>
			            </div>
		            </nav>
	            </div>
            </div>
            
            <div class="col-md-9">
				<div class="panel panel-default">
					<!-- Default panel contents -->
					<div class="panel-heading">
						<h3 style="margin-top: 10px; font-family: 'Noto Sans KR'; font-size: 20px;">
							회원정보
						</h3>					
					</div>
					<div class="form-horizontal">
			            <div class="form-group">
							<label class="col-sm-3 control-label">이름</label>
							<div class="col-sm-6">
								<input class="form-control" name="cust_name" type="text" value="${customer.cust_name }" >
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">아이디</label>
							<div class="col-sm-6">
								<input class="form-control" name="cust_id" type="text" value="${customer.cust_id }" >
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">등급</label>
							<div class="col-sm-6">
								<input class="form-control" name="cust_gb" type="text" value="${customer.cust_gb }" >
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">비밀번호</label>
							<div class="col-sm-6">
								<input class="form-control" name="password" type="text" value="${customer.password }" >						
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">이메일</label>
							<div class="col-sm-6">
								<input class="form-control" name="email" type="text" value="${customer.email }" >
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">전화번호(HP)</label>
							<div class="col-sm-6">
								<input class="form-control" name="hp" type="text" value="${customer.hp }" >
							</div>
						</div>
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

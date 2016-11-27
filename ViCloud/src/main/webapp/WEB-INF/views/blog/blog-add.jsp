<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<c:set var="path_root"  value="${pageContext.request.contextPath}" scope="application"/>

<!DOCTYPE html>
<html lang="ko">

<head>
	<c:import url="../common/includecommon.jsp" />

<script type="text/javascript">

$(function () {
	$("#category").val("TV");
	$("#genre").val("드라마");
	$("#grade").val("전체");
	
	$("#select_category").change(function(){
	    $("#category").val($(this).val());
	    $("#select_genre").html("");
	    if($(this).val() == "TV"){
	    	$("#select_genre").html("<option>드라마</option>"+"<option>예능</option>"+"<option>스포츠</option>");
	    	$("#genre").val("드라마");
	    }else if($(this).val() == "MOVIE"){
	    	$("#select_genre").html("<option>액션/전쟁</option>"+"<option>스릴러/범죄</option>"+"<option>로멘스/멜로</option>"+
	    			"<option>드라마/가족</option>"+"<option>애니</option>"+"<option>코미디</option>"+"<option>다큐멘터리</option>"+
	    			"<option>SF/환타지</option>")+"<option>공포/호러</option>"+"<option>스포츠</option>"+"<option>음악/뮤지컬</option>";
	    	$("#genre").val("액션");
	    }else if($(this).val() == "INTERNET"){
	    	$("#select_genre").html("<option>CF</option>"+"<option>뮤비</option>"+"<option>게임</option>");
	    	$("#genre").val("CF");
	    }else if($(this).val() == "ETC"){
	    	$("#select_genre").html("<option>ETC</option>");
	    	$("#genre").val("ETC");
	    }
	});
	$("#select_genre").change(function(){
	    $("#genre").val($(this).val());
	});
	$("#select_grade").change(function(){
	    $("#grade").val($(this).val());
	});
});
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
                <h1 class="page-header">새로운 파일 등록
                </h1>
                <ol class="breadcrumb">
                    <li><a href="/defaults/main.do">Home</a>
                    </li>
                    <li class="active">Blog Post</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">

			<!-- Blog Sidebar Widgets Column -->

            <!-- Blog Post Content Column -->
            <div class="well">
	            <form id="form" name="form" method="post" action="/blog/add_ok.do">
	            	<input type="hidden" name="idx" id="idx" value="${broadcast.idx}" />
	            	<div class="control-group form-group">
                        <div class="controls">
                            <label>제목:</label>
                            <input type="text" class="form-control" id="title" name="title" value="${broadcast.title}" required data-validation-required-message="Please enter title.">
                            <p class="help-block"></p>
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>카테고리:</label>
                            <select class="form-control" id="select_category">
								<option>TV</option>
								<option>MOVIE</option>
								<option>INTERNET</option>
								<option>ETC</option>
							</select>
                            <input type="hidden" class="form-control" id="category" name="category" value="${broadcast.category}" required data-validation-required-message="Please enter category.">
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>장르:</label>
                            <select class="form-control" id="select_genre">
                            	<option>드라마</option>
								<option>예능</option>
							</select>
                            <input type="hidden" class="form-control" id="genre" name="genre" value="${broadcast.genre}" required data-validation-required-message="Please enter genre.">
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>등급:</label>
                            <select class="form-control" id="select_grade">
                            	<option>전체</option>
								<option>19</option>
								<option>15</option>
								<option>12</option>
								<option>7</option>
							</select>
                            <input type="hidden" class="form-control" id="grade" name="grade" value="${broadcast.grade}" required data-validation-required-message="Please enter grade.">
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>폴더명:</label>
                            <input type="text" class="form-control" id="foldername" name="foldername" value="" required data-validation-required-message="Please enter Foldername.">
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>파일명:</label>
                            <input type="text" class="form-control" id="filename" name="filename" value="${broadcast.filename}" required data-validation-required-message="Please enter Filename.">
                        </div>
                    </div>
                    
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
        <!-- /.row -->

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
</body>

</html>

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
	
	$("#select_category").change(function(){
	    $("#category").val($(this).val());
	    
	    $("#select_genre").html("");
	    if($(this).val() == "TV"){
	    	$("#select_genre").html("<option>드라마</option>"+"<option>예능</option>"+"<option>액션</option>");
	    	$("#genre").val("드라마");
	    }else if($(this).val() == "MOVIE"){
	    	$("#select_genre").html("<option>액션</option>"+"<option>드라마</option>"+"<option>SF</option>"+"<option>멜로</option>");
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
								<option>액션</option>
							</select>
                            <input type="hidden" class="form-control" id="genre" name="genre" value="${broadcast.genre}" required data-validation-required-message="Please enter gemre.">
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

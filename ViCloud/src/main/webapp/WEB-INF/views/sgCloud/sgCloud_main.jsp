<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
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
                <h1 class="page-header">sgCloud
                    <small>Subheading</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="/defaults/main.do">Home</a>
                    </li>
                    <li class="active">sgCloud</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <div class="row">
        
        	 <!-- sgCloud SidsgCloud Widgets Column -->
            <div class="col-md-4">

                <!-- sgCloud Search Well -->
                <div class="well">
                    <h4>File Search</h4>
                    <div class="input-group">
                        <input type="text" class="form-control" id="searchWord" onkeydown="javascript:EventSearchGo(event);">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button" onClick="fileSearch();"><i class="fa fa-search"></i></button>
                        </span>
                    </div>
                    <!-- /.input-group -->
                </div>

                <!-- sgCloud Categories Well -->
                <div class="well">
                    <h4>sgCloud Categories</h4>
                    <div class="row">
                        <div class="col-lg-6">
                            <ul class="list-unstyled">
                            	<li>
                                	<a href="/sgCloud/sgCloud_main.do?category=all">전체</a>
                                </li>
                            <c:forEach var="categoryList" items="${categoryList}">
                                <li>
                                	<a href="/sgCloud/sgCloud_main.do?category=${categoryList.category}">${categoryList.category}</a>
                                </li>
                            </c:forEach>
                            </ul>
                        </div>
                        <c:if test="${!empty genreList}">
                        <hr>
                        </c:if>
                        <!-- /.col-lg-6 -->
                        <div class="col-lg-6">
                            <ul class="list-unstyled">
                            <c:forEach var="genreList" items="${genreList}">
                                <li>
                                	<a href="/sgCloud/sgCloud_main.do?category=${genreList.category}&genre=${genreList.genre}">${genreList.genre}</a>
                                </li>
                            </c:forEach>
                            </ul>
                        </div>
                        <!-- /.col-lg-6 -->
                    </div>
                    <!-- /.row -->
                </div>

                <!-- Side Widget Well -->
                <div class="">
                    <a href="/sgCloud/sgCloud_add.do" class="btn btn-default">add file</a>
                </div>

            </div>

            <!-- sgCloud Entries Column -->
            <div class="col-md-8">
				<c:forEach var="broadcastList" items="${broadcastList}">
		         	<!-- First sgCloud View -->
		        	<h4>
		            	<a href="/sgCloud/${broadcastList.idx}.do">${broadcastList.title }</a>
	            	</h4>
	            	<p><i class="fa fa-clock-o"></i> Viewed on <fmt:formatDate value="${broadcastList.insert_date}" pattern="yyyy-MM-dd"/></p>
					<hr>
				</c:forEach>

                <!-- Pager -->
                <ul class="pager">
                	<c:if test="${prev != 0 }">
	                    <li class="previous">
	                        <a href="/sgCloud/sgCloud_main.do?rnum=${prev }">&larr; Prev</a>
	                    </li>
                    </c:if>
                    <c:if test="${next != 0 }">
	                    <li class="next">
	                        <a href="/sgCloud/sgCloud_main.do?rnum=${next }">Next &rarr;</a>
	                    </li>
	                </c:if>
                </ul>

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

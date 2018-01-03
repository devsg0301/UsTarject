<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path_root"  value="${pageContext.request.contextPath}" scope="application"/>

<!DOCTYPE html>
<html lang="ko">

<head>
	<c:import url="../common/includecommon.jsp" />
	
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
                <h1 class="page-header">ERROR
                    <small></small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="/defaults/main.do">Home</a>
                    </li>
                    <li class="active">ERROR</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <div class="row">

            <div class="col-lg-12">
                <div class="jumbotron">
                    <h1><span class="error-404">ERROR</span>
                    </h1>
                    <p>일시적으로 문제가 발생하였습니다. 새로고침 후 동일한 증상이 발생할 경우 연락 바랍니다.</p>
                    <ul>
                        <li>
                            <a href="/defaults/main.do">Home</a>
                        </li>
                        <li>
                            <a href="/sgCloud/sgCloud_main.do">sgCloud</a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>

        <hr>

        <!-- Footer -->
        <footer>
            <c:import url="../common/footer.jsp" />
        </footer>

    </div>
    <!-- /.container -->
</body>

</html>

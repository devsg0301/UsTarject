<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path_root"  value="${pageContext.request.contextPath}" scope="application"/>
<c:set var="fail" value="${fail}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type"  content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=2.0,user-scalable=no">
<meta name="format-detection" content="telephone=no" />
<title>Login</title>
<link rel="stylesheet" href="${path_root}/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${path_root}/resources/bootstrap/css/singin.css">
<script type="text/javascript">
	window.onload = function(){
		<c:if test="${fail == 'fail'}">
	   	alert("아이디 또는 비밀번호를 확인해 주세요.");
		</c:if>
	}
</script>
</head>
<body>
	<div class="container">

		<form class="form-signin" name="login" method="post" action="/defaults/loginProcess.do">
			<h2 class="form-signin-heading">Please sign in</h2>
			<label for="cust_id" class="sr-only">Email or ID</label>
			<input type="text" id="cust_id" name="cust_id" class="form-control" placeholder="Email or ID" required="required" autofocus="autofocus"> 
			<label for="password" class="sr-only">Password</label>
			<input type="password" id="password" name="password" class="form-control" placeholder="Password" required="required">
			<div class="checkbox">
				<label><input type="checkbox" value="remember-me">Remember me</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign	in</button>
			<br/>
			<a href="/cust/custJoin.do"><button class="btn btn-lg btn-primary btn-block" type="button">Join in</button></a>
		</form>

	</div>
	<!-- /container -->

	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript" src="${path_root}/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path_root"  value="${pageContext.request.contextPath}" scope="application"/>
<c:set var="fail" value="${fail}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<link rel="stylesheet" href="${path_root}/resources/sunset/css/bootstrap.min.css">
<link rel="stylesheet" href="${path_root}/resources/sunset/css/singin.css">
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
			<label for="email" class="sr-only">Email address</label>
			<input type="email" id="email" name="email" class="form-control" placeholder="Email address" required="required" autofocus="autofocus"> 
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
	<script type="text/javascript" src="${path_root}/resources/sunset/js/bootstrap.min.js"></script>
</body>
</html>

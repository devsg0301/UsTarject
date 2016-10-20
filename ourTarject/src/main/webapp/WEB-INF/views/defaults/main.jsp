<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>
<h1>
	Wellcome!!  
</h1>
<form name="login" method="post" action="./login.do">
<div>
	<span>아이디 : </span><input type="text" name="id" id="id" />
	<span>비밀번호 : </span><input type="password" name="password" id="password" />
	<input type="submit" value="로그인">
	<a href="./cust/custJoin.do">회원가입</a>
</div>
</form>
</body>
</html>

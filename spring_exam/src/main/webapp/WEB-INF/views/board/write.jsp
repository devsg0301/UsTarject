<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<link rel="stylesheet" href="resources/css/style.css" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스프링 프레임워크 게시판</title>
</head>
</head>
<body>
	<form id="form" method="post" action="./write_ok">
		<input type="hidden" name="idx" id="idx" value="${object.idx}" />
		<div>
			<span>제목</span> <input type="text" id="title" name="title"
				value="${object.title}" />
		</div>
		<div>
			<span>작성자</span> <input type="text" id="id" name="id"
				value="${object.id}" />
		</div>
		<div>
			<span>내용</span>
			<textarea id="content" name="content" rows="10" cols="20">${object.content}</textarea>
		</div>


		<div>
			<input type="submit" value="save" /> <a href="./">목록</a>
		</div>
	</form>
</body>
</html>
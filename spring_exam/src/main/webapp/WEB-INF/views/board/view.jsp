<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스프링 프레임워크 게시판</title>

<script type="text/javascript">
	function del(){
		if(confirm("삭제 하시겠습니까?")) document.form.submit();
	}
	
	function modify(){
		if(confirm("수정 하시겠습니까?")) location.href = "./write.do?idx=${object.idx}";
	}
	
</script>
</head>
<body>
	<form id="form" name="form" method="post" action="./delete.do">
		<input type="hidden" name="idx" id="idx" value="${object.idx}" />
	</form>
	<div>
		<p>제목 : ${object.title}</p>
	</div>
	<div>
		<span>작성자 : ${object.id}</span>
	</div>
	<div>
		<span>작성 일자 : ${object.insert_date }</span>
	</div>
	<div>
		<span>내용</span>
		<textarea rows="10" cols="20">${object.content}</textarea>
	</div>

	<div>
		<button type="button" onclick="del();">삭제</button>
		<button type="button" onclick="modify();">수정</button>
		<a href="./board.do">목록</a>
	</div>
</body>
</html>
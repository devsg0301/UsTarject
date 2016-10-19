<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<link rel="stylesheet" href="resources/css/style.css"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스프링 프레임워크 게시판</title>
</head>
<body>
	<table class="bbs" border="1" cellspacing="0">
        <caption>게시판 리스트</caption>
        <colgroup>
            <col width="100">
            <col>
            <col width="110">
            <col width="100">
            <col width="80">
        </colgroup>
        <thead>
            <tr>
                <th scope="col">글번호</th>
                <th scope="col">제목</th>
                <th scope="col">글쓴이</th>
                <th scope="col">날짜</th>
                <th scope="col">조회수</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="list" items="${list}">
                <tr>
                    <td class="idx">${list.idx }</td>
					<!-- 
						<td class="title"><a href="getBoardView.do?idx=${list.idx }">${list.title }</a></td> 
					-->
                    <td class="title"><a href="./${list.idx }">${list.title }</a></td>
                    <td class="name">${list.id }</td>
                    <td class="date">${list.insert_date }</td>
                    <td class="hit">${list.hit }</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div><a href="./write">작성하기</a></div>
</body>
</html>
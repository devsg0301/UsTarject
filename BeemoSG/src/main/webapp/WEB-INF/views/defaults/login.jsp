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
<title>Beemo_sg</title>
<link rel="stylesheet" href="${path_root}/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${path_root}/resources/bootstrap/css/singin.css">
<script type="text/javascript">

	window.onload = function(){
		<c:if test="${fail == 'fail'}">
	   	alert("아이디 또는 비밀번호를 확인해 주세요.");
		</c:if>
		var form = document.loginForm;
	    getid(form);
	    //captcha();		
	}
	
	/* id기억 */
	function setCookie (name, value, expires) {
	  document.cookie = name + "=" + escape (value) +
		"; path=/; expires=" + expires.toGMTString();
	}
	
	function getCookie(argName){
		var tmp=document.cookie.split('; ');
		for (var i=0; i<tmp.length;i++){
			var c_name = tmp[i].split('=');
			if (c_name[0]==argName) return c_name[1];
		}
		return "";
	}
	
	function saveid() {
		var form = document.loginForm;
		if (form.cust_id.value != '아이디') {
			var expdate = new Date();
			// 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
			if (form.checksaveid.checked){
				expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 9999); // 30일
			}else{
				expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
			}
			setCookie("saveid", encodeURIComponent(form.cust_id.value), expdate);
		}
	}
	
	// 아이디 저장
	function saveidalert() {
		var form = document.loginForm;
		if (form.cust_id.value != '아이디') {
			var expdate = new Date();
			// 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
			if (form.checksaveid.checked){
				expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 9999); // 30일
				//alert("PC방을 포함한 공공장소 등 개인PC가 아닌 경우\n로그인 상태 유지는 권하지 않습니다.");
			}else{
				expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
			}
			setCookie("saveid", encodeURIComponent(form.cust_id.value), expdate);
		}
	}
		
	
	function getid() {
		var form = document.loginForm;
		//= 아이디 값이 있으면 reset
		if (getCookie("saveid") != '' ) {
			form.cust_id.value = decodeURIComponent(unescape(getCookie("saveid")));
		}
	    form.checksaveid.checked = ( form.cust_id.value != "" );
	    if (!form.checksaveid.checked) {
		    form.cust_id.focus();
	    }
	}
	
	// 로그인 상태 유지
	function autoChk(){
		var form = document.loginForm;
		form.checksaveid.checked = true;
		saveidalert();
	}
	
	function gologin(e){
		if(e.keyCode == '13'){
			login();
		}
	}
	
	function keyDown_login(){
	    if(window.event.keyCode == "13")
	    	login();
	}
	
	function login(){
		var form = document.loginForm;
		saveid();
		//자동로그인
		if( form.keep_login.checked ) {
			form.keep_login.value = "1";
		}else {
			form.keep_login.value = "";
		}
	
		form.submit();
	}
	
</script>
</head>
<body>
	<div class="container">

		<form class="form-signin" name="loginForm" method="post" action="/defaults/loginProcess.do">
			<input type="hidden" name="forwardUrl" value="${forwardUrl}"/>
			<h2 class="form-signin-heading">Please sign in</h2>
			<label for="cust_id" class="sr-only">Email or ID</label>
			<input type="text" id="cust_id" name="cust_id" class="form-control" placeholder="Email or ID" required="required" autofocus="autofocus"> 
			<label for="password" class="sr-only">Password</label>
			<input type="password" id="password" name="password" class="form-control" placeholder="Password" required="required" onkeydown="javascript:keyDown_login();">
			<div class="checkbox">
				<label><input type="checkbox" id="keep_login" name="keep_login" onclick="autoChk();" value="1">로그인 유지</label>
				<label><input type="checkbox" id="keep_id" name="checksaveid" onclick="javascript:saveidalert();">아이디 저장</label>
			</div>
			<a href="javascript:;" onclick="javascript:login();return false;" ><button class="btn btn-lg btn-primary btn-block" type="button">Login</button></a>
			<br/>
			<a href="/cust/custJoin.do"><button class="btn btn-lg btn-primary btn-block" type="button">Join in</button></a>
		</form>

	</div>
	<!-- /container -->

	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript" src="${path_root}/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

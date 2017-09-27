<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path_root"  value="${pageContext.request.contextPath}" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${path_root}/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${path_root}/resources/bootstrap/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${path_root}/resources/bootstrap/css/style.css">
<script type="text/javascript">
	
	function cancle(){
		location.href = "/defaults/main.do";
	}
	
	// 비밀번호 확인
	function check_confirm_passwd(form, passwd, passwd_confirm){
		var form = document.custInputForm;
		if (passwd != '' && passwd_confirm != '') {
			if(passwd == passwd_confirm) {
				document.getElementById("pwcomment").innerHTML = "<strong>비밀번호 확인이 완료되었습니다.</strong>";
				return true;
			}else{
				alert("비밀번호가 일치하지 않습니다.");
				document.getElementById("pwcomment").innerHTML = "<strong>비밀번호가 일치하지 않습니다.</string>";
				return false;
			}
		}
	}
</script>
</head>
<body>
	<article class="container">
		<div class="col-md-12">
			<div class="page-header">
				<h1>
					회원가입 <small>아래 항목을 입력해주세요.</small>
				</h1>
			</div>
			<form class="form-horizontal" name="custInputForm" method="post" action="/cust/custJoinOk.do">
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputCustId">아이디</label>
					<div class="col-sm-6">
						<input class="form-control" name="cust_id" id="inputCustId" type="text" placeholder="ID" required="required">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputEmail">이메일</label>
					<div class="col-sm-6">
						<input class="form-control" name="email" id="inputEmail" type="email" placeholder="Email address" required="required">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
					<div class="col-sm-6">
						<input class="form-control" name="password" id="inputPassword" type="password" placeholder="비밀번호" required="required">
						<p class="help-block">숫자, 문자 포함 8자 이상</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호  확인</label>
					<div class="col-sm-6">
						<input class="form-control" id="inputPasswordCheck" type="password" placeholder="비밀번호를 한번더 입력해주세요." 
						onblur="check_confirm_passwd(document.custInputForm , document.getElementById('inputPassword').value, this.value);" required="required">
						<div class="text-danger" id="pwcomment"></div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputName">이름</label>
					<div class="col-sm-6">
						<input class="form-control" name="cust_name" id="inputName" type="text" placeholder="이름">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputAgree">약관 동의</label>
					<div class="col-sm-6" data-toggle="buttons">
						<label class="btn btn-warning active"> 
							<input id="agree" type="checkbox" autocomplete="off" >
								<span class="fa fa-check"></span>
						</label> <a href="#">이용약관</a> 에 동의 합니다.
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12 text-center">
						<button class="btn btn-primary" type="submit">
							회원가입<i class="fa fa-check spaceLeft"></i>
						</button>
						<button class="btn btn-danger" type="button" onclick="javascript:cancle();">
							가입취소<i class="fa fa-times spaceLeft"></i>
						</button>
					</div>
				</div>
			</form>
			<hr>
		</div>
	</article>

	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript" src="${path_root}/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
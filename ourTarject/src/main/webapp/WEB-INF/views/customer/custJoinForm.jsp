<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/bootstrap/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/bootstrap/css/style.css">
<script type="text/javascript">
	
	function cancle(){
		location.href = "/main.do";
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
			<form class="form-horizontal" name="custJoin" method="post" action="/cust/custJoinOk.do">
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputEmail">이메일</label>
					<div class="col-sm-6">
						<input class="form-control" id="inputEmail" type="email" placeholder="Email address" required="required">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
					<div class="col-sm-6">
						<input class="form-control" id="inputPassword" type="password" placeholder="비밀번호" required="required">
						<p class="help-block">숫자, 문자 포함 8자 이상</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호  확인</label>
					<div class="col-sm-6">
						<input class="form-control" id="inputPasswordCheck" type="password" placeholder="비밀번호 확인" required="required">
						<p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputName">이름</label>
					<div class="col-sm-6">
						<input class="form-control" id="inputName" type="text" placeholder="이름">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputNumber">휴대폰번호</label>
					<div class="col-sm-6">
						<div class="input-group">
							<input type="tel" class="form-control" id="inputNumber" placeholder="- 없이 입력해 주세요" /> 
							<span class="input-group-btn">
								<button class="btn btn-success">
									인증번호 전송<i class="fa fa-mail-forward spaceLeft"></i>
								</button>
							</span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputNumberCheck">인증번호 확인</label>
					<div class="col-sm-6">
						<div class="input-group">
							<input class="form-control" id="inputNumberCheck" type="text" placeholder="인증번호"> 
							<span class="input-group-btn">
								<button class="btn btn-success" type="button">
									인증번호 확인<i class="fa fa-edit spaceLeft"></i>
								</button>
							</span>
						</div>
						<p class="help-block">전송된 인증번호를 입력해주세요.</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputAgree">약관
						동의</label>
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
	<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
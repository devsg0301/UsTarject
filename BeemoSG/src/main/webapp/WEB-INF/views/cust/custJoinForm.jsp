<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path_root"  value="${pageContext.request.contextPath}" scope="application"/>
<!DOCTYPE html>
<html lang="ko">

<head>
<c:import url="../common/includecommon.jsp" />

<script type="text/javascript">
	var idChecked = false;
	var checkedId = ""; //중복체크후 아이디가 변경되었을 경우!
	
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
	
	function idCheck(){
		if($("#inputCustId").val() == ''){
			alert("아이디를 입력해주세요.");
			return;
		}
		
	    $.ajax({
	        type: "GET",
	        url : "/cust/idCheck.do",
	        data: { "cust_id" : $("#inputCustId").val() },
	        async: true,
	        success : function(data) {
	            if(data == "ok"){
	            	alert("사용 가능한 아이디 입니다.");
	            	checkedId = $("#inputCustId").val();
	            	idChecked = true;
	            }else if(data == "no"){
	            	alert("이미 사용된 아이디 입니다.");
	            	$("#inputCustId").val("")
	            }
	        }	        
	    });
	}
	
	function cust_join(){
		var form = document.custJoinForm;
		
		if($("#inputName").val() == ''){
			alert("이름을 입렵해주세요.");
			$("#inputName").focus();
			return;
		}
		if($("#inputPassword").val() == ''){
			alert("비밀번호를 입렵해주세요.");
			$("#inputPassword").focus();
			return;
		}
		if($("#inputEmail").val() == ''){
			alert("이메일 주소를 입렵해주세요.");
			$("#inputEmail").focus();
			return;
		}
		if($("#inputHp").val() == ''){
			alert("휴대폰 번호를 입렵해주세요.");
			$("#inputHp").focus();
			return;
		}
		if(!idChecked){
			alert("아이디 중복확인을 해야합니다.");
			return;
		}
		if(form.cust_id.value != checkedId){
			alert("아이디 중복확인을 다시 해야합니다.");
			return;
		}
		form.submit();
	}

</script>
</head>
<body>
	<!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <c:import url="../common/header.jsp" />
        <!-- /.container -->
    </nav>
    
    <!-- Page Content -->
    <div class="container" style="background-color: #fff; box-shadow: 0px 0px 10px 0px #6f6f6f;">
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb_sgcloud">
                    <li>
                    	<a href="/defaults/main.do"><i class="fas fa-home"></i> Home</a>
                    </li>                    
                    <li class="active">회원가입</li>
                </ol>
            </div>
        </div>
		<!-- Content Row -->
        <div class="row">
			<div class="col-md-12">
				<form class="form-horizontal" name="custJoinForm" method="post" action="/cust/custJoinOk.do">
					<div class="form-group">
						<label class="col-sm-3 control-label" for="inputName">*이름</label>
						<div class="col-sm-6">
							<input class="form-control" name="cust_name" id="inputName" type="text" placeholder="이름" required="required">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="inputCustId">*아이디</label>
						<div class="col-sm-6">
							<input style="width: 70%; display: inline;" class="form-control" name="cust_id" id="inputCustId" type="text" placeholder="아이디" required="required">
							<button class="btn btn-default" type="button" onclick="javascript:idCheck();">중복체크</button>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="inputPassword">*비밀번호</label>
						<div class="col-sm-6">
							<input class="form-control" name="password" id="inputPassword" type="password" placeholder="비밀번호" required="required">						
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="inputPasswordCheck">*비밀번호 확인</label>
						<div class="col-sm-6">
							<input class="form-control" id="inputPasswordCheck" type="password" placeholder="비밀번호를 한번더 입력해주세요." 
							onblur="check_confirm_passwd(document.custInputForm , document.getElementById('inputPassword').value, this.value);" required="required">
							<div class="text-danger" id="pwcomment"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="inputEmail">*이메일</label>
						<div class="col-sm-6">
							<input class="form-control" name="email" id="inputEmail" type="email" placeholder="이메일주소 입력" required="required">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="inputEmail">*휴대폰(HP)</label>
						<div class="col-sm-6">
							<input class="form-control" name="hp" id="inputHp" type="number" placeholder="숫자만 입력" required="required">
						</div>
					</div>
					<div class="form-group">
						<div class="" style="padding-top: 7px; font-weight: 700; text-align: center;">
							<p>★ 가입 후 등업 신청을 해야 정상적으로 이용이 가능합니다!!</p>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12 text-center">
							<button class="btn btn-primary" type="button" onclick="javascript:cust_join();">
								회원가입<i class="fas fa-check spaceLeft"></i>
							</button>
							<button class="btn btn-danger" type="button" onclick="javascript:cancle();">
								가입취소<i class="fas fa-times spaceLeft"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- Footer -->
        <footer>
            <c:import url="../common/footer.jsp" />
        </footer>		
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">
	.modal-dialog {
	    width: 300px;    
	}
	.modal-footer {
	    height: 70px;
	    margin: 0;
	}
	.modal-footer .btn {
	    font-weight: bold;
	}
	.modal-footer .progress {
	    display: none;
	    height: 32px;
	    margin: 0;
	}
	.input-group-addon {
	    color: #fff;
	    background: #3276B1;
	}
	.modal-footer-pw {
	    height: 30px;
	    margin: 0;
        text-align: center;
	}
</style>

<div class="row">
	<div class="col-lg-12">
		<p>Copyright &copy; BeemoSG Website 2017</p>
	</div>
</div>

<!-- 로그인 팝업 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">Log in</h4>
			</div> <!-- /.modal-header -->

			<div class="modal-body">
				<form class="form-signin" name="loginForm" id="loginForm" method="post" action="/defaults/loginProcess.do">
					<div class="form-group">
						<div class="input-group">
							<input type="text" class="form-control" id="cust_id" name="cust_id" placeholder="아이디" required="required" autofocus="autofocus">
							<label for="cust_id" class="input-group-addon"><i class="fas fa-user fa-fw" aria-hidden="true"></i></label>
						</div>
					</div> <!-- /.form-group -->

					<div class="form-group">
						<div class="input-group">
							<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" required="required" onkeydown="javascript:keyDown_login();">
							<label for="password" class="input-group-addon"><i class="fas fa-lock fa-fw" aria-hidden="true"></i></label>
						</div> <!-- /.input-group -->
					</div> <!-- /.form-group -->

					<div class="checkbox">
						<label><input type="checkbox" id="keep_login" name="keep_login" onclick="javascript:autoChk();" checked="checked" value="1">로그인 유지</label>
						<label><input type="checkbox" id="keep_id" name="checksaveid" onclick="javascript:saveidalert();" checked="checked" value="1">아이디 저장</label>
					</div> <!-- /.checkbox -->
				</form>
				<div class="modal-footer">
					<a href="javascript;" onclick="javascript:login();return false;" style="text-decoration: none;">
						<button class="form-control btn btn-primary" style="width: 47%; float: left;">로그인</button>
					</a>
					<a href="/cust/custJoin.do">
						<button class="form-control btn btn-primary" style="width: 47%;">회원가입</button>
					</a>
				</div> <!-- /.modal-footer -->
				<div class="modal-footer-pw">
					<a href="javascript;" onclick="javascript:idPwFind();return false;" style="text-decoration: none;">
						아이디/비밀번호 찾기
					</a>
				</div> <!-- /.modal-footer -->
			</div> <!-- /.modal-body -->
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript">
window.onload = function(){
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
	if (form.cust_id.value != '') {
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
	if (form.cust_id.value != '') {
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

	//form.submit();
	$.ajax({
	    type: "GET",
	    url : "/defaults/loginAjax.do",	    
	    data: {"cust_id" : $("#cust_id").val(), "password" : $("#password").val(), "keep_login" : form.keep_login.value},	    
	    async: true,
	    success : function(data) {
	    	if(data != "fail"){
	    		alert(decodeURIComponent(data) + "님이 로그인 하셨습니다.");
	    		location.href = "/defaults/main.do";
	        }else if(data == "fail"){
	        	alert("아이디 또는 비밀번호가 일치하지 않습니다.");
	        }
	    },
	    error: function(xhr, ajaxOptions, thrownError) {
			alert("일시적인 장애가 발생하였습니다.");
			//location.href = "/defaults/login.do";
			return false;
		}
	});
}

function idPwFind(){
	alert("관리자에게 문의해 주세요.");
}

</script>

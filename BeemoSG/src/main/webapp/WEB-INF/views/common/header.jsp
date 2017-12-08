<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 
<style type="text/css">
#sidebar-wrapper {
	margin-right: -300px;
	right: 0;
	width: 300px;
	background: rgb(255, 255, 255);
	position: fixed;
	height: 100%;
	overflow-y: auto;
	z-index: 1000;
	transition: all 0.5s ease-in 0s;
	-webkit-transition: all 0.5s ease-in 0s;
	-moz-transition: all 0.5s ease-in 0s;
	-ms-transition: all 0.5s ease-in 0s;
	-o-transition: all 0.5s ease-in 0s;
}

#menu-toggle {
	top: 0;
	right: 0;
	position: fixed;
	z-index: 1;
}

#sidebar-wrapper.active {
	right: 300px;
	width: 300px;
	transition: all 0.5s ease-out 0s;
	-webkit-transition: all 0.5s ease-out 0s;
	-moz-transition: all 0.5s ease-out 0s;
	-ms-transition: all 0.5s ease-out 0s;
	-o-transition: all 0.5s ease-out 0s;
}

.profile-userpic img {
	float: none;
	margin: 0 auto;
	width: 50%;
	height: 50%;
	-webkit-border-radius: 50% !important;
	-moz-border-radius: 50% !important;
	border-radius: 50% !important;
}

.profile-usertitle {
	text-align: center;
	margin-top: 20px;
}

.profile-usertitle-name {
	color: #5a7391;
	font-size: 16px;
	font-weight: 600;
	margin-bottom: 7px;
}

.profile-usertitle-job {
	text-transform: uppercase;
	color: #5b9bd1;
	font-size: 12px;
	font-weight: 600;
	margin-bottom: 15px;
}

.profile-userbuttons {
	text-align: center;
	margin-top: 10px;
}

.profile-userbuttons .btn {
	text-transform: uppercase;
	font-size: 11px;
	font-weight: 600;
	padding: 6px 15px;
	margin-right: 5px;
}

.profile-userbuttons .btn:last-child {
	margin-right: 0px;
}

.profile-usermenu {
	margin-top: 30px;
}

.profile-usermenu ul li {
	border-bottom: 1px solid #f0f4f7;
}

.profile-usermenu ul li:last-child {
	border-bottom: none;
}

.profile-usermenu ul li a {
	color: #93a3b5;
	font-size: 14px;
	font-weight: 400;
}

.profile-usermenu ul li a i {
	margin-right: 8px;
	font-size: 14px;
}

.profile-usermenu ul li a:hover {
	background-color: #fafcfd;
	color: #5b9bd1;
}

.profile-usermenu ul li.active {
	border-bottom: none;
}

.profile-usermenu ul li.active a {
	color: #5b9bd1;
	background-color: #f6f9fb;
	border-left: 2px solid #5b9bd1;
	margin-left: -2px;
}

/* Profile Content */
.profile-content {
	padding: 20px;
	background: #fff;
	min-height: 460px;
}
</style>
 -->
<%-- 
<div id="sidebar-wrapper">
	<div class="sidebar-nav">
		<div>
			<img src="${path_root}/resources/bootstrap/images/profile.png" class="img-responsive center-block" alt="">
		</div>
		<div class="profile-userpic">
			<img src="${path_root}/resources/bootstrap/images/profile.png" class="img-responsive center-block" alt="">
			<h3>BeemoSG</h3>
		</div>
		<c:if test="${sessionScope.userLoginInfo.cust_id != ''}">
		<div class="profile-usertitle">
			<div class="profile-usertitle-name">
				이름 : ${sessionScope.userLoginInfo.cust_name}<br/>
	 			아이디 : ${sessionScope.userLoginInfo.cust_id}<br/>
			</div>
		</div>
		<!-- END SIDEBAR USER TITLE -->
		<!-- SIDEBAR BUTTONS -->
		<div class="profile-userbuttons">
			<button type="button" class="btn btn-danger btn-sm">로그아웃</button>
		</div>
		</c:if>
		<c:if test="${sessionScope.userLoginInfo.cust_id == ''}">
		<div class="profile-userbuttons">
			<button type="button" class="btn btn-success btn-sm">로그인</button>
		</div>
		</c:if>
	</div>
</div>
 --%>
<div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
    	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/defaults/main.do">BeemoSG</a>
    </div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav navbar-right">
            <li class="<c:if test="${dropdown == 'sgCloud'}">active</c:if>">
                <a href="/sgCloud/sgCloud_main.do">sgCloud</a>
            </li>
            <li>
                <a href="#">Services</a>
            </li>
            <li>
                <a href="#">Contact</a>
            </li>
            <!-- 
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Portfolio <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="#">1 Column Portfolio</a>
                    </li>
                    <li>
                        <a href="#">2 Column Portfolio</a>
                    </li>
                    <li>
                        <a href="#">3 Column Portfolio</a>
                    </li>
                    <li>
                        <a href="#">4 Column Portfolio</a>
                    </li>
                    <li>
                        <a href="#">Single Portfolio Item</a>
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Other Pages <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="#">Full Width Page</a>
                    </li>
                    <li>
                        <a href="#">Sidebar Page</a>
                    </li>
                    <li>
                        <a href="#">FAQ</a>
                    </li>
                    <li>
                        <a href="#">404</a>
                    </li>
                    <li>
                        <a href="#">Pricing Table</a>
                    </li>
                </ul>
            </li>
            <li>
				<a id="menu-toggle" href="#" class="point-hover btn-lg toggle"><i class="fa fa-bars"></i></a>
			</li>
			 -->
        </ul>
    </div>
    <!-- /.navbar-collapse -->
</div>
<%-- 
<script src="${path_root}/resources/bootstrap/js/jquery.js"></script>

<script type="text/javascript">

	$("#menu-close").click(function(e) {
		e.preventDefault();
		$("#sidebar-wrapper").toggleClass("active");
	});
	$("#menu-toggle").click(function(e) {
		e.preventDefault();
		$("#sidebar-wrapper").toggleClass("active");
	});
</script> 
--%>
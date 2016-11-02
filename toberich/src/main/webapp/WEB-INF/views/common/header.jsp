<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="skip">
	<a href="#content">메뉴 건너뛰기</a>
</div>
<!-- S :: 메뉴 사이드 바 -->

<section class="side-pannel-menu" sidebarjs="">
	<div sidebarjs-container="">
		<a class="close-btn" sidebarjs-toggle=""><i class="xi-close fa-lg"></i></a>
		<div class="profile">
			<img src="${path_root}/resources/common/images/profile.png" class="img-responsive center-block" alt="">
			<h3>KSODESIGN</h3>
		</div>
		<div class="pannel-wrapper">
			<!-- S :: 로그인 하는 부분 -->
			<div class="pannel-form mb-40 visible-md visible-lg">
				<!-- S :: 로그인 폼 부분 
				<form action="./" method="post">
					<input type="hidden" name="error_return_url" value="/display/sum_home1">
					<input type="hidden" name="mid" value="sum_home1"> 
					<input type="hidden" name="vid" value=""> 
					<input type="hidden" name="ruleset" value="@login"> 
					<input type="hidden" name="act" value="procMemberLogin"> 
					<input type="hidden" name="success_return_url" value="/display/sum_home1">
					<div style="margin-bottom: 15px">
						<input type="text" class="ss-placeholder form-control" name="user_id" id="uid" value="" placeholder="아이디" required="">
					</div>
					<div>
						<input class="form-control ss-placeholder" type="password" name="password" id="upw" value="" placeholder="비밀번호" required="">
					</div>
					<div class="checkbox" style="overflow: hidden">
						<label for="keepid_opt" class="help-inline keep-sign pull-left"> 
							<input type="checkbox" name="keep_signed" id="keepid_opt" value="Y" onclick="if(this.checked) return confirm('브라우저를 닫더라도 로그인이 계속 유지될 수 있습니다.\n\n로그인 유지 기능을 사용할 경우 다음 접속부터는 로그인할 필요가 없습니다.\n\n단, 게임방, 학교 등 공공장소에서 이용 시 개인정보가 유출될 수 있으니 꼭 로그아웃을 해주세요.');"> 
							로그인 유지
						</label> 
						<a href="/display/index.php?mid=sum_home1&amp;act=dispMemberFindAccount" class="pull-right find-account">ID/PW 찾기</a>
					</div>
					<div class="clearfix" style="margin-top: 30px;">
						<a href="/display/index.php?mid=sum_home1&amp;act=dispMemberSignUpForm" class="btn-ss btn-small pull-left" style="width: 49%">회원가입</a>
						<button class="btn-ss btn-small pull-right" style="width: 49%">로그인</button>
					</div>
				</form> 
				E :: 로그인 폼 부분 -->
				<div>
			        <h2>안녕하세요.</h2>
			        	이름 : ${sessionScope.userLoginInfo.cust_name}<br/>
			 
			        	이메일 : <c:out value="${sessionScope.userLoginInfo.email}"/> 
				</div>
				<div class="clearfix" style="margin-top: 30px;">
					<a href="/defaults/logout.do" class="btn-ss btn-small pull-left" style="width: 49%">로그아웃</a>
				</div>
			</div>
			<!-- S :: 모바일 로그인 메뉴 
			<div class="pannel-menu visible-xs visible-sm">
				<div class="col-xs-4 padding-none">
					<a href="#" data-toggle="modal" data-target=".modal-lang"><i class="fa fa-globe"></i><br>
					<span>한국어</span></a>
				</div>
				<div class="col-xs-4 padding-none">
					<a href="/display/index.php?mid=sum_home1&amp;act=dispMemberSignUpForm">
						<i class="fa fa-user-plus"></i><br>
						<span>회원가입</span>
					</a>
				</div>
				<div class="col-xs-4 padding-none">
					<a href="/display/index.php?mid=sum_home1&amp;act=dispMemberLogin">
						<i class="fa fa-lock"></i><br>
						<span>로그인</span>
					</a>
				</div>
			</div>
			E :: 모바일 로그인 메뉴 -->
			<!-- E :: 로그인 하는 부분 -->
			<!-- S :: 로그인 메뉴 하단 내용부분 
			<div class="pannel-search mb-40 visible-xs visible-sm">
				<form action="http://ssstudio.com/display/" method="get" id="ss-search">
					<input type="hidden" name="vid" value=""> 
					<input type="hidden" name="mid" value="sum_home1"> 
					<input type="hidden" name="act" value="IS"> 
					<span class="search-ico"><i class="fa fa-search"></i></span> 
					<input type="text" name="is_keyword" value="" class="ss-placeholder search-box" required="required" placeholder="Search">
				</form>
			</div>
			<div class="pannel-widget mb-40">
				<h5 class="line-bottom line-span">
					<span>LATEST POSTS</span>
				</h5>
				<div>
					<div class="xe-widget-wrapper " style="">
						<div style="*zoom: 1; padding: 0px 0px 0px 0px !important;">
							<div class="ss_rwdContainer">
								<table class="ss_rwdTable" border="1" cellspacing="0">
									<tbody>
										<tr>
											<td class="title">
												<a href="/display/1672" class="list-title colorHover">대한 구하지 그들은 운다. ...</a> 
												<span class="icon"></span>
											</td>
											<td><span class="date">2016.10.06</span>&nbsp;&nbsp;</td>
										</tr>
										<tr>
											<td class="title"><a href="/display/1673" class="list-title colorHover">인류의 우는 만물은 낙원을 ...</a> 
												<span class="icon"></span>
											</td>
											<td><span class="date">2016.10.06</span>&nbsp;&nbsp;</td>
										</tr>
										<tr>
											<td class="title"><a href="/display/1674" class="list-title colorHover">바로 돋고, 우리는 속에 못...</a> 
												<span class="icon"></span>
											</td>
											<td><span class="date">2016.10.06</span>&nbsp;&nbsp;</td>
										</tr>
										<tr>
											<td class="title"><a href="/display/1675" class="list-title colorHover">얼음 찾아 철환하였는가 우...</a> 
												<span class="icon"></span>
											</td>
											<td><span class="date">2016.10.06</span>&nbsp;&nbsp;</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="pannel-social mb-40">
				<ul class="list-unstyled list-inline">
					<li class="social-icon"><a href="" target="_blank" class="point-hover"> <i class="xi-facebook fa-lg"></i></a></li>
					<li class="social-icon"><a href="" target="_blank" class="point-hover"> <i class="xi-twitter fa-lg"></i></a></li>
					<li class="social-icon"><a href="" target="_blank" class="point-hover"> <i class="xi-kakaotalk fa-lg"></i></a></li>
					<li class="social-icon"><a href="" target="_blank" class="point-hover"> <i class="xi-youtube fa-lg"></i></a></li>
				</ul>
			</div>
			E :: 로그인 메뉴 하단 내용부분 -->
		</div>
	</div>
	<div sidebarjs-background=""></div>
</section>

<!-- E :: 메뉴 사이드 바 -->
<!-- S :: 헤더 메뉴 -->
<header class="ss-header">
	<nav class="navbar navbar-default  navbar-fixed bootsnav on menu-center no-full">
		<div class="top-search">
			<div class="container">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-search"></i></span>
					<form action="http://ssstudio.com/display/" method="get" class="search">
						<input type="hidden" name="vid" value=""> 
						<input type="hidden" name="mid" value="sum_home1"> 
						<input type="hidden" name="act" value="IS"> 
						<input type="text" name="is_keyword" value="" class="form-control" required="required" title="검색" placeholder="Search">
					</form>
					<span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<div class="attr-nav">
				<ul>
					<li class="lang-modal">
						<a href="#" class="point-hover" data-toggle="modal" data-target=".modal-lang"><i class="fa fa-globe"></i></a>
					</li>
					<li class="search visible-md visible-lg">
						<a href="#" class="point-hover"><i class="fa fa-search"></i></a>
					</li>
					<li class="" sidebarjs-toggle="">
						<a href="#" class="point-hover"><i class="fa fa-bars"></i></a>
					</li>
				</ul>
			</div>
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
					<i class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand" href="/defaults/main.do"> 
					<img src="${path_root}/resources/common/images/logo-black.png" class="side-logo img-responsive" alt="">
				</a>
			</div>
			<div class="collapse navbar-collapse" id="navbar-menu">
				<ul class="nav navbar-nav navbar-center" data-in="fadeIn" data-out="fadeOut">
					<li class="dropdown active"><a href="/defaults/main.do" class="point-hover "><span>MAIN DEFAULT</span></a></li>
					<li class="dropdown"><a href="#" class="point-hover "><span>COPORATE</span></a></li>
					<li class="dropdown"><a href="#" class="point-hover "><span>MUSIC</span></a></li>
					<li class="dropdown"><a href="#" class="point-hover "><span>STUDIO</span></a></li>
					<li class="dropdown"><a href="#" class="point-hover "><span>PAGE</span></a></li>
					<li class="dropdown"><a href="/board/board.do" class="point-hover dropdown-toggle" data-toggle="dropdown"><span>BOARD</span></a>
						<!-- 하위 메뉴 나타낼 경우 사용!! 
						<ul class="dropdown-menu ss-animated fadeOut">
							<li class="dropdown"><a href="/display/sum_list" class="point-hover "><span>스케치북 목록형</span></a></li>
							<li class="dropdown"><a href="/display/sum_zine_h" class="point-hover "><span>스케치북 웹진 가로형</span></a></li>
							<li class="dropdown"><a href="/display/sum_zine_v" class="point-hover "><span>스케치북 웹진 세로형</span></a></li>
							<li class="dropdown"><a href="/display/sum_gallery" class="point-hover dropdown-toggle" data-toggle="dropdown"><span>스케치북 갤러리형</span></a>
								<ul class="dropdown-menu ss-animated">
									<li class="dropdown"><a href="#" class="point-hover "><span>3차 메뉴 샘플</span></a></li>
									<li class="dropdown"><a href="#" class="point-hover dropdown-toggle" data-toggle="dropdown"><span>3차 메뉴 샘플</span></a>
										<ul class="dropdown-menu ss-animated"> 
											<li class=""><a href="#" class="point-hover"><span>4차 메뉴 샘플</span></a></li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>
						 -->
					</li>
					<li class="dropdown">
						<a href="/defaults/main.do" class="point-hover " target="_blank">
							<span><i class="fa fa-shopping-cart"></i>&nbsp; PURCHASE</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div id="modal-login" class="modal fade modal-login" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title text-center">WELCOME</h4>
				</div>
				<div class="modal-body">
					<form action="./" method="post">
						<input type="hidden" name="error_return_url" value="/display/sum_home1">
						<input type="hidden" name="mid" value="sum_home1">
						<input type="hidden" name="vid" value="">
						<input type="hidden" name="ruleset" value="@login"> 
						<input type="hidden" name="act" value="procMemberLogin"> 
						<input type="hidden" name="success_return_url" value="/display/sum_home1">
						<div class="modal-input-box">
							<input type="email" class="form-control" name="user_id" id="uid" value="" placeholder="이메일" required="">
						</div>
						<div class="modal-input-box">
							<input class="form-control" type="password" name="password" id="upw" value="" placeholder="비밀번호" required="">
						</div>
						<div class="checkbox" style="margin-bottom: 20px;">
							<label for="keepid_opt" class="help-inline pull-left">
								<input type="checkbox" name="keep_signed" id="keepid_opt" value="Y" onclick="if(this.checked) return confirm('브라우저를 닫더라도 로그인이 계속 유지될 수 있습니다.\n\n로그인 유지 기능을 사용할 경우 다음 접속부터는 로그인할 필요가 없습니다.\n\n단, 게임방, 학교 등 공공장소에서 이용 시 개인정보가 유출될 수 있으니 꼭 로그아웃을 해주세요.');">
								로그인 유지
							</label> 
							<a href="/display/index.php?mid=sum_home1&amp;act=dispMemberFindAccount" class="pull-right">ID/PW 찾기</a>
						</div>
						<input type="submit" class="btn-ss btn-block" value="로그인">
					</form>
				</div>
				<div class="modal-footer">
					<div class="text-center">
						Don't have an account?<br> 
						<a href="/display/index.php?mid=sum_home1&amp;act=dispMemberSignUpForm" class="btn-signup">회원가입</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="modal-login" class="modal fade modal-lang" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title text-center">LANGUAGE : 한국어</h4>
				</div>
				<form action="./" method="post" class="clear">
					<input type="hidden" name="error_return_url" value="/main.do">
					<input type="hidden" name="act" value="">
					<input type="hidden" name="mid" value="sum_home1">
					<input type="hidden" name="vid" value="">
					<input type="hidden" name="ruleset" value="@login">
					<div class="modal-body">
						<ul class="lang_list list-unstyled" role="menu">
							<li>
								<i class="fa fa-arrow-circle-right"></i>&nbsp; 
								<a href="#" onclick="doChangeLangType('en');return false;">English</a>
							</li>
							<li>
								<i class="fa fa-arrow-circle-right"></i>&nbsp; 
								<a href="#" onclick="doChangeLangType('jp');return false;">日本語</a>
							</li>
							<li>
								<i class="fa fa-arrow-circle-right"></i>&nbsp; 
								<a href="#" onclick="doChangeLangType('zh-CN');return false;">中文(中国)</a>
							</li>
						</ul>
					</div>
					<input type="hidden" name="captchaType" value="inline">
				</form>
				<div class="modal-footer">
					<button type="button" class="btn-ss btn-block" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</header>
<!-- E :: 헤더 메뉴 -->
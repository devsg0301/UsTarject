<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<c:set var="path_root"  value="${pageContext.request.contextPath}" scope="application"/>
<!DOCTYPE html>
<html lang="ko" class="modernizr-js modernizr-flexbox modernizr-flexboxlegacy modernizr-canvas modernizr-canvastext modernizr-webgl modernizr-touch modernizr-geolocation modernizr-postmessage modernizr-websqldatabase modernizr-indexeddb modernizr-hashchange modernizr-history modernizr-draganddrop modernizr-websockets modernizr-rgba modernizr-hsla modernizr-multiplebgs modernizr-backgroundsize modernizr-borderimage modernizr-borderradius modernizr-boxshadow modernizr-textshadow modernizr-opacity modernizr-cssanimations modernizr-csscolumns modernizr-cssgradients modernizr-cssreflections modernizr-csstransforms modernizr-csstransforms3d modernizr-csstransitions modernizr-fontface modernizr-generatedcontent modernizr-video modernizr-audio modernizr-localstorage modernizr-sessionstorage modernizr-webworkers modernizr-applicationcache modernizr-svg modernizr-inlinesvg modernizr-smil modernizr-svgclippaths">
<head>
<!-- META -->
<meta charset="utf-8">
<meta name="Generator" content="XpressEngine">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- TITLE -->
<title>석양이 진다</title>
<!-- CSS -->
<link rel="stylesheet" href="${path_root}/resources/common/css/xe.min.css" />
<link rel="stylesheet" href="${path_root}/resources/common/js/plugins/ui/jquery-ui.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="${path_root}/resources/etc/board/skin/css/board.css" />
<link rel="stylesheet" href="${path_root}/resources/sunset/css/bootstrap.min.css">
<link rel="stylesheet" href="${path_root}/resources/sunset/css/animate.css" />
<link rel="stylesheet" href="${path_root}/resources/sunset/css/bootsnav.css" />
<link rel="stylesheet" href="${path_root}/resources/sunset/css/bootsnav.overwrite.css" />
<link rel="stylesheet" href="${path_root}/resources/sunset/css/bootsnav.color.css" />
<link rel="stylesheet" href="${path_root}/resources/sunset/css/sidebarjs.css" />
<link rel="stylesheet" href="${path_root}/resources/sunset/css/owl.carousel.min.css" />
<link rel="stylesheet" href="${path_root}/resources/sunset/css/owl.theme.default.css" />
<link rel="stylesheet" href="${path_root}/resources/sunset/css/lightgallery.min.css" />
<link rel="stylesheet" href="${path_root}/resources/common/css/xeicon.min.css" />
<link rel="stylesheet" href="${path_root}/resources/sunset/css/font-awesome.min.css" />
<link rel="stylesheet" href="${path_root}/resources/sunset/css/board.css" />
<link rel="stylesheet" href="${path_root}/resources/sunset/css/ss-design.min.css" />
<link rel="stylesheet" href="${path_root}/resources/sunset/css/ss-layout.css" />
<link rel="stylesheet" href="${path_root}/resources/sunset/css/ss-custom.css" />
<link rel="stylesheet" href="${path_root}/resources/etc/editor/style/css/style.css" />
<!-- JS -->
<script src="${path_root}/resources/common/js/jquery.min.js"></script>
<script src="${path_root}/resources/common/js/x.min.js"></script>
<script src="${path_root}/resources/common/js/xe.min.js"></script>
<script src="${path_root}/resources/etc/board/js/board.min.js"></script>
<script src="${path_root}/resources/common/js/html5.js"></script>
<script src="${path_root}/resources/common/js/respond.min.js"></script>
<script src="${path_root}/resources/sunset/js/imagesloaded.pkgd.min.js"></script>
<script src="${path_root}/resources/sunset/js/bootstrap.min.js"></script>
<script src="${path_root}/resources/sunset/js/bootsnav.js"></script>
<script src="${path_root}/resources/sunset/js/jquery.sidebarjs.min.js"></script>
<script src="${path_root}/resources/sunset/js/owl.carousel.min.js"></script>
<script src="${path_root}/resources/sunset/js/jquery.wow.min.js"></script>
<script src="${path_root}/resources/sunset/js/jquery.parallaxer.js"></script>
<script src="${path_root}/resources/sunset/js/lightgallery-all.min.js"></script>
<script src="${path_root}/resources/sunset/js/holder.js"></script>
<script src="${path_root}/resources/sunset/js/jquery.ss.js"></script>
<!-- RSS -->
<!-- ICON -->

<script>
	if (!captchaTargetAct) {
		var captchaTargetAct = [];
	}
	captchaTargetAct.push("procBoardInsertDocument", "procBoardInsertComment",
			"procIssuetrackerInsertIssue", "procIssuetrackerInsertHistory",
			"procTextyleInsertComment");
</script>
<script>
	if (!captchaTargetAct) {
		var captchaTargetAct = [];
	}
	captchaTargetAct.push("");
</script>
<script type="text/javascript">
	function board_save(){
		document.form.submit();
	}

</script>
<style>
.xe_content {
	font-size: 14px;
}
</style>
<link rel="canonical" href="${path_root}/board/write.do">
<meta property="og:locale" content="ko_KR">
<meta property="og:type" content="website">
<meta property="og:url" content="${path_root}/board/write.do">
<meta property="og:title" content="석양이 진다">
<style type="text/css">
.point-color, .point-hover:hover, a.point-hover:hover {
	color: #b1abd3 !important;
}

.point-bgcolor {
	background-color: #b1abd3;
}

.point-bghover:hover {
	color: #fff;
	background-color: #b1abd3;
}

.active>a, .aside .side-nav .list-group-item.on {
	color: #b1abd3 !important;
}

#loader>span {
	border-top-color: #b1abd3 !important;
}

.btn-line:hover {
	border-color: #b1abd3 !important;
}
/* YTPlayer loading img */
.ss-player {
	background-image: url(../resources/common/images/loading.gif);
} /* media query */
@media ( min-width : 992px) {
	body {
		padding: 0;
	}
	nav.navbar.bootsnav ul.nav>li>a {
		padding-left: 20px;
		padding-right: 20px;
	}
	.ss-player, .player-caption {
		height: 850px;
	}
	.sub-header {
		height: 300px;
	}
}

@media ( max-width : 991px) {
	.ss-player, .player-caption {
		height: 600px;
	}
}

@media ( max-width : 767px) {
	.ss-player, .player-caption {
		height: 450px;
	}
}

@media ( max-width : 480px) {
	.ss-player, .player-caption {
		height: 250px;
	}
}
</style>
<style data-id="bdCss">
.bd em, .bd .color {
	color: #333333;
}

.bd .shadow {
	text-shadow: 1px 1px 1px;
}

.bd .bolder {
	color: #333333;
	text-shadow: 2px 2px 4px;
}

.bd .bg_color {
	background-color: #333333;
}

.bd .bg_f_color {
	background-color: #333333;
	background: -webkit-linear-gradient(#FFF -50%, #333333 50%);
	background: linear-gradient(to bottom, #FFF -50%, #333333 50%);
}

.bd .border_color {
	border-color: #333333;
}

.bd .bx_shadow {
	box-shadow: 0 0 2px;
}

.viewer_with.on:before {
	background-color: #333333;
	box-shadow: 0 0 2px #333333;
}

.bd_zine.zine li:first-child, .bd_tb_lst.common_notice tr:first-child td
	{
	margin-top: 2px;
	border-top: 1px solid #DDD
}

.bd_zine .info b, .bd_zine .info a {
	color:;
}

.bd_zine.card h3 {
	color: #333333;
}

.bd_tb_lst {
	margin-top: 0
}

.bd_tb_lst .cate span, .bd_tb_lst .author span, .bd_tb_lst .last_post small
	{
	max-width: px
}
</style>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Raleway:100,400,600,700' rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="format-detection" content="telephone=no">
<script>
//<![CDATA[
var current_url = "${path_root}/board/write.do";
var request_uri = "${path_root}/board/write.do";
var waiting_message = "서버에 요청 중입니다. 잠시만 기다려주세요.";
var ssl_actions = new Array();
var default_url = "${path_root}/board/write.do";
xe.current_lang = "ko";
xe.cmd_find = "찾기";
xe.cmd_cancel = "취소";
xe.cmd_confirm = "확인";
xe.msg_no_root = "루트는 선택 할 수 없습니다.";
xe.msg_no_shortcut = "바로가기는 선택 할 수 없습니다.";
xe.msg_select_menu = "대상 메뉴 선택";
//]]>
</script>
</head>
<body>
	<div id="loader-overflow" >
		<div id="loader">
			<i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i>
			<span class="sr-only">Loading...</span>
		</div>
	</div>
	<div class="fixed-bar left-space">
		<div class="social-left hidden-xs hidden-sm">
			<div class="block">
				<span class="title point-color">FOLLOW US</span>
				<div class="line"></div>
				<span class="so">
					<ul class="list-unstyled">
						<li class="social-icon">
							<a href="" target="_blank" class="point-hover">
								<i class="xi-facebook fa-lg"></i>
							</a>
						</li>
						<li class="social-icon">
							<a href="" target="_blank" class="point-hover"> 
								<i class="xi-twitter fa-lg"></i>
							</a>
						</li>
						<li class="social-icon">
							<a href="" target="_blank" class="point-hover"> 
								<i class="xi-kakaotalk fa-lg"></i>
							</a>
						</li>
						<li class="social-icon">
							<a href="" target="_blank" class="point-hover"> 
								<i class="xi-youtube fa-lg"></i>
							</a>
						</li>
					</ul>
				</span>
			</div>
		</div>
	</div>
	<div class="fixed-bar right-space"></div>
	<div class="side-pannel-base"></div>
	<div class="fixed-content">
		<div class="fixed-row">
			<!-- Start :: header -->
			<c:import url="../common/header.jsp" />
			<!-- END :: header menu-->
			<!-- END :: header -->
			<div id="ss-container" class="header-space">
				<section class="sub-header parallaxer">
					<img src="${path_root}/resources/etc/board/skin/images/board_main.jpg" />
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<div class="display-table" style="height: 300px">
									<div class="table-cell">
										<div class="sub-header-caption">
											<h1 class="h1">
												<small>콘텐츠영역 + 사이즈 우측</small><br> CONTENT + <b>RIGHT SIDE</b>
											</h1>
											<div class="bread-crumb-top hidden-xs">
												<a href="/defaults/main.do" class="path-home">
													<strong>Home</strong></a>&nbsp;
												<i class="fa fa-angle-right"></i>&nbsp; 
												<a href="/board/board.do">BOARD</a>&nbsp; 
												<i class="fa fa-angle-right"></i>&nbsp; 
												<a href="#">스케치북 목록형</a>&nbsp;
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<article class="ss-contents" id="content">
					<div class="container">
						<div class="row">
							<div class="col-md-9">
								<div></div>
								<div id="bd_${tboard.idx }" class="bd hover_effect small_lst_btn1" data-default_style="list" data-bdfilestype="">
									<div class="rd rd_nav_style2 clear" style="padding:;" data-docsrl="${tboard.idx }">
										<form id="form" name="form" method="post" action="/board/write_ok.do">
											<input type="hidden" name="idx" id="idx" value="${tboard.idx}" />
											<div class="rd_hd clear" style="margin: 0 -15px 20px">
												<div class="board clear " style="">
													<div class="top_area ngeb" style="">
														<h1 class="np_18px">
															<span>제목</span> <input type="text" id="title" name="title" value="${tboard.title}" />
														</h1>
													</div>
													<div class="btm_area clear">
														<div class="side">
															<span>작성자</span> ${sessionScope.userLoginInfo.cust_name}
														</div>
													</div>
												</div>
											</div>
											<div class="rd_body clear">
												<article>
													<!--BeforeDocument(${tboard.idx },)-->
													<div class="document_${tboard.idx } xe_content">
														<p>&nbsp;</p>
														<textarea id="content" name="content" rows="10" cols="20">${tboard.content}</textarea>
													</div>
													<!--AfterDocument(${tboard.idx },)-->
												</article>
											</div>
											<div class="rd_ft">
												<div class="rd_ft_nav clear">
													<a class="btn_img fl" href="/board/board.do">
														<i class="fa fa-bars"></i>목록
													</a>
													<a class="btn_img fl" onclick="board_save();">
														<i class="fa fa-save"></i>저장
													</a>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
							<!-- 
							<div class="col-md-3 visible-md-block visible-lg-block">
								<div class="aside">
									<h4 class="h4 line-bottom line-span">
										<span>BOARD</span>
									</h4>
									<div class="mb-30">
										<h4 class="h4 line-bottom ine-span">
											<span>SIDE AREA 1</span>
										</h4>
										최근 게시물 출력공간
									</div>
									<div class="mb-30">
										<h4 class="h4 line-bottom line-span">
											<span>SIDE AREA 2</span>
										</h4>
										최근 게시물 출력공간
									</div>
								</div>
							</div> 
							-->
						</div>
					</div>
				</article>
			</div>
			<!-- START :: Footer -->
			<c:import url="../common/footer.jsp" />
			<!-- START :: Footer -->
		</div>
	</div>
	<script>
// <![CDATA[
	jQuery(function($){
		$(document).ready(function(){
			$("body").imagesLoaded(function(){
				$("#loader").fadeOut(2000),$("#loader-overflow").delay(1000).fadeOut(700)
			});
			var sidebarjs = new SidebarJS();
			$('.item-children').children('a').on('click', function(event){
				event.preventDefault();
				$(this).toggleClass('submenu-open').next('.item-sub-menu').slideToggle(200).end().parent('.item-children').siblings('.item-children').children('a').removeClass('submenu-open').next('.item-sub-menu').slideUp(200);
			});
			$('#carousel-text').owlCarousel({
			    items: 1,
			    loop:true,
			    margin:0,
			    nav:false,
			    autoplay:true,
			    autoplayTimeout:5000
			})		
			//parallax
			$(".parallaxer").parallaxer();
			$('#video-gallery').lightGallery(); 
		});
    });
	// ]]>
	</script>
	<!-- ETC -->
	<div class="wfsr"></div>
	<script src="${path_root}/resources/etc/js/captcha/captcha.min.js"></script>
	<script src="${path_root}/resources/etc/js/captcha_member/captcha.min.js"></script>
	<script src="${path_root}/resources/etc/js/autolink/autolink.js"></script>
	<script src="${path_root}/resources/common/js/plugins/ui/jquery-ui.min.js"></script>
	<script src="${path_root}/resources/common/js/plugins/ui/jquery.ui.datepicker-ko.js"></script>
	<script src="${path_root}/resources/etc/js/resize_image/resize_image.min.js"></script>
	<script src="${path_root}/resources/etc/board/skin/js/imagesloaded.pkgd.min.js"></script>
	<script src="${path_root}/resources/etc/board/skin/js/jquery.cookie.js"></script>
	<script src="${path_root}/resources/etc/editor/skin/js/xe_textarea.min.js"></script>
	<script src="${path_root}/resources/etc/board/skin/js/jquery.autogrowtextarea.min.js"></script>
	<script src="${path_root}/resources/etc/board/skin/js/board.js"></script>
	<script src="${path_root}/resources/etc/board/skin/js/jquery.masonry.min.js"></script>
	<script src="${path_root}/resources/etc/board/skin/js/font_ng.js"></script>
	<!-- 
	<script src="${path_root}/resources/files/cache/js_filter_compiled/d046d1841b9c79c545b82d3be892699d.ko.compiled.js"></script>
	<script src="${path_root}/resources/files/cache/js_filter_compiled/1bdc15d63816408b99f674eb6a6ffcea.ko.compiled.js"></script>
	<script src="${path_root}/resources/files/cache/js_filter_compiled/9b007ee9f2af763bb3d35e4fb16498e9.ko.compiled.js"></script>
	<script src="${path_root}/resources/files/cache/ruleset/04c8f005e1ac4c4d97976b9e37092c63.ko.js"></script>
	 -->
</body>
</html>

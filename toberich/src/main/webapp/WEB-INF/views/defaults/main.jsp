<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path_root"  value="${pageContext.request.contextPath}" scope="application"/>
<html lang="ko" class=" modernizr-js modernizr-flexbox modernizr-flexboxlegacy modernizr-canvas modernizr-canvastext modernizr-webgl modernizr-touch modernizr-geolocation modernizr-postmessage modernizr-websqldatabase modernizr-indexeddb modernizr-hashchange modernizr-history modernizr-draganddrop modernizr-websockets modernizr-rgba modernizr-hsla modernizr-multiplebgs modernizr-backgroundsize modernizr-borderimage modernizr-borderradius modernizr-boxshadow modernizr-textshadow modernizr-opacity modernizr-cssanimations modernizr-csscolumns modernizr-cssgradients modernizr-cssreflections modernizr-csstransforms modernizr-csstransforms3d modernizr-csstransitions modernizr-fontface modernizr-generatedcontent modernizr-video modernizr-audio modernizr-localstorage modernizr-sessionstorage modernizr-webworkers modernizr-applicationcache modernizr-svg modernizr-inlinesvg modernizr-smil modernizr-svgclippaths"><head>
<!-- META -->
<meta charset="utf-8">
<meta name="Generator" content="XpressEngine">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- TITLE -->
<title>석양이 진다</title>
<!-- CSS -->
<link rel="stylesheet" href="${path_root}/resources/common/css/xe.min.css">
<link rel="stylesheet" href="${path_root}/resources/common/js/plugins/ui/jquery-ui.min.css">
<link rel="stylesheet" href="${path_root}/resources/sunset/css/bootstrap.min.css">
<link rel="stylesheet" href="${path_root}/resources/sunset/css/animate.css">
<link rel="stylesheet" href="${path_root}/resources/sunset/css/bootsnav.css">
<link rel="stylesheet" href="${path_root}/resources/sunset/css/bootsnav.overwrite.css">
<link rel="stylesheet" href="${path_root}/resources/sunset/css/bootsnav.color.css">
<link rel="stylesheet" href="${path_root}/resources/sunset/css/sidebarjs.css">
<link rel="stylesheet" href="${path_root}/resources/sunset/css/owl.carousel.min.css">
<link rel="stylesheet" href="${path_root}/resources/sunset/css/owl.theme.default.css">
<link rel="stylesheet" href="${path_root}/resources/sunset/css/lightgallery.min.css">
<link rel="stylesheet" href="${path_root}/resources/common/css/xeicon.min.css">
<link rel="stylesheet" href="${path_root}/resources/sunset/css/font-awesome.min.css">
<link rel="stylesheet" href="${path_root}/resources/sunset/css/board.css">
<link rel="stylesheet" href="${path_root}/resources/sunset/css/ss-design.min.css">
<link rel="stylesheet" href="${path_root}/resources/sunset/css/ss-layout.css">
<link rel="stylesheet" href="${path_root}/resources/sunset/css/ss-custom.css">
<link rel="stylesheet" href="${path_root}/resources/etc/editor/style/css/style.css">
<link rel="stylesheet" href="${path_root}/resources/etc/widgets/ss_skin/css/widget.css">
<link rel="stylesheet" href="${path_root}/resources/etc/widgets/ss_carousel/css/widget.css">
<link rel="stylesheet" href="${path_root}/resources/etc/widgets/ss_carousel/css/owl.carousel.min.css">
<link rel="stylesheet" href="${path_root}/resources/etc/widgets/ss_carousel/css/owl.theme.default.css">
<!-- JS -->
<script src="${path_root}/resources/common/js/jquery.min.js"></script>
<script src="${path_root}/resources/common/js/x.min.js"></script>
<script src="${path_root}/resources/common/js/xe.min.js"></script>
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

<style>
.xe_content {
	font-size: 13px;
}
</style>
<link rel="canonical" href="${path_root}/defaults/main.do">
<meta property="og:locale" content="ko_KR">
<meta property="og:type" content="website">
<meta property="og:url" content="${path_root}/defaults/main.do">
<meta property="og:title" content="석양이 진다">
<style type="text/css">
.point-color, .point-hover:hover, a.point-hover:hover {
	color: #a08d7c !important;
}

.point-bgcolor {
	background-color: #a08d7c;
}

.point-bghover:hover {
	color: #fff;
	background-color: #a08d7c;
}

.active>a, .aside .side-nav .list-group-item.on {
	color: #a08d7c !important;
}

#loader>span {
	border-top-color: #a08d7c !important;
}

.btn-line:hover {
	border-color: #a08d7c !important;
}
/* YTPlayer loading img */
.ss-player {
	background-image: url(${path_root}/resources/common/images/loading.gif);
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
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Raleway:100,400,600,700" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="format-detection" content="telephone=no">
<script>
//<![CDATA[
var current_url = "${path_root}/defaults/main.do";
var request_uri = "${path_root}/defaults/main.do";
var waiting_message = "서버에 요청 중입니다. 잠시만 기다려주세요.";
var ssl_actions = new Array();
var default_url = "${path_root}/defaults/main.do";
xe.current_lang = "ko";
xe.cmd_find = "찾기";
xe.cmd_cancel = "취소";
xe.cmd_confirm = "확인";
xe.msg_no_root = "루트는 선택 할 수 없습니다.";
xe.msg_no_shortcut = "바로가기는 선택 할 수 없습니다.";
xe.msg_select_menu = "대상 메뉴 선택";
//]]>
</script>
<style id="holderjs-style" type="text/css"></style>
</head>
<body>
	<div class="ss-wrapper">
		<div id="loader-overflow" style="display: none;">
			<div id="loader" style="display: none;"><span></span></div>
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
					<section class="ss-promotion">
						<div id="slider_owl" class="slider-owl owl-theme">
							<div class="item-slide">
								<a href="#"><img src="${path_root}/resources/sunset/images/mainbanner1.jpg"  /></a>
								<div class="item-caption text-center">
									<div class="container">
										<h1 class="owl-h1">출시! <b>섬머렐라</b> 템플릿</h1>
										<div class="owl-p">UNIQUE COPORATE & AGENCY XPRESSENGINE THEME</div>
										<a href="#" class="btn-ss btn-large btn-line point-bghover mt-30 hidden-xs">READ MORE</a>
									</div>
								</div>
							</div>
							<div class="item-slide">
								<a href="http://ssdesign.com/"><img src="${path_root}/resources/sunset/images/mainbanner2.jpg" /></a>
								<div class="item-caption text-center">
									<div class="container">
										<h1 class="owl-h1">TEMPLATES <b>SUMMERELLA</b></h1>
										<div class="owl-p">A POWERFUL MULTI PURPOSE XPRESSENGINE LAYOUT</div>
										<a href="http://ssdesign.com/" class="btn-ss btn-large btn-line point-bghover mt-30 hidden-xs">BUY NOW</a>			
									</div>
								</div>
							</div>
							<div class="item-slide">
								<img src="${path_root}/resources/sunset/images/mainbanner3.jpg" />				
								<div class="item-caption text-center">
									<div class="container">
										<h1 class="owl-h1">크리에이티브 디자인 <b>케이에스오</b></h1>
										<div class="owl-p">CREATIVE DESIGN STUDIO KSODESIGN</div>
										<a href="" class="btn-ss btn-large btn-line point-bghover mt-30 hidden-xs">READ MORE</a>			
									</div>
								</div>
							</div>		
						</div>
						<script type="text/javascript">
						// <![CDATA[
							jQuery(function($){
								$(document).ready(function(){
									$('#slider_owl').owlCarousel({
										items: 1,
										loop: true,
										margin: 0,
										nav: true,
										smartSpeed:800,
										navText:["<i class='xi-angle-left fa-lg' style='margin-top: 45px;'></i>","<i class='xi-angle-right fa-lg' style='margin-top: 45px;'></i>"],
										dots: false,
										autoplay: true,
									    autoplayTimeout: 7000,
									    autoplayHoverPause: false 			    
									})
								});
							});
						// ]]>
						</script>
					</section>
					<div class="clearfix"></div>
					<section id="ss-section1" class="ss-section-teaser bg-gray">
						<div class="container">
							<div class="row visible-md visible-lg">
								<div class="col-sm-4">
									<div class="">
										<h5 class="h5 line-bottom line-span">
											<a href="" class="point-hover"><span>RESPONSIVE <b>DESIGN</b></span></a>
										</h5>
										다양한 디바이스에서 정확한 사이즈로 최적화하여 쾌적하게 사이트를 이용할 수 있도록 반응형으로 웹사이트를
										구축합니다.
									</div>
								</div>
								<div class="col-sm-4">
									<div class="">
										<h5 class="h5 line-bottom line-span">
											<a href="" class="point-hover"><span>GLOBAL <b>WEBTRAND</b></span></a>
										</h5>
										기존 국내 스타일을 배제하고 글로벌 웹트랜드에 맞춰 새롭고 모던한 디자인으로 웹사이트를 구축합니다.
									</div>
								</div>
								<div class="col-sm-4">
									<div class="">
										<h5 class="h5 line-bottom line-span">
											<a href="" class="point-hover"><span>VERY <b>FLEXBLE</b></span></a>
										</h5>
										CMS의 장점인 관리 시스템으로 클라이언트가 직접 쉽고 편리하게 관리할 수 있도록 다양한 설정으로 맞춰드립니다.
									</div>
								</div>
								<div class="hidden">
									<div class="">
										<h5 class="h5 line-bottom line-span">
											<a href="" class="point-hover"><span></span></a>
										</h5>
									</div>
								</div>
							</div>
							<div class="row visible-xs visible-sm">
								<div class="col-sm-12">
									<div id="carousel-text" class="slider-owl owl-theme owl-loaded owl-drag">
										<div class="owl-stage-outer">
											<div class="owl-stage" style="transform: translate3d(0px, 0px, 0px); transition: 0s;">
												<div class="owl-item">
													<div class="item">
														<h5 class="h5 line-bottom line-span">
															<span>RESPONSIVE <b>DESIGN</b></span>
														</h5>
														다양한 디바이스에서 정확한 사이즈로 최적화하여 쾌적하게 사이트를 이용할 수 있도록 반응형으로 웹사이트를
														구축합니다.
													</div>
												</div>
												<div class="owl-item">
													<div class="item">
														<h5 class="h5 line-bottom line-span">
															<span>GLOBAL <b>WEBTRAND</b></span>
														</h5>
														기존 국내 스타일을 배제하고 글로벌 웹트랜드에 맞춰 새롭고 모던한 디자인으로 웹사이트를 구축합니다.
													</div>
												</div>
												<div class="owl-item">
													<div class="item">
														<h5 class="h5 line-bottom line-span">
															<span>VERY <b>FLEXBLE</b></span>
														</h5>
														CMS의 장점인 관리 시스템으로 클라이언트가 직접 쉽고 편리하게 관리할 수 있도록 다양한 설정으로
														맞춰드립니다.
													</div>
												</div>
											</div>
										</div>
										<div class="owl-nav disabled">
											<div class="owl-prev">PREV</div>
											<div class="owl-next">NEXT</div>
										</div>
										<div class="owl-dots">
											<div class="owl-dot">
												<span></span>
											</div>
											<div class="owl-dot">
												<span></span>
											</div>
											<div class="owl-dot active">
												<span></span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
					<section id="ss-section2" class="ss-section-about ">
						<div class="container">
							<div class="row">
								<div class="col-sm12">
									<h1 class="section-header">
										ABOUT <b>US</b>
									</h1>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-5 mb-sm-30">
									<div class="line-box">
										<img src="${path_root}/resources/sunset/images/aboutUsImage.jpg" class="img-responsive center-block" alt="">
									</div>
								</div>
								<div class="col-sm-6 col-sm-offset-1">
									<div>
										<h3 class="h2 line-head-left">
											크리에이티브 디자인 컴퍼니<br>
											<small>케이에스오 디자인</small>
										</h3>
										<p class="mb-40">단순히 고통이라는 이유 때문에 고통 그 자체를 사랑하거나 추구하거나
											소유하려는 자는 없다. 다만 노역과 고통이 아주 큰 즐거움을 선사하는 상황이 때로는 발생하기 때문에 고통을
											찾는 사람이 있는 것이다.</p>
										<div class="row">
											<div class="col-sm-6 mb-20">
												<h5>
													<i class="xi-badge fa-lg"></i>&nbsp; CREATIVE DESIGN
												</h5>
												<p>노역과 고통이 아주 큰 즐거움을 선사하는 상황이 때로는 발생하기 때문에 고통을 찾는 사람이 있는 것이다.</p>
											</div>
											<div class="col-sm-6 mb-20">
												<h5>
													<i class="xi-download fa-lg"></i>&nbsp; PARALLAX EFFECTS
												</h5>
												<p>노역과 고통이 아주 큰 즐거움을 선사하는 상황이 때로는 발생하기 때문에 고통을 찾는 사람이 있는 것이다.</p>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-6 mb-20">
												<h5>
													<i class="xi-comments fa-lg"></i>&nbsp; MODERN DESIGN
												</h5>
												<p>노역과 고통이 아주 큰 즐거움을 선사하는 상황이 때로는 발생하기 때문에 고통을 찾는 사람이 있는 것이다.</p>
											</div>
											<div class="col-sm-6 mb-20">
												<h5>
													<i class="xi-trophy fa-lg"></i>&nbsp; VERY FLEXBLE
												</h5>
												<p>노역과 고통이 아주 큰 즐거움을 선사하는 상황이 때로는 발생하기 때문에 고통을 찾는 사람이 있는 것이다.</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
					<section id="ss-section3" class="ss-section-block ">
						<div class="container-fluid">
							<div class="row">
								<div class="col-sm-6 col-md-3 padding-none">
									<div class="grid-box">
										<a href="#">
											<figure>
												<img src="${path_root}/resources/sunset/images/sizeUpImage1.jpg"
													class="img-responsive center-block" alt="">
												<figcaption>
													<h3>매력적인 디자인</h3>
													<p>KSODESIGN TEMPLATES</p>
													<h2>DESIGN</h2>
												</figcaption>
												<div class="btn-zoom">
													<i class="xi-magnifier fa-2x"></i>
												</div>
											</figure>
										</a>
									</div>
								</div>
								<div class="col-sm-6 col-md-3 padding-none">
									<div class="grid-box">
										<a href="">
											<figure>
												<img src="${path_root}/resources/sunset/images/sizeUpImage2.jpg"
													class="img-responsive center-block" alt="">
												<figcaption>
													<h3>마법 같은 확장성</h3>
													<p>KSODESIGN TEMPLATES</p>
													<h2>EXPANDABILITY</h2>
												</figcaption>
												<div class="btn-zoom">
													<i class="xi-magnifier fa-2x"></i>
												</div>
											</figure>
										</a>
									</div>
								</div>
								<div class="col-sm-6 col-md-3 padding-none">
									<div class="grid-box">
										<a href="">
											<figure>
												<img src="${path_root}/resources/sunset/images/sizeUpImage3.jpg"
													class="img-responsive center-block" alt="">
												<figcaption>
													<h3>새로운 연동 상품</h3>
													<p>KSODESIGN TEMPLATES</p>
													<h2>INTERLOCK</h2>
												</figcaption>
												<div class="btn-zoom">
													<i class="xi-magnifier fa-2x"></i>
												</div>
											</figure>
										</a>
									</div>
								</div>
								<div class="col-sm-6 col-md-3 padding-none">
									<div class="grid-box">
										<a href="">
											<figure>
												<img src="${path_root}/resources/sunset/images/sizeUpImage4.jpg"
													class="img-responsive center-block" alt="">
												<figcaption>
													<h3>반응형의 아름다움</h3>
													<p>KSODESIGN TEMPLATES</p>
													<h2>RESPONSIVE</h2>
												</figcaption>
												<div class="btn-zoom">
													<i class="xi-magnifier fa-2x"></i>
												</div>
											</figure>
										</a>
									</div>
								</div>
							</div>
						</div>
					</section>
					<section id="ss-section4" class="ss-section-service ">
						<div class="container">
							<div class="row">
								<div class="col-sm12">
									<h1 class="section-header">
										OUR <b>SERVICES</b>
									</h1>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-5 col-sm-push-6 col-sm-offset-1 mb-sm-30">
									<div class="line-box">
										<img src="${path_root}/resources/sunset/images/outServicesImage.jpg"
											class="img-responsive center-block" alt="">
									</div>
								</div>
								<div class="col-sm-6 col-sm-pull-6">
									<div>
										<h3 class="h2 line-head-left">
											크리에이티브 디자인 컴퍼니<br>
											<small>케이에스오 디자인</small>
										</h3>
										<p class="mb-40">단순히 고통이라는 이유 때문에 고통 그 자체를 사랑하거나 추구하거나
											소유하려는 자는 없다. 다만 노역과 고통이 아주 큰 즐거움을 선사하는 상황이 때로는 발생하기 때문에 고통을
											찾는 사람이 있는 것이다.</p>
										<div class="row">
											<div class="col-sm-6 mb-20">
												<h5>
													<i class="xi-badge fa-lg"></i>&nbsp; CREATIVE DESIGN
												</h5>
												<p>노역과 고통이 아주 큰 즐거움을 선사하는 상황이 때로는 발생하기 때문에 고통을 찾는 사람이 있는  것이다.</p>
											</div>
											<div class="col-sm-6 mb-20">
												<h5>
													<i class="xi-download fa-lg"></i>&nbsp; PARALLAX EFFECTS
												</h5>
												<p>노역과 고통이 아주 큰 즐거움을 선사하는 상황이 때로는 발생하기 때문에 고통을 찾는 사람이 있는 것이다.</p>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-6 mb-20">
												<h5>
													<i class="xi-comments fa-lg"></i>&nbsp; MODERN DESIGN
												</h5>
												<p>노역과 고통이 아주 큰 즐거움을 선사하는 상황이 때로는 발생하기 때문에 고통을 찾는 사람이 있는 것이다.</p>
											</div>
											<div class="col-sm-6 mb-20">
												<h5>
													<i class="xi-trophy fa-lg"></i>&nbsp; VERY FLEXBLE
												</h5>
												<p>노역과 고통이 아주 큰 즐거움을 선사하는 상황이 때로는 발생하기 때문에 고통을 찾는 사람이 있는 것이다.</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
					<section id="ss-parallax" class="ss-parallaxer parallaxer">
						<img src="${path_root}/resources/sunset/images/playimage.jpg" alt=""
							style="opacity: 1; transform: translate3d(-50%, 10px, 0px);">
						<div class="bg-transparent"></div>
						<div class="container">
							<div class="row">
								<div class="col-sm12">
									<h1 class="section-header">
										SECTION <b>PARALLAX</b>
									</h1>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<div class="text-center">
										<div id="video-gallery" class="text-center mb-30">
											<a href="https://youtu.be/y_HiZyHNPHw"><i class="fa fa-play-circle-o fa-4x point-hover"></i></a>
										</div>
										<div>
											창공에 용감하고 스며들어 있으며, 만천하의 것이다. 같지 긴지라 듣기만 같이, 꽃 예수는 수 이상 말이다.<br>
											천하를 영락과 일월과 너의 뛰노는 뜨거운지라, 있는가? 충분히 생의 천고에 인간이 목숨을 낙원을 교향악이다.<br>
											긴지라 생명을 오아이스도 있는 하는 풍부하게 못하다 사막이다.
										</div>
										<a href="#" class="btn-ss btn-large btn-line mt-30 point-bghover">READ MORE</a>
									</div>
								</div>
							</div>
						</div>
					</section>
					<section id="ss-info" class="ss-section-info bg-gray ">
						<div class="container">
							<div class="row">
								<div class="col-sm12">
									<h1 class="section-header">
										OUR <b>INFORMATION</b>
									</h1>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-4">
									<div class="ico-item">
										<i class="xi-cloud-upload fa-3x point-color"></i>
										<h4>CLOUD UPLOAD</h4>
										<p>이상의 이상의 새가 그들은 남는 풀이 얼마나 부패뿐이다. 이상을 얼마나 되려니와, 구하지 길을
											거선의 같은 작고 뿐이다. 얼음에 그들의 용감하고 수 물방아 풍부하게 끓는다.</p>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="ico-item">
										<i class="xi-share-alt fa-3x point-color"></i>
										<h4>SHARE ALT</h4>
										<p>이상의 이상의 새가 그들은 남는 풀이 얼마나 부패뿐이다. 이상을 얼마나 되려니와, 구하지 길을
											거선의 같은 작고 뿐이다. 얼음에 그들의 용감하고 수 물방아 풍부하게 끓는다.</p>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="ico-item">
										<i class="xi-signal fa-3x point-color"></i>
										<h4>SIGNAL</h4>
										<p>이상의 이상의 새가 그들은 남는 풀이 얼마나 부패뿐이다. 이상을 얼마나 되려니와, 구하지 길을
											거선의 같은 작고 뿐이다. 얼음에 그들의 용감하고 수 물방아 풍부하게 끓는다.</p>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-4">
									<div class="ico-item">
										<i class="xi-eyedropper fa-3x point-color"></i>
										<h4>EYEDROPPER</h4>
										<p>이상의 이상의 새가 그들은 남는 풀이 얼마나 부패뿐이다. 이상을 얼마나 되려니와, 구하지 길을
											거선의 같은 작고 뿐이다. 얼음에 그들의 용감하고 수 물방아 풍부하게 끓는다.</p>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="ico-item">
										<i class="xi-user-check fa-3x point-color"></i>
										<h4>USER CHECK</h4>
										<p>이상의 이상의 새가 그들은 남는 풀이 얼마나 부패뿐이다. 이상을 얼마나 되려니와, 구하지 길을
											거선의 같은 작고 뿐이다. 얼음에 그들의 용감하고 수 물방아 풍부하게 끓는다.</p>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="ico-item">
										<i class="xi-cine-camera fa-3x point-color"></i>
										<h4>CINE CAMERA</h4>
										<p>이상의 이상의 새가 그들은 남는 풀이 얼마나 부패뿐이다. 이상을 얼마나 되려니와, 구하지 길을
											거선의 같은 작고 뿐이다. 얼음에 그들의 용감하고 수 물방아 풍부하게 끓는다.</p>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
				<!-- START :: Footer -->
				<c:import url="../common/footer.jsp" />
				<!-- START :: Footer -->
			</div>
		</div>
		<script type="text/javascript">
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
		<!-- <script src="${path_root}/resources/files/cache/ruleset/04c8f005e1ac4c4d97976b9e37092c63.ko.js"></script> -->
		<script src="${path_root}/resources/etc/widgets/ss_carousel/js/owl.carousel.min.js"></script>
	</div>
	<div id="captcha_layer" style="position:fixed; top:0; left:0; width:100%; height:100%;display:none;z-index:10">
		<div style="z-index:1000;position:absolute; width:310px;margin:-105px 0 0 -105px; top:50%; left:50%; background:#fff; border:3px solid #ccc;">
			<form method="post" action="">
				<div style="position:relative; margin:25px 20px 15px 20px">
					<img src="about:blank" id="captcha_image" alt="CAPTCHA" width="240" height="50" style="display:block; width:240px; height:50px; border:1px solid #b0b0b0">
					<button type="button" class="reload" title="" style="position:absolute; top:0; left:245px; width:25px; height:25px; padding:0; overflow:visible; border:1px solid #575757; background:#747474 url(${path_root}/resources/etc/images/icon.gif) no-repeat center 5px;border-radius:3px;-moz-border-radius:3px;-webkit-border-radius:3px; cursor:pointer;box-shadow:0 0 3px #444 inset;-moz-box-shadow:0 0 3px #444 inset;-webkit-box-shadow:0 0 3px #444 inset;"></button>
					<button type="button" class="play" title="" style="position:absolute; top:27px; left:245px; width:25px; height:25px; padding:0; overflow:visible; border:1px solid #575757; background:#747474 url(${path_root}/resources/etc/images/icon.gif) no-repeat center -20px;border-radius:3px;-moz-border-radius:3px;-webkit-border-radius:3px; cursor:pointer;box-shadow:0 0 3px #444 inset;-moz-box-shadow:0 0 3px #444 inset;-webkit-box-shadow:0 0 3px #444 inset;"></button>
				</div>
				<label id="captchaAbout" for="captcha" style="display:block; border-top:1px dashed #c5c5c5; padding:15px 0; margin:0 20px; font-size:12px; color:#5f5f5f;"></label>
				<input name="" type="text" id="secret_text" style="ime-mode:inactive;margin:0 20px; width:232px; border:1px solid #bdbdbd; padding:3px 4px; font-size:18px; font-weight:bold;">
				<div style="margin:20px; border-top:1px dashed #c5c5c5; padding:15px 0 0 0; text-align:center">
					<button type="submit" style="height:31px; line-height:31px; padding:0 15px; margin:0 2px; font-size:12px; font-weight:bold; color:#fff; overflow:visible; border:1px solid #5c8a16; background:#6faa13;border-radius:3px;-moz-border-radius:3px;-webkit-border-radius:3px; cursor:pointer;box-shadow:0 0 3px #666 inset;-moz-box-shadow:0 0 3px #666 inset;-webkit-box-shadow:0 0 3px #666 inset;"></button>
					<button type="button" class="cancel" style="height:31px; line-height:31px; padding:0 15px; margin:0 2px; font-size:12px; font-weight:bold; color:#fff; overflow:visible; border:1px solid #575757; background:#747474;border-radius:3px;-moz-border-radius:3px;-webkit-border-radius:3px; cursor:pointer;box-shadow:0 0 3px #444 inset;-moz-box-shadow:0 0 3px #444 inset;-webkit-box-shadow:0 0 3px #444 inset;"></button>
				</div>
			</form>
			<embed src="${path_root}/resources/etc/images/T50.mp4" quality="high" wmode="window" allowfullscreen="false" bgcolor="#ffffff" width="0" height="0" name="captcha_audio" align="middle" allowscriptaccess="always" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"/>
		</div>
	</div>
	<div id="popup_menu_area" tabindex="0" style="display:none;z-index:9999"></div>
	</body>
</html>
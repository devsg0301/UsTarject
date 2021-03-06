<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<c:set var="path_root" value="${pageContext.request.contextPath}" scope="application" />

<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="../common/includecommon.jsp" />
<link rel="stylesheet" href="${path_root}/resources/bootstrap/css/swiper.min.css">
<link rel="stylesheet" href="${path_root}/resources/bootstrap/css/main.css?20181008001">

<style>
</style>
</head>

<body>
	<!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <c:import url="../common/header.jsp" />
        <!-- /.container -->
    </nav>
	<!-- Swiper -->
    <header id="myCarousel" class="carousel slide">
		<!-- Swiper -->
		<div class="swiper-container swiper0">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<a href="javascript:folderSearch('TV','예능','강식당2','KO');" >
						<img src="${path_root}/resources/bootstrap/images/main_banner_kang_kitchen2.jpg">
					</a>
				</div>
				<div class="swiper-slide">
					<a href="javascript:folderSearch('TV','드라마','닥터 프리즈너','KO');" >
						<img src="${path_root}/resources/bootstrap/images/main_banner_doctor_prisoner.jpg">
					</a>
				</div>
				<div class="swiper-slide">
					<a href="javascript:folderSearch('TV','드라마','로맨스는 별책부록','KO');" >
						<img src="${path_root}/resources/bootstrap/images/main_banner_romance.jpg">
					</a>
				</div>
				<div class="swiper-slide">
					<a href="javascript:folderSearch('TV','예능','신서유기6','KO');" >
						<img src="${path_root}/resources/bootstrap/images/main_banner_sinseoyugi6.jpg">
					</a>
				</div>
			</div>
			<!-- Add Pagination -->
			<div class="swiper-pagination swiper-pagination-white"></div>
			<!-- Navigation -->
			<div class="swiper-button-next next0"></div>
			<div class="swiper-button-prev prev0"></div>
		</div>
	</header>
	<div class="container" style="background-color: #e6e6e7; box-shadow: 0px 0px 10px 0px #6f6f6f;">	
		<h2 class="program-lists-title">최근 등록 VOD<a href="javascript:goUrlHeader('/sgCloud/sgCloud_main.do');" class="program-lists-more">더보기 <i class="fas fa-plus-circle fa-fw"></i></a></h2>
		<div class="prd_slide_t01_wrap">
			<div class="swiper-container swiper1 swiper-container-vod">
				<div class="swiper-wrapper">
					<c:forEach var="broadcastList" items="${broadcastList}" end="14">
						<div class="swiper-slide swiper-slide-vod">
							<%-- <a class="dBanner" href="javascript:folderSearch('${broadcastList.category}','${broadcastList.genre}','${broadcastList.foldername}');" > --%>
							<a class="dBanner" href="/sgCloud/${broadcastList.idx}.do" >
								<img class="vodImg" src="http://211.200.138.35:8081/LocalUser/data/${broadcastList.category}/${broadcastList.genre}/${broadcastList.foldername}/${broadcastList.title}_thum.jpg" alt="${broadcastList.title}"/>
								<span class="vod-info-box" aria-hidden="true">
									<span class="vod-title">${broadcastList.title}</span>
									<fmt:parseDate var="dateString" value="${broadcastList.play_date}" pattern="yyyy-MM-dd" />
									<span class="vod-info"><fmt:formatDate value="${dateString}" pattern="yyyy년 MM월 dd일(E)"/></span>
								</span>
								<span class="play-icons" aria-hidden="true">
									<img src="${path_root}/resources/bootstrap/images/ico-play.png" alt="">
								</span>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- If we need navigation buttons -->
		    <div class="swiper-button-prev prev1"></div>
		    <div class="swiper-button-next next1"></div>
		</div>
		
		<h2 class="program-lists-title">최근 등록 영상<a href="javascript:goUrlHeader('/sgCloud/sgCloud_main.do');" class="program-lists-more">더보기 <i class="fas fa-plus-circle fa-fw"></i></a></h2>
		<div class="prd_slide_t01_wrap">
			<div class="swiper-container swiper6">
				<div class="swiper-wrapper">
					<c:forEach var="recentFolderList" items="${recentFolderList}" end="14">
						<div class="swiper-slide">
							<a class="dBanner" href="javascript:folderSearch('${recentFolderList.category}','${recentFolderList.genre}','${recentFolderList.foldername}','${recentFolderList.country}');" >
								<img class="broadcastImg" src="http://211.200.138.35:8081/LocalUser/data/${recentFolderList.category}/${recentFolderList.genre}/${recentFolderList.foldername}/${recentFolderList.foldername}.jpg" alt="${recentFolderList.foldername}"/>
								<span class="broadcast-info-box" aria-hidden="true">
									<span class="broadcast-title">${recentFolderList.foldername}</span>
								</span>
								<span class="icons" aria-hidden="true">
									<span class="ico-grade ico-grade-${recentFolderList.grade}"></span>
								</span>
								<c:if test="${recentFolderList.hit >= 20 }">
								<span class="hot-icons" aria-hidden="true">
									<img src="${path_root}/resources/bootstrap/images/ico-hot.png" alt="">
								</span>
								</c:if>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- If we need navigation buttons -->
		    <div class="swiper-button-prev prev6"></div>
		    <div class="swiper-button-next next6"></div>
		</div>
		
		<h2 class="program-lists-title">추천 TV프로그램<a href="javascript:fileSearch('TV','','');" class="program-lists-more">더보기 <i class="fas fa-plus-circle fa-fw"></i></a></h2>	
		<div class="prd_slide_t01_wrap">
			<div class="swiper-container swiper2">
				<div class="swiper-wrapper">
					<c:forEach var="tvFolderList" items="${tvFolderList}" end="19">
						<div class="swiper-slide">
							<a class="dBanner" href="javascript:folderSearch('${tvFolderList.category}','${tvFolderList.genre}','${tvFolderList.foldername}','${tvFolderList.country}');" >
								<img class="broadcastImg" src="http://211.200.138.35:8081/LocalUser/data/${tvFolderList.category}/${tvFolderList.genre}/${tvFolderList.foldername}/${tvFolderList.foldername}.jpg" alt="${tvFolderList.foldername}"/>
								<span class="broadcast-info-box" aria-hidden="true">
									<span class="broadcast-title">${tvFolderList.foldername}</span>
								</span>
								<span class="icons" aria-hidden="true">
									<span class="ico-grade ico-grade-${tvFolderList.grade}"></span>
								</span>
								<c:if test="${tvFolderList.hit >= 20 }">
								<span class="hot-icons" aria-hidden="true">
									<img src="${path_root}/resources/bootstrap/images/ico-hot.png" alt="">
								</span>
								</c:if>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- If we need navigation buttons -->
		    <div class="swiper-button-prev prev2"></div>
		    <div class="swiper-button-next next2"></div>
		</div>

		<h2 class="program-lists-title">추천 영화<a href="javascript:fileSearch('MOVIE','','');" class="program-lists-more">더보기 <i class="fas fa-plus-circle fa-fw"></i></a></h2>	
		<div class="prd_slide_t01_wrap">
			<div class="swiper-container swiper3">
				<div class="swiper-wrapper">
					<c:forEach var="movieFolderList" items="${movieFolderList}" end="14">
						<div class="swiper-slide">
							<a class="dBanner" href="javascript:folderSearch('${movieFolderList.category}','${movieFolderList.genre}','${movieFolderList.foldername}','${movieFolderList.country}');" >
								<img class="broadcastImg" src="http://211.200.138.35:8081/LocalUser/data/${movieFolderList.category}/${movieFolderList.genre}/${movieFolderList.foldername}/${movieFolderList.foldername}.jpg" alt="${movieFolderList.foldername}"/>
								<span class="broadcast-info-box" aria-hidden="true"><span class="broadcast-title">${movieFolderList.foldername}</span></span>
								<span class="icons" aria-hidden="true">
									<span class="ico-grade ico-grade-${movieFolderList.grade}"></span>
								</span>
								<c:if test="${movieFolderList.hit >= 6 }">
								<span class="hot-icons" aria-hidden="true">
									<img src="${path_root}/resources/bootstrap/images/ico-hot.png" alt="">
								</span>
								</c:if>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- If we need navigation buttons -->
		    <div class="swiper-button-prev prev3"></div>
		    <div class="swiper-button-next next3"></div>
		</div>

		<h2 class="program-lists-title">추천 드라마<a href="javascript:fileSearch('TV','드라마','');" class="program-lists-more">더보기 <i class="fas fa-plus-circle fa-fw"></i></a></h2>	
		<div class="prd_slide_t01_wrap">
			<div class="swiper-container swiper4">
				<div class="swiper-wrapper">
					<c:forEach var="dreamFolderList" items="${dreamFolderList}" end="14">
						<div class="swiper-slide">
							<a class="dBanner" href="javascript:folderSearch('${dreamFolderList.category}','${dreamFolderList.genre}','${dreamFolderList.foldername}','${dreamFolderList.country}');" >
								<img class="broadcastImg" src="http://211.200.138.35:8081/LocalUser/data/${dreamFolderList.category}/${dreamFolderList.genre}/${dreamFolderList.foldername}/${dreamFolderList.foldername}.jpg" alt="${dreamFolderList.foldername}"/>
								<span class="broadcast-info-box" aria-hidden="true"><span class="broadcast-title">${dreamFolderList.foldername}</span></span>
								<span class="icons" aria-hidden="true">
									<span class="ico-grade ico-grade-${dreamFolderList.grade}"></span>
								</span>
								<c:if test="${dreamFolderList.hit >= 20 }">
								<span class="hot-icons" aria-hidden="true">
									<img src="${path_root}/resources/bootstrap/images/ico-hot.png" alt="">
								</span>
								</c:if>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- If we need navigation buttons -->
		    <div class="swiper-button-prev prev4"></div>
		    <div class="swiper-button-next next4"></div>
		</div>
		
		<h2 class="program-lists-title">추천 예능<a href="javascript:fileSearch('TV','예능','');" class="program-lists-more">더보기 <i class="fas fa-plus-circle fa-fw"></i></a></h2>	
		<div class="prd_slide_t01_wrap">
			<div class="swiper-container swiper5">
				<div class="swiper-wrapper">
					<c:forEach var="entertainmentFolderList" items="${entertainmentFolderList}" end="9">
						<div class="swiper-slide">
							<a class="dBanner" href="javascript:folderSearch('${entertainmentFolderList.category}','${entertainmentFolderList.genre}','${entertainmentFolderList.foldername}','${entertainmentFolderList.country}');" >
								<img class="broadcastImg" src="http://211.200.138.35:8081/LocalUser/data/${entertainmentFolderList.category}/${entertainmentFolderList.genre}/${entertainmentFolderList.foldername}/${entertainmentFolderList.foldername}.jpg" alt="${entertainmentFolderList.foldername}"/>
								<span class="broadcast-info-box" aria-hidden="true"><span class="broadcast-title">${entertainmentFolderList.foldername}</span></span>
								<span class="icons" aria-hidden="true">
									<span class="ico-grade ico-grade-${entertainmentFolderList.grade}"></span>
								</span>
								<c:if test="${entertainmentFolderList.hit >= 20 }">
								<span class="hot-icons" aria-hidden="true">
									<img src="${path_root}/resources/bootstrap/images/ico-hot.png" alt="">
								</span>
								</c:if>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- If we need navigation buttons -->
		    <div class="swiper-button-prev prev5"></div>
		    <div class="swiper-button-next next5"></div>
		</div>
		<!-- Footer -->
        <footer>
            <c:import url="../common/footer.jsp" />
        </footer>
	</div>
	
	<script src="${path_root}/resources/bootstrap/js/swiper.min.js"></script>
	<script>
		var tmpUser = navigator.userAgent;
		var swiper0 = new Swiper('.swiper0', {		
			loop: true,
			centeredSlides: true,
	      	autoplay: {
	        	delay: 3500,
	        	disableOnInteraction: false,
	      	},
			pagination: {
		        el: '.swiper-pagination',
		        clickable: true,
		    },
			navigation: {
			    nextEl: '.next0',
			    prevEl: '.prev0',
			}	
		});
		
		var swiper1 = new Swiper('.swiper1', {
			slidesPerView : 5,
			spaceBetween : 0,
			slidesPerGroup: 5,
			loop: true,
	      	 autoplay: {
	        	delay: 5500,
	        	disableOnInteraction: false,
	      	},
			navigation: {
			    nextEl: '.next1',
			    prevEl: '.prev1',
			},
			breakpoints : {
				// when window width is <= 320px
				350 : {
					slidesPerView : 1,
					spaceBetween : 0,
					slidesPerGroup: 1,
				},
				// when window width is <= 480px
				768 : {
					slidesPerView : 2,
					spaceBetween : 0,
					slidesPerGroup: 2,
				},
				// when window width is <= 640px
				992 : {
					slidesPerView : 3,
					spaceBetween : 0,
					slidesPerGroup: 3,
				},
				1200 : {
					slidesPerView : 4,
					spaceBetween : 0,
					slidesPerGroup: 4,
				}
			}		
		});
		
		var swiper2 = new Swiper('.swiper2', {
			slidesPerView : 5,
			spaceBetween : 0,
			slidesPerGroup: 5,
			loop: true,
			navigation: {
			    nextEl: '.next2',
			    prevEl: '.prev2',
			},
			breakpoints : {
				// when window width is <= 320px
				350 : {
					slidesPerView : 1,
					spaceBetween : 0,
					slidesPerGroup: 1,
				},
				// when window width is <= 480px
				768 : {
					slidesPerView : 2,
					spaceBetween : 0,
					slidesPerGroup: 2,
				},
				// when window width is <= 640px
				992 : {
					slidesPerView : 3,
					spaceBetween : 0,
					slidesPerGroup: 3,
				},
				1200 : {
					slidesPerView : 4,
					spaceBetween : 0,
					slidesPerGroup: 4,
				}
			}		
		});
		
		var swiper3 = new Swiper('.swiper3', {
			slidesPerView : 5,
			spaceBetween : 0,
			slidesPerGroup: 5,
			loop: true,
			navigation: {
			    nextEl: '.next3',
			    prevEl: '.prev3',
			},
			breakpoints : {
				// when window width is <= 320px
				350 : {
					slidesPerView : 1,
					spaceBetween : 0,
					slidesPerGroup: 1,
				},
				// when window width is <= 480px
				768 : {
					slidesPerView : 2,
					spaceBetween : 0,
					slidesPerGroup: 2,
				},
				// when window width is <= 640px
				992 : {
					slidesPerView : 3,
					spaceBetween : 0,
					slidesPerGroup: 3,
				},
				1200 : {
					slidesPerView : 4,
					spaceBetween : 0,
					slidesPerGroup: 4,
				}
			}		
		});
		
		var swiper4 = new Swiper('.swiper4', {
			slidesPerView : 5,
			spaceBetween : 0,
			slidesPerGroup: 5,
			loop: true,
			navigation: {
			    nextEl: '.next4',
			    prevEl: '.prev4',
			},
			breakpoints : {
				// when window width is <= 320px
				350 : {
					slidesPerView : 1,
					spaceBetween : 0,
					slidesPerGroup: 1,
				},
				// when window width is <= 480px
				768 : {
					slidesPerView : 2,
					spaceBetween : 0,
					slidesPerGroup: 2,
				},
				// when window width is <= 640px
				992 : {
					slidesPerView : 3,
					spaceBetween : 0,
					slidesPerGroup: 3,
				},
				1200 : {
					slidesPerView : 4,
					spaceBetween : 0,
					slidesPerGroup: 4,
				}
			}		
		});
	
		var swiper5 = new Swiper('.swiper5', {
			slidesPerView : 5,
			spaceBetween : 0,
			slidesPerGroup: 5,
			loop: true,
			navigation: {
			    nextEl: '.next5',
			    prevEl: '.prev5',
			},
			breakpoints : {
				// when window width is <= 320px
				350 : {
					slidesPerView : 1,
					spaceBetween : 0,
					slidesPerGroup: 1,
				},
				// when window width is <= 480px
				768 : {
					slidesPerView : 2,
					spaceBetween : 0,
					slidesPerGroup: 2,
				},
				// when window width is <= 640px
				992 : {
					slidesPerView : 3,
					spaceBetween : 0,
					slidesPerGroup: 3,
				},
				1200 : {
					slidesPerView : 4,
					spaceBetween : 0,
					slidesPerGroup: 4,
				}
			}		
		});

		var swiper6 = new Swiper('.swiper6', {
			slidesPerView : 5,
			spaceBetween : 0,
			slidesPerGroup: 5,
			loop: true,
			navigation: {
			    nextEl: '.next6',
			    prevEl: '.prev6',
			},
			breakpoints : {
				// when window width is <= 320px
				350 : {
					slidesPerView : 1,
					spaceBetween : 0,
					slidesPerGroup: 1,
				},
				// when window width is <= 480px
				768 : {
					slidesPerView : 2,
					spaceBetween : 0,
					slidesPerGroup: 2,
				},
				// when window width is <= 640px
				992 : {
					slidesPerView : 3,
					spaceBetween : 0,
					slidesPerGroup: 3,
				},
				1200 : {
					slidesPerView : 4,
					spaceBetween : 0,
					slidesPerGroup: 4,
				}
			}		
		});
		
	</script>
</body>
</html>

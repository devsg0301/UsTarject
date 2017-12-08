<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path_root"  value="${pageContext.request.contextPath}" scope="application"/>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:import url="../common/includecommon.jsp" />
	
	<link rel="stylesheet" type="text/css" href="${path_root}/resources/bootstrap/css/jquery-responsiveGallery.css">
	<script type="text/javascript" src="${path_root}/resources/bootstrap/js/modernizr.custom.js"></script>
	<script type="text/javascript" src="${path_root}/resources/bootstrap/js/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="${path_root}/resources/bootstrap/js/jquery.responsiveGallery.js"></script>
	<script type="text/javascript">
		$(function () {
			$('.responsiveGallery-wrapper').responsiveGallery({
				animatDuration: 400,
				$btn_prev: $('.responsiveGallery-btn_prev'),
				$btn_next: $('.responsiveGallery-btn_next')
			});
		});

	</script>
</head>
<body>
	<!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <c:import url="../common/header.jsp" />
        <!-- /.container -->
    </nav>
    <header id="myCarousel" class="carousel slide">
    	<div class="carousel-inner">
			<section id="responsiveGallery-container" class="responsiveGallery-container">
				<a class="responsiveGallery-btn responsiveGallery-btn_prev"	href="javascript:void(0);"></a>
				<a class="responsiveGallery-btn responsiveGallery-btn_next"	href="javascript:void(0);"></a>
				<ul class="responsiveGallery-wrapper">
					<li class="responsiveGallery-item">
						<a href="#"	class="responsivGallery-link">
							<img src="${path_root}/resources/bootstrap/images/마녀의법정2.jpg" height="300" width="300" alt="" class="responsivGallery-pic">
						</a>
						<div class="w-responsivGallery-info">
							<h2 class="responsivGallery-name">Google</h2>
						</div>
					</li>
					<li class="responsiveGallery-item">
						<a href="#"	class="responsivGallery-link">
							<img src="${path_root}/resources/bootstrap/images/마녀의법정2.jpg" height="300"	width="300" alt="" class="responsivGallery-pic">
						</a>
						<div class="w-responsivGallery-info">
							<h2 class="responsivGallery-name">Google</h2>
						</div>
					</li>
					<li class="responsiveGallery-item">
						<a href="#"	class="responsivGallery-link">
							<img src="${path_root}/resources/bootstrap/images/마녀의법정2.jpg" height="300"	width="300" alt="" class="responsivGallery-pic">
						</a>
						<div class="w-responsivGallery-info">
							<h2 class="responsivGallery-name">Google</h2>
						</div>
					</li>
					<li class="responsiveGallery-item">
						<a href="#"	class="responsivGallery-link">
							<img src="${path_root}/resources/bootstrap/images/마녀의법정2.jpg" height="300"	width="300" alt="" class="responsivGallery-pic">
						</a>
						<div class="w-responsivGallery-info">
							<h2 class="responsivGallery-name">Google</h2>
						</div>
					</li>
					<li class="responsiveGallery-item">
						<a href="#"	class="responsivGallery-link">
							<img src="${path_root}/resources/bootstrap/images/마녀의법정2.jpg" height="300"	width="300" alt="" class="responsivGallery-pic">
						</a>
						<div class="w-responsivGallery-info">
							<h2 class="responsivGallery-name">Google</h2>
						</div>
					</li>
					<li class="responsiveGallery-item">
						<a href="#"	class="responsivGallery-link">
							<img src="${path_root}/resources/bootstrap/images/마녀의법정2.jpg" height="300"	width="300" alt="" class="responsivGallery-pic">
						</a>
						<div class="w-responsivGallery-info">
							<h2 class="responsivGallery-name">Google</h2>
						</div>
					</li>
					<li class="responsiveGallery-item">
						<a href="#"	class="responsivGallery-link">
							<img src="${path_root}/resources/bootstrap/images/마녀의법정2.jpg" height="300"	width="300" alt="" class="responsivGallery-pic">
						</a>
						<div class="w-responsivGallery-info">
							<h2 class="responsivGallery-name">Google</h2>
						</div>
					</li>
				</ul>
			</section>
		</div>
    </header>
	<div class="container">
			
	</div>
	<div>
	<!-- Footer -->
        <footer>
            <c:import url="../common/footer.jsp" />
        </footer>
	</div>
</body>
</html>
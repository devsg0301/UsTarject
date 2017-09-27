<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<c:set var="path_root"  value="${pageContext.request.contextPath}" scope="application"/>

<!DOCTYPE html>
<html lang="ko">

<head>
	<c:import url="../common/includecommon.jsp" />
<style type="text/css">
video{
	width:100%;
	max-width:680px;
	height:auto;
}

.col-video{
	width: 100%;
	max-width:680px;
	margin: 10px auto;
	height:auto;
}
</style>

<link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet" />
<script src="http://vjs.zencdn.net/c/video.js"></script>

<script type="text/javascript">
	
	function copy_trackback(trb) {
		
        var IE=(document.all)?true:false;
        if (IE) {
            if(confirm("이 글의 트랙백 주소를 클립보드에 복사하시겠습니까?"))
                window.clipboardData.setData("Text", "http://devsg.gq:8081/LocalUser/data/" + encodeURI(trb));
        } else {
            temp = prompt("이 글의 트랙백 주소입니다. Ctrl+C를 눌러 클립보드로 복사하세요", "http://devsg.gq:8081/LocalUser/data/" + encodeURI(trb));
        }
    }
	
	function vidEvent() {
		var videos = document.getElementsByTagName('video');
		var vidCount = videos.length;
		for(i=0;i<vidCount;i++) {
			videos[i].addEventListener('click',bang,false);
		}
	}
	function bang() { this.play(); }
	
	window.onload = vidEvent;

</script>
</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <c:import url="../common/header.jsp" />
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">${broadcastDetail.title }
                </h1>
                <ol class="breadcrumb">
                    <li><a href="/defaults/main.do">Home</a>
                    </li>
                    <li class="active">sgCloud View</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">

			<!-- sgCloud Sidebar Widgets Column -->

            <!-- sgCloud View Content Column -->
            <div class="col-lg-8" style="width: 100%;">

                <!-- sgCloud View -->

                <hr>

                <!-- Date/Time -->
                <p><i class="fa fa-clock-o"></i> Viewed on <fmt:formatDate value="${broadcastDetail.insert_date}" pattern="yyyy-MM-dd HH:dd"/></p>

                <hr>

                <!-- Preview Image -->
                <div class="col-video">
	      			<video width="680" height="430" controls >
	      				<source src="http://devsg.gq:8081/LocalUser/data/${broadcastDetail.file_url}" />
	      				
			   			<track kind="subtitles" src="${path_root}/resources/subtitles/${broadcastDetail.sub_url}" srclang="ko" label="Korean" default/>
	      			</video>
      			</div>
      			<p>영상이 재생되지 않을 경우에는 아래 링크를 눌러주세요. <a href="http://devsg.gq:8081/LocalUser/data/${broadcastDetail.file_url}">링크</a></p>
      			
      			<p>링크 복사를 통해  URL재생을 이용하시면 됩니다.(아이폰) <a href="#" onclick="copy_trackback('${broadcastDetail.file_url}');">링크복사</a></p>
      			
                <hr>

                <!-- View Content -->

                <hr>

                <!-- sgCloud Comments -->

                <!-- Comments Form -->
                <div class="well">
                    <h4>Leave a Comment:</h4>
                    <form action="/broadcast/comment_ok.do" name="tbroadcast_comment" method="post" class="bd_wrt cmt_wrt clear">
						<input type="hidden" name="idx" value="${broadcastDetail.idx }">
						<input type="hidden" name="seq_re" value="0">
						<input type="hidden" name="gap" value="0">
						<div class="form-group">
							<textarea id="comment" name="comment" cols="50" rows="4" style="overflow: hidden; min-height: 4em; height: 52px; width: 100%;"></textarea>
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>
                </div>

                <hr>

                <!-- Viewed Comments -->

                <!-- Comment -->
                <c:forEach var="tbroadcast_comment_list" items="${tbroadcast_comment_list}">
                <div class="media">
                   	<a class="pull-left" href="#">
                        <img class="media-object" src="http://placehold.it/64x64" alt="">
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading">${tbroadcast_comment_list.insert_id}
                            <small><fmt:formatDate value="${tbroadcast_comment_list.insert_date}" pattern="yyyy-MM-dd HH:mm"/></small>
                        </h4>
                        ${tbroadcast_comment_list.comment}
                    </div>
                </div>
				</c:forEach>
            </div>
        </div>
        <!-- /.row -->

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->

</body>

</html>

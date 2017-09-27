<%-- -----------------------------------------------
 * Name    : includecommon.jsp
 ----------------------------------------------- --%>
<%@page contentType="text/html; charset=utf-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core"           prefix="c"     %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"            prefix="fmt"   %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions"  	prefix="fn"    %>

<%
String useragent = request.getHeader("User-Agent");
if(useragent == null) useragent = "Android";
boolean androidAgent = useragent.indexOf("Android") > -1;
boolean iosAgent = (useragent.indexOf("iPhone") > -1 || useragent.indexOf("iPod") > -1 ||  useragent.indexOf("iPad") > -1 );
boolean naverAgent = useragent.indexOf("NAVER") > -1;
boolean appFlag = useragent.indexOf("bandaimallapp") > -1;
%>

<!--<meta http-equiv="refresh" content="0;url=http://www.bandaimall.co.kr/serverchange.html" />-->
<c:set var="path_root"  value="${pageContext.request.contextPath}" scope="application"/>

<!-- app flag -->
<c:set var="app_flag"     value='<%=appFlag%>' 		scope="application"/>
<c:set var="androidAgent" value='<%=androidAgent%>' scope="application"/>
<c:set var="iosAgent"     value='<%=iosAgent%>' 	scope="application"/>
<c:set var="naverAgent"   value='<%=naverAgent%>'   scope="application"/>

<meta charset="utf-8">
<meta http-equiv="Content-Type"  content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=2.0,user-scalable=no">
<meta name="format-detection" content="telephone=no" />
<meta name="description" content="">
<meta name="author" content="">
<title>viCloud</title>

<!-- Bootstrap Core CSS -->
<link href="${path_root}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${path_root}/resources/bootstrap/css/modern-business.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${path_root}/resources/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->


<!-- jQuery -->
<script src="${path_root}/resources/bootstrap/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="${path_root}/resources/bootstrap/js/bootstrap.min.js"></script>

<!-- Script to Activate the Carousel -->

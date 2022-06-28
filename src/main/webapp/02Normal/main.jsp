<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  	<title>NongDamGom</title>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<!-- 맨위에 상단 로고 글씨로 넣는 버전 -->
	<!-- <div class="p-5 text-white text-center" style="background-color: #B4E8E6">
		<h1 style="font-weight: bold; font-family:Hobo BT;"><img src="./images/simple.png" alt="기본당곰얼굴" width="70px" height="60px"/>NongDamGom</h1>
	</div> -->
	<!-- 맨위에 상단로그 이미지로 -->
	<div class="p-5 text-white text-center" style="background-color: #B4E8E6">
		<a href="../02Normal/main.jsp"><img src="./images/simple.png" alt="기본당곰얼굴" width="70px" height="60px"/><img src="./images/logo2.png" alt="상단로고2" height="55px"/></a>
	</div>
	<%-- <div style="text-align: right; background-color: #B4E8E6;">
		<span style="font-family:HY강M; font-weight: bold;">
			환영합니다, <%= session.getAttribute("userid") %>님
		</span>
	</div> --%>
	<div style="text-align: right; background-color: #B4E8E6;">
		<%
	    if (session.getAttribute("userid") == null) {
	    	//session영역에 저장된 속성값이 없다면 로그아웃 상태이다.
	    	//그러므로 로그인 폼이 화면에 출력되어야 한다.
	    %>
	   	<a href="../login.do"><img src="./images/login.png" alt="로그인" width="70px;" height="60px" /></a>
	    <% 
	    }
	    else {
	    %>
	    <span style="font-family:HY강M; font-weight: bold;">환영합니다, <%= session.getAttribute("userid") %> 님</span>
	    <a href="logout.jsp"><img src="./images/logout.png" alt="로그아웃" width="50px;" height="50px"  /></a>
	    <%}%>
	    
	    <%
	    if (session.getAttribute("userid") != null) {
	    	Object object = session.getAttribute("userid");
			String string = (String)object;
	    	if ( string.equals("admin")) {
	    %>
	   	<a href="../01Admin/main.jsp"><img src="./images/bell.png" alt="관리자페이지" width="50px;" height="50px"/></a>
	    <% 
	    	}
	    }
	    %>
	</div>
	
	<%-- <%
    if (session.getAttribute("userid") == null) {
    	//session영역에 저장된 속성값이 없다면 로그아웃 상태이다.
    	//그러므로 로그인 폼이 화면에 출력되어야 한다.
    %>
   	<a href="../login.do"><img src="./images/login.png" alt="로그인" width="70px;" height="60px" /></a>
    <% 
    }
    else {
    %>
    <span style="font-family:HY강M; font-weight: bold;">환영합니다, <%= session.getAttribute("userid") %> 님</span>
    <a href="logout.jsp"><img src="./images/logout.png" alt="로그아웃" width="50px;" height="40px"  /></a>
    <a href="../02Normal/buy.jsp"><img src="./images/buy.png" alt="장바구니" width="65px;" height="70px" /></a>
    <%}%> --%>

	<nav class="navbar navbar-expand-sm" style="background-color: #FFFED9">
	  	<div class="container-fluid justify-content-center">
		    <ul class="navbar-nav">
		    	<!-- 토글 달거면 이거로 다시 수정 -->
		    	<!-- <li class="nav-item dropdown">
		          	<a class="nav-link dropdown" href="#" role="button" data-bs-toggle="dropdown" style="color: black; font-family:한컴 백제 B; font-size: 20px">
		          	게시판</a>
		          	<ul class="dropdown-menu">
		            	<li><a class="dropdown-item" href="#" style="font-family:한컴 백제 M;">팬아트</a></li>
		            	<li><a class="dropdown-item" href="#" style="font-family:한컴 백제 M;">상품자랑</a></li>
		            	<li><a class="dropdown-item" href="#" style="font-family:한컴 백제 M;">자유게시판</a></li>
		          	</ul>
		        </li> -->
		      	<li class="nav-item">
		        	<a class="nav-link active" href="../02Normal/notice.jsp" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">공지사항</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link active" href="../02Normal/introduce.jsp" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">소개</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link active" href="../02Normal/shop.jsp" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">상품판매</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link active" href="../list.do" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">게시판</a>
		      	</li>
		      	<!-- <li class="nav-item">
		        	<a class="nav-link" href="#" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">추천좀</a>
		      	</li> -->
		    </ul>
	  	</div>
	  		<!-- <a href="../login.do"><img src="./images/login.png" alt="로그인" width="70px;" height="60px" /></a> -->
		    <!-- <a href="../02Normal/buy.jsp"><img src="./images/buy.png" alt="장바구니" width="65px;" height="70px" /></a> -->
	</nav>
	<!-- 메인 -->
	<div class="container-fluid" style="background-color: rgb(252, 252, 249);">
		<!-- Carousel -->
		<div id="demo" class="carousel slide" data-bs-ride="carousel">
		
		  	<!-- Indicators/dots -->
		  	<div class="carousel-indicators">
		    	<button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
		    	<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
		    	<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
		    	<button type="button" data-bs-target="#demo" data-bs-slide-to="3"></button>
		    	<button type="button" data-bs-target="#demo" data-bs-slide-to="4"></button>
		    	<button type="button" data-bs-target="#demo" data-bs-slide-to="5"></button>
		  	</div>
		  
		  	<!-- The slideshow/carousel -->
		  	<div class="carousel-inner">
		    	<div class="carousel-item active">
		      		<img src="./images/sell1.png" alt="메인상품추천1" class="d-block" style="width:100%">
		    	</div>
		    	<div class="carousel-item">
		      		<img src="./images/sell2.png" alt="메인상품추천2" class="d-block" style="width:100%">
		    	</div>
		    	<div class="carousel-item">
		      		<img src="./images/sell3.png" alt="메인상품추천3" class="d-block" style="width:100%">
		    	</div>
		    	<div class="carousel-item">
		      		<img src="./images/sell4.png" alt="메인상품추천4" class="d-block" style="width:100%">
		    	</div>
		    	<div class="carousel-item">
		      		<img src="./images/sell5.png" alt="메인상품추천5" class="d-block" style="width:100%">
		    	</div>
		  	</div>
		  
		  	<!-- Left and right controls/icons -->
		  	<button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
		    	<span class="carousel-control-prev-icon"></span>
		    	<!-- <img src="./images/heart.png" alt="" /> -->
		  	</button>
		  	<button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
		    	<span class="carousel-control-next-icon"></span>
		  	</button>
		</div>
		
		<div class="container-fluid mt-3">
		  	<p style="font-family:HY강M;">아직 입고되지 않은 상품들입니다. Cooming Soon!</p>
		</div>
	</div>
	
	<div class="mt-2 p-4 text-black text-center" style="background-color: #FFFED9">
	  	<p style="font-family:Hobo BT;">Copyright &copy; NongDamGom</p>
	</div>
	
</body>
</html>
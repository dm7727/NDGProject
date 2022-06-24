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
		<a href="main.jsp"><img src="./images/simple.png" alt="기본당곰얼굴" width="70px" height="60px"/><img src="./images/logo2.png" alt="상단로고2" height="55px"/></a>
	</div>
	
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
		        	<a class="nav-link active" href="notice.jsp" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">공지사항</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link active" href="introduce.jsp" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">소개</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link active" href="shop.jsp" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">상품판매</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link active" href="board.jsp" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">게시판</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link" href="#" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">추천좀</a>
		      	</li>
		    </ul>
	  	</div>
	  		<a href="./login.jsp"><img src="./images/login.png" alt="로그인" width="70px;" height="60px" /></a>
		    <a href="./buy.jsp"><img src="./images/buy.png" alt="장바구니" width="65px;" height="70px" /></a>
	</nav>
	
	<div class="container-fluid" style="background-color: rgb(252, 252, 249);">
		<h2 style="text-align: center;">여기는 이제 메인 컨텐츠 들어갈 부분</h2>
		<img src="./images/sample.jpg" alt="" />
	</div>
	
	<div class="mt-2 p-4 text-black text-center" style="background-color: #FFFED9">
	  	<p style="font-family:Hobo BT;">Copyright &copy; NongDamGom</p>
	</div>
	
</body>
</html>
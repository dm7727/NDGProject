<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  	<title>NongDamGom - notice</title>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="p-5 text-white text-center" style="background-color: #B4E8E6">
		<a href="main.jsp"><img src="./images/simple.png" alt="기본당곰얼굴" width="70px" height="60px"/><img src="./images/logo2.png" alt="상단로고2" height="55px"/></a>
	</div>
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
	</div>
	
	<nav class="navbar navbar-expand-sm" style="background-color: #FFFED9">
	  	<div class="container-fluid justify-content-center">
		    <ul class="navbar-nav">
		      	<li class="nav-item">
		        	<a class="nav-link active" href="#" 
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
		        	<a class="nav-link active" href="../list.do" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">게시판</a>
		      	</li>
		    </ul>
	  	</div>
	</nav>
	<!-- 여기가 메인 컨텐츠 -->
	<div class="container-fluid" style="background-color: rgb(252, 252, 249); font-family:한컴 백제 M;">
		<table>
			<td><img src="./images/noti.png" alt="공지사진" width="500px" height="500px"/></td>
			<td style="padding-left: 30px">
				<h2>이 홈페이지는 공식 홈페이지가 아닙니다!!</h2>
				<br />
				<h4>과제를 위한 임시 홈페이지며 내용은 제작자의 생각일 뿐입니다.</h4>
				<h4>따라서 상업적 창출을 일체 하지않으며 상품은 모두 나가노 마켓에 있습니다.</h4>
				<h4>농담곰은 귀엽습니다.</h4>
			</td>
		</table>
	</div>
	
	<div class="mt-2 p-4 text-black text-center" style="background-color: #FFFED9">
	  	<p style="font-family:Hobo BT;">Copyright &copy; NongDamGom</p>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  	<title>NongDamGom - shop</title>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  	<style type="text/css">
  		*{font-family:HY강M;}
  	</style>
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
		        	<a class="nav-link active" href="notice.jsp" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">공지사항</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link active" href="introduce.jsp" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">소개</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link active" href="#" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">상품판매</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link active" href="../list.do" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">게시판</a>
		      	</li>
		    </ul>
	  	</div>
	</nav>
	<!-- 여기가 메인컨텐츠 -->
	<div class="container-fluid" style="background-color: rgb(252, 252, 249);">
		<h2 style="font-family:HY강M; font-weight: bold;">&lt;문구&gt;</h2>
		<div class="d-flex p-3">
			<div class="p-2 card" style="width:400px">
		    	<img class="card-img-top" src="./images/mate.png" alt="마스킹테이프" width="300px" height="400px">
		    	<div class="card-body">
		      		<h4 class="card-title">마스킹테이프</h4>
		      		<p class="card-text">6000원</p>
		      		<table>
		      			<td>
		      				<form name="frm" method="post" action="./pay.jsp">
						        <input type="submit" value="즉시구매" />
		      					<input type="hidden" name="img" value="./images/mate.png"/><br />
						        <input type="hidden" name="name" value="마스킹테이프"/><br />
						        <input type="hidden" name="price" value="6000" /><br />
						    </form>
		      			</td>
		      			<td style="padding-left: 10px">
		      				 <form name="frm" method="post" action="./buy.jsp">
						        <!-- <input type="submit" value="장바구니" /> -->
						        <input type="hidden" name="img" value="./images/mate.png"/><br />
						        <input type="hidden" name="name" value="마스킹테이프"/><br />
						        <input type="hidden" name="price" value="6000" /><br />
						    </form>
		      			</td>
		      		</table>
		      		<!-- <a href="./pay.jsp" class="btn btn-primary">즉시 구매</a>
		      		<a href="#" class="btn btn-primary">장바구니</a> -->
		    	</div>
		  	</div>
		  	<div class="p-2 card" style="width:400px">
		  		<img class="card-img-top" src="./images/memo.png" alt="메모패드" width="300px" height="400px">
		    	<div class="card-body">
		      		<h4 class="card-title">메모패드</h4>
		      		<p class="card-text">3000원</p>
		      		<table>
		      			<td>
		      				<form name="frm" method="post" action="./pay.jsp">
						        <input type="submit" value="즉시구매" />
		      					<input type="hidden" name="img" value="./images/memo.png"/><br />
						        <input type="hidden" name="name" value="메모패드"/><br />
						        <input type="hidden" name="price" value="3000" /><br />
						    </form>
		      			</td>
		      			<td style="padding-left: 10px">
		      				 <form name="frm" method="post" action="./buy.jsp">
						       <!--  <input type="submit" value="장바구니" /> -->
						        <input type="hidden" name="img" value="./images/memo.png"/><br />
						        <input type="hidden" name="name" value="메모패드"/><br />
						        <input type="hidden" name="price" value="3000" /><br />
						    </form>
		      			</td>
		      		</table>
		    	</div>
		  	</div>
		  	<div class="p-2 card" style="width:400px">
		  	<img class="card-img-top" src="./images/sti.png" alt="휴대폰스티커" width="300px" height="400px">
		    	<div class="card-body">
		      		<h4 class="card-title">휴대폰스티커</h4>
		      		<p class="card-text">7000원</p>
		      		<table>
		      			<td>
		      				<form name="frm" method="post" action="./pay.jsp">
						        <input type="submit" value="즉시구매" />
		      					<input type="hidden" name="img" value="./images/sti.png"/><br />
						        <input type="hidden" name="name" value="휴대폰스티커"/><br />
						        <input type="hidden" name="price" value="7000" /><br />
						    </form>
		      			</td>
		      			<td style="padding-left: 10px">
		      				 <form name="frm" method="post" action="./buy.jsp">
						        <!-- <input type="submit" value="장바구니" /> -->
						        <input type="hidden" name="img" value="./images/sti.png"/><br />
						        <input type="hidden" name="name" value="휴대폰스티커"/><br />
						        <input type="hidden" name="price" value="7000" /><br />
						    </form>
		      			</td>
		      		</table>
		    	</div>
		  	</div>
		</div>
		
		<h2 style="font-family:HY강M; font-weight: bold;">&lt;리빙&gt;</h2>
		<div class="d-flex p-3">
			<br />
			<div class="p-2 card" style="width:400px">
			<img class="card-img-top" src="./images/cat.png" alt="캣수건" width="300px" height="400px">
		    	<div class="card-body">
		      		<h4 class="card-title">미니 타월</h4>
		      		<p class="card-text">8000원</p>
		      		<table>
		      			<td>
		      				<form name="frm" method="post" action="./pay.jsp">
						        <input type="submit" value="즉시구매" />
		      					<input type="hidden" name="img" value="./images/cat.png"/><br />
						        <input type="hidden" name="name" value="미니타월"/><br />
						        <input type="hidden" name="price" value="8000" /><br />
						    </form>
		      			</td>
		      			<td style="padding-left: 10px">
		      				 <form name="frm" method="post" action="./buy.jsp">
						        <!-- <input type="submit" value="장바구니" /> -->
						        <input type="hidden" name="img" value="./images/cat.png"/><br />
						        <input type="hidden" name="name" value="미니타월"/><br />
						        <input type="hidden" name="price" value="8000" /><br />
						    </form>
		      			</td>
		      		</table>
		    	</div>
		  	</div>
		  	<div class="p-2 card" style="width:400px">
		  		<img class="card-img-top" src="./images/cup.png" alt="스댕컵" width="300px" height="400px">
		    	<div class="card-body">
		      		<h4 class="card-title">스테인리스 컵</h4>
		      		<p class="card-text">15000원</p>
		      		<table>
		      			<td>
		      				<form name="frm" method="post" action="./pay.jsp">
						        <input type="submit" value="즉시구매" />
		      					<input type="hidden" name="img" value="./images/cup.png"/><br />
						        <input type="hidden" name="name" value="스테인리스 컵"/><br />
						        <input type="hidden" name="price" value="15000" /><br />
						    </form>
		      			</td>
		      			<td style="padding-left: 10px">
		      				 <form name="frm" method="post" action="./buy.jsp">
						        <!-- <input type="submit" value="장바구니" /> -->
						        <input type="hidden" name="img" value="./images/cup.png"/><br />
						        <input type="hidden" name="name" value="스테인리스 컵"/><br />
						        <input type="hidden" name="price" value="15000" /><br />
						    </form>
		      			</td>
		      		</table>
		    	</div>
		  	</div>
		  	<div class="p-2 card" style="width:400px">
		  		<img class="card-img-top" src="./images/glo.png" alt="주방장갑" width="300px" height="400px">
		    	<div class="card-body">
		      		<h4 class="card-title">주방장갑</h4>
		      		<p class="card-text">8000원</p>
		      		<table>
		      			<td>
		      				<form name="frm" method="post" action="./pay.jsp">
						        <input type="submit" value="즉시구매" />
		      					<input type="hidden" name="img" value="./images/glo.png"/><br />
						        <input type="hidden" name="name" value="주방장갑"/><br />
						        <input type="hidden" name="price" value="8000" /><br />
						    </form>
		      			</td>
		      			<td style="padding-left: 10px">
		      				 <form name="frm" method="post" action="./buy.jsp">
						        <!-- <input type="submit" value="장바구니" /> -->
						        <input type="hidden" name="img" value="./images/glo.png"/><br />
						        <input type="hidden" name="name" value="주방장갑"/><br />
						        <input type="hidden" name="price" value="8000" /><br />
						    </form>
		      			</td>
		      		</table>
		    	</div>
		  	</div>
		</div>

		<h2 style="font-family:HY강M; font-weight: bold;">&lt;잡화&gt;</h2>		
		<div class="d-flex p-3">
			<div class="p-2 card" style="width:400px">
		  		<img class="card-img-top" src="./images/eco.png" alt="에코백" width="300px" height="400px">
		    	<div class="card-body">
		      		<h4 class="card-title">에코백</h4>
		      		<p class="card-text">15000원</p>
		      		<table>
		      			<td>
		      				<form name="frm" method="post" action="./pay.jsp">
						        <input type="submit" value="즉시구매" />
		      					<input type="hidden" name="img" value="./images/eco.png"/><br />
						        <input type="hidden" name="name" value="에코백"/><br />
						        <input type="hidden" name="price" value="15000" /><br />
						    </form>
		      			</td>
		      			<td style="padding-left: 10px">
		      				 <form name="frm" method="post" action="./buy.jsp">
						        <!-- <input type="submit" value="장바구니" /> -->
						       	<input type="hidden" name="img" value="./images/eco.png"/><br />
						        <input type="hidden" name="name" value="에코백"/><br />
						        <input type="hidden" name="price" value="15000" /><br />
						    </form>
		      			</td>
		      		</table>
		    	</div>
		  	</div>
		  	<div class="p-2 card" style="width:400px">
		  		<img class="card-img-top" src="./images/doll.png" alt="인형" width="300px" height="400px">
		    	<div class="card-body">
		      		<h4 class="card-title">인형</h4>
		      		<p class="card-text">20000원</p>
		      		<table>
		      			<td>
		      				<form name="frm" method="post" action="./pay.jsp">
						        <input type="submit" value="즉시구매" />
		      					<input type="hidden" name="img" value="./images/doll.png"/><br />
						        <input type="hidden" name="name" value="인형"/><br />
						        <input type="hidden" name="price" value="20000" /><br />
						    </form>
		      			</td>
		      			<td style="padding-left: 10px">
		      				 <form name="frm" method="post" action="./buy.jsp">
						       <!--  <input type="submit" value="장바구니" /> -->
						       	<input type="hidden" name="img" value="./images/doll.png"/><br />
						        <input type="hidden" name="name" value="인형"/><br />
						        <input type="hidden" name="price" value="20000" /><br />
						    </form>
		      			</td>
		      		</table>
		    	</div>
		  	</div>
		  	<div class="p-2 card" style="width:400px">
		  		<img class="card-img-top" src="./images/pou.png" alt="파우치" width="300px" height="400px">
		    	<div class="card-body">
		      		<h4 class="card-title">파우치</h4>
		      		<p class="card-text">15000원</p>
		      		<table>
		      			<td>
		      				<form name="frm" method="post" action="./pay.jsp">
						        <input type="submit" value="즉시구매" />
		      					<input type="hidden" name="img" value="./images/pou.png"/><br />
						        <input type="hidden" name="name" value="파우치"/><br />
						        <input type="hidden" name="price" value="15000" /><br />
						    </form>
		      			</td>
		      			<td style="padding-left: 10px">
		      				 <form name="frm" method="post" action="./buy.jsp">
						        <!-- <input type="submit" value="장바구니" /> -->
						       	<input type="hidden" name="img" value="./images/pou.png"/><br />
						        <input type="hidden" name="name" value="파우치"/><br />
						        <input type="hidden" name="price" value="15000" /><br />
						    </form>
		      			</td>
		      		</table>
		    	</div>
		  	</div>
		</div>
	</div>
	
	<div class="mt-2 p-4 text-black text-center" style="background-color: #FFFED9">
	  	<p style="font-family:Hobo BT;">Copyright &copy; NongDamGom</p>
	</div>
</body>
</html>
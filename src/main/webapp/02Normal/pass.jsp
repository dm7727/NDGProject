<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  	<title>NongDamGom - pass</title>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
 	<script type="text/javascript">
	//글쓰기 폼에서 누락된 내용이 있는지 확인하는 함수
	function validateForm(form) {
		
		if(form.pass.value=="") {
			alert("재검증을 위한 비밀번호를 입력하세요.");
			form.pass.focus();
			return false;
		}
	}
	</script>
</head>
<body>
	<div class="p-5 text-white text-center" style="background-color: #B4E8E6">
		<a href="./02Normal/main.jsp"><img src="./images/simple.png" alt="기본당곰얼굴" width="70px" height="60px"/><img src="./images/logo2.png" alt="상단로고2" height="55px"/></a>
	</div>
	<div style="text-align: right; background-color: #B4E8E6;">
		<%
	    if (session.getAttribute("userid") == null) {
	    	//session영역에 저장된 속성값이 없다면 로그아웃 상태이다.
	    	//그러므로 로그인 폼이 화면에 출력되어야 한다.
	    %>
	   	<a href="./login.do"><img src="./images/login.png" alt="로그인" width="70px;" height="60px" /></a>
	    <% 
	    }
	    else {
	    %>
	    <span style="font-family:HY강M; font-weight: bold;">환영합니다, <%= session.getAttribute("userid") %> 님</span>
	    <a href="./02Normal/logout.jsp"><img src="./images/logout.png" alt="로그아웃" width="50px;" height="50px"  /></a>
	    <%}%>
	</div>
	
	<nav class="navbar navbar-expand-sm" style="background-color: #FFFED9">
	  	<div class="container-fluid justify-content-center">
		    <ul class="navbar-nav">
		      	<li class="nav-item">
		        	<a class="nav-link active" href="./02Normal/notice.jsp" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">공지사항</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link active" href="./02Normal/introduce.jsp" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">소개</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link active" href="./02Normal/shop.jsp" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">상품판매</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link active" href="./list.do" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">게시판</a>
		      	</li>
		    </ul>
	  	</div>
	</nav>
	<!-- 여기가 컨텐츠 -->
	<div class="container-fluid" style="background-color: rgb(252, 252, 249);">
		<form name="writeFrm" method="post"  
			action="./pass.do" onsubmit="return validateForm(this);">
		<!--  
		해당 요청명으로 넘어온 파라미터는 컨트롤러에서 받은 후 request영역에 저장하여
		View에서 확인할 수 있지만, EL을 이용하면 해당 과정없이 param내장객체로 즉시 값을 받아올 수 있다.
		
		※hidden박스를 사용하는 경우 웹브라우저에서는 숨김처리 되기 때문에 값이 제대로 입력되었는지
		화면으로 확인할 수 없다. 따라서 개발자모드를 사용하거나 type을 디버깅용으로
		잠깐 수정한 후 값이 제대로 입력되었는지 반드시 확인해야 한다.
		-->
		<input type="hidden" name="idx" value="${param.idx }" />
		<input type="hidden" name="mode" value="${mode }" />
		<br />
		<h5 style="font-family:한컴 백제 M;">재검증을 위해 비밀번호를 입력해주세요.</h2>
		<table border="1" width="90%">
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="pass" style="width:100px;" />
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">작성완료</button>
					<button type="reset">RESET</button>
					<button type="button" onclick="location.href='./list.do';">
						목록 바로가기</button>
				</td>
			</tr>
		</table>
		</form>
	</div>
	
	<div class="mt-2 p-4 text-black text-center" style="background-color: #FFFED9">
	  	<p style="font-family:Hobo BT;">Copyright &copy; NongDamGom</p>
	</div>
</body>
</html>
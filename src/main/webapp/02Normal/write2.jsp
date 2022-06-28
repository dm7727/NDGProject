<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  	<title>NongDamGom - write</title>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
		//글쓰기 폼에서 누락된 내용이 있는지 확인하는 함수
		function validateForm(form) {
			if(form.name.value=="") {
				alert("작성자를 입력하세요.");
				form.name.focus();
				return false;
			}
			if(form.title.value=="") {
				alert("제목을 입력하세요.");
				form.title.focus();
				return false;
			}
			if(form.content.value=="") {
				alert("내용을 입력하세요.");
				form.content.focus();
				return false;
			}
			if(form.pass.value=="") {
				alert("비밀번호를 입력하세요.");
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
	   	<a href="../login.do"><img src="./images/login.png" alt="로그인" width="70px;" height="60px" /></a>
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
	<!-- 여기 컨텐츠 글쓰기 -->
	<div class="container-fluid" style="background-color: rgb(252, 252, 249);">
		<h2>파일 첨부형 게시판 - 글쓰기(Write)</h2>
		<!--  
			파일을 첨부하기 위한 작성폼은 아래 2가지 조건이 지켜져야 한다.
			1. 전송방식(method)은 post여야 한다.
			2. 인코딩방식(enctype)은 multipart/form-data로 지정해야 한다.
			이와 같이 <form>태그를 구성한 후 전송(submit)하면 일반적인 request객체로는
			폼값을 받을 수 없다. cos.jar 확장라이브러리가 제공하는 MultipartRequest객체를 이용해서
			폼값을 받아야 한다.
		-->
		<form name="writeFrm" method="post" enctype="multipart/form-data" 
			action="./fanwrite.do" onsubmit="return validateForm(this);">
		<table border="1" width="90%">
			<tr>
				<td>작성자</td>
				<td>
					<input type="hidden" name="userid" style="width:150px" value="<%= session.getAttribute("userid") %>" />
					<%= session.getAttribute("userid") %>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title" style="width:90%" />
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content" style="width:90%;height:100px;" ></textarea>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="file" name="ofile1" />
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<input type="hidden" name="pass" style="width:100px;" value='<%= session.getAttribute("pass") %>' />
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">작성완료</button>
					<button type="reset">RESET</button>
					<button type="button" onclick="location.href='./fanlist.do';">
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
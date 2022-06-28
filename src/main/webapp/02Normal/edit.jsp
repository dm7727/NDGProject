<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  	<title>NongDamGom - edit</title>
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
		/* if(form.pass.value=="") {
			alert("비밀번호를 입력하세요.");
			form.pass.focus();
			return false;
		} */
	}
	</script>
</head>
<body>
	<div class="p-5 text-white text-center" style="background-color: #B4E8E6">
		<a href="../02Normal/main.jsp"><img src="./images/simple.png" alt="기본당곰얼굴" width="70px" height="60px"/><img src="./images/logo2.png" alt="상단로고2" height="55px"/></a>
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
		        	<a class="nav-link active" href="./list.do" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">게시판</a>
		      	</li>
		    </ul>
	  	</div>
	</nav>
	<!-- 여기가 컨텐츠 수정테이블 -->
	<div class="container-fluid" style="background-color: rgb(252, 252, 249);">
		<form name="writeFrm" method="post" enctype="multipart/form-data" 
			action="./edit.do" onsubmit="return validateForm(this);">
			
		<!-- 게시물 수정을 위해 일련번호와 기존 파일명을 hidden박스에 추가한다. -->
		<input type="hidden" name="idx" value="${dto.idx }" />
		<!-- 기존의 원본파일명 -->
		<input type="hidden" name="prevOfile" value="${dto.ofile }" />
		<!-- 기존의 서버에 저장된 파일명 -->
		<input type="hidden" name="prevSfile" value="${dto.sfile }" />
		
		<%-- 검증된패스워드: ${pass } --%>
		<table border="1" width="90%">
			<tr>
				<td>작성자</td>
				<td>
					<input type="hidden" name="userid" style="width:150px" value="${dto.userid }" />
					${dto.userid }
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title" style="width:90%" value="${dto.title }" />
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content" style="width:90%;height:100px;" >${dto.content }</textarea>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<c:if test="${not empty dto.sfile }">
						${dto.ofile }
						<input type="checkbox" name="deleteFile" value="1" />
						첨부된 파일을 삭제할 경우 체크해주세요. 체크된 경우에는 새로운
						파일을 업로드 할 수 없습니다.
						<br>
					</c:if>
					<!-- input태그의 type속성이 file타입인 경우에는 value속성은
					의미가 없다. value는 단순히 String(문자열)이므로 이 부분은
					DB에서 처리해야 한다. 해당 <input>태그는 선택한 파일을
					서버로 전송하는 역할을 한다. -->
					<input type="file" name="ofile" />
				</td>
			</tr>
			<!-- 패스워드 검증을 마친후 수정페이지로 진입하였으므로 비밀번호
			입력창은 화면에서 제거한다. -->
			<!-- <tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="pass" style="width:100px;" />
				</td>
			</tr> -->
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
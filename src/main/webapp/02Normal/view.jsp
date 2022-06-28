<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  	<title>NongDamGom - view</title>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
	<!-- 여기가 컨텐츠 수정테이블 -->
	<div class="container-fluid" style="background-color: rgb(252, 252, 249);">
		<table class="table table-bordered" border="1" width="90%">
		    <colgroup>
		        <col width="15%"/> <col width="35%"/>
		        <col width="15%"/> <col width="*"/>
		    </colgroup> 
		    <tr>
		        <td>번호</td> <td>${dto.idx }</td>
		        <td>작성자</td> <td>${dto.userid}</td>
		    </tr>
		    <tr>
		        <td>작성일</td> <td>${dto.postdate }</td>
		        <td>조회수</td> <td>${dto.visitcount }</td>
		    </tr>
		    <tr>
		        <td>제목</td>
		        <td colspan="3">${dto.title }</td>
		    </tr>
		    <tr>
		        <td>내용</td>
		        <td colspan="3" height="100">
		        	${dto.content }
		        	<br />
		        	<c:choose>
		        		<c:when test="${fileType == 'image' }">
		        			<img src="./Uploads/${dto.sfile }" style="max-width: 500px" alt="" />
		        		</c:when>
		        		<c:when test="${fileType eq 'music' }">
		        			<audio src="./Uploads/${dto.sfile }" controls="controls"></audio>
		        		</c:when>
		        	</c:choose>
		        </td>
		    </tr> 
		    <tr>
		        <td>첨부파일</td>
		        <!--  
		        첨부된 파일이 있는 경우에는 파일명과 다운로드 링크를 출력한다.
		        다운로드가 완료되면 카운트 하기 위해 idx(일련번호)를 파라미터로 받는다.
		        -->
		        <td>            
		           <c:if test="${not empty dto.ofile }">
			           ${dto.ofile }
			           <a href="./download.do?ofile=${dto.ofile }&sfile=${dto.sfile}&idx=${dto.idx}">
			           [다운로드]
			           </a>
			           <!-- <button type="button" id="fileDelete" data-bs-toggle="modal" data-bs-target="#myModal">첨부파일삭제</button> -->
		           </c:if>
		        </td>
		         <td>다운로드수</td>
		        <td>${dto.downcount }</td>
		    </tr> 
		    <tr>
		        <td colspan="4" align="center">
		        	<c:choose>
		        		<c:when test="${dto.userid == sessionScope.userid }">
		        		<button type="button" onclick="location.href='./pass.do?mode=edit&idx=${param.idx}';">
		                수정하기
			            </button>
			            <%-- <button type="button" onclick="location.href='./pass.do?mode=delete&idx=${param.idx}';">
			                삭제하기
			            </button> --%>
			            <button type="button" onclick="location.href='./pass.do?mode=delete&idx=${param.idx}';">
			                삭제하기
			            </button>
		        		</c:when>
		        		<%-- <c:otherwise>
		        			<h2>세션이 만료되었습니다. 다시 로그인해주세요.</h2>
		        		</c:otherwise> --%>
		        	</c:choose>
		            <button type="button" onclick="location.href='./list.do';">
		                목록 바로가기
		            </button>
		        </td>
		    </tr>
		</table>
	</div>
	
	<div class="mt-2 p-4 text-black text-center" style="background-color: #FFFED9">
	  	<p style="font-family:Hobo BT;">Copyright &copy; NongDamGom</p>
	</div>
</body>
</html>
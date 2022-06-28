<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  	<title>NongDamGom - list</title>
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
		        	<a class="nav-link active" href="#" 
		        	style="color: black; font-family:한컴 백제 B; font-size: 20px">게시판</a>
		      	</li>
		    </ul>
	  	</div>
	</nav>
	<!-- 메인컨텐츠부분 -->
	<div class="container-fluid" style="background-color: rgb(252, 252, 249);">
		<div class="container mt-3">
		  	<br>
		  	<h2 style="font-family:한컴 백제 B; ">&lt;자유게시판&gt;</h2>
		  	<br />
		  	<!-- <button><a href="#" class ="text-decoration-none">자유게시판</a></button> -->
		  	<button type="button" class="btn btn-outline-primary"><a href="#" class ="text-decoration-none" style="font-family:한컴 백제 B; ">자유게시판</a></button>
		  	<button type="button" class="btn btn-outline-primary"><a href="./fanlist.do" class ="text-decoration-none" style="font-family:한컴 백제 B;">팬아트/ 자랑게시판</a></button>
		  	<!-- <button><a href="./fanlist.do" class ="text-decoration-none">팬아트/ 자랑게시판</a></button> -->
    		<form method="get">  
			    <table class="table table-bordered" border="1" width="90%" style="margin-top: 10px; font-family:한컴 백제 M;">
				    <tr>
				        <td align="center" colspan="6">
				            <select name="searchField">
				                <option value="title">제목</option>
				                <option value="content">내용</option>
				            </select>
				            <input type="text" name="searchWord" />
				            <input type="submit" value="검색하기" />
				        </td>
				    </tr>
			   <!--  </table> -->
		    </form>
			
		    <!-- 목록 테이블 -->
		  <!--   <table border="1" width="90%" style="font-family:한컴 백제 M; "> -->
		        <tr style="text-align: center;">
		            <th width="10%">번호</th>
		            <th width="*">제목</th>
		            <th width="15%">작성자</th>
		            <th width="10%">조회수</th>
		            <th width="15%">작성일</th>
		            <th width="8%">첨부</th>
		        </tr>
			<c:choose>
				<c:when test="${empty boardLists }">
				<!-- 리스트 컬렉션에 저장된 게시물이 없을때 출력부분 -->
					<tr>
						<td colspan="6" align="center">
							등록된 게시물이 없습니다^^*
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<!-- 출력할 게시물이 있는 경우 실행. 리스트 컬렉션에 저장된 게시물의
					갯수만큼 반복하여 목록을 출력함. -->
					<c:forEach items="${boardLists }" var="row" varStatus="loop">
					<tr align="center">
						<td>
							<!-- 
							가상번호 계산하기
							=> 게시물갯수 -(((페이지번호-1) * 페이지당 게시물수) + 해당루프의 index)
							참고로 varStatus속성의 index는 0부터 시작한다.
							
								전체게시물의 갯수가 5개일때
								1페이지의 첫번째 게시물 번호 : 5 - (((1-1) * 2) + 0) = 5
								2페이지의 첫번째 게시물 번호 : 5 - (((2-1) * 2 + 0) = 3 
							-->
							${map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index) }
						</td>
						<td align="left">
							<!-- 제목. 클릭시 상세보기 페이지로 이동함. -->
							<a href="./view.do?idx=${row.idx }">
							${row.title }</a>
						</td>
						<td>${row.userid }</td>
						<td>${row.visitcount }</td>
						<td>${row.postdate }</td>
						<td>
						<!-- 첨부파일이 있을때만 다운로드 링크를 출력함. -->
						<c:if test="${not empty row.ofile }">
							<a href="./download.do?ofile=${row.ofile }&sfile=${row.sfile}&idx=${row.idx}">[Down]</a>
						</c:if>
						</td>
					</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<!-- </table>
		    하단 메뉴(바로가기, 글쓰기)
	    	<table border="1" width="90%" style="font-family:한컴 백제 M; "> -->
		        <tr align="center">
		            <td colspan="6">
		            	${map.pagingImg }
		            </td>
		        </tr>
		        <tr style="text-align: right;">
		            <td width="1000" colspan="6">
		            	<!-- <button type="button" onclick="location.href='./write.do';">글쓰기</button> -->
		            	<%
					    if (session.getAttribute("userid") == null) {
					    	//session영역에 저장된 속성값이 없다면 로그아웃 상태이다.
					    	//그러므로 로그인 폼이 화면에 출력되어야 한다.
					    %>
					    <span>로그인 후 글을 작성하실 수 있습니다.</span>
					   	<a href="./login.do"><img src="./images/login.png" alt="로그인" width="70px;" height="60px" /></a>
					    <% 
					    }
					    else {
					    %>
					    <button type="button" onclick="location.href='./write.do';">글쓰기</button>
					    <%}%>
		            </td>
		        </tr>
		    </table>
		</div>
	</div>
	
	<div class="mt-2 p-4 text-black text-center" style="background-color: #FFFED9">
	  	<p style="font-family:Hobo BT;">Copyright &copy; NongDamGom</p>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>멤버관리</title>
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="./main.jsp">
                <div class="sidebar-brand-icon">
                    <img src="./img/simple.png" alt="당곰이기본얼굴" width="50px" height="50px" />
                </div>
                <div class="sidebar-brand-text mx-3">NDG Admin</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="./memberlist.do">
                   <img src="./img/door.png" alt="빼곰" width="25px" height="25px" />
                    <span>회원관리</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">
            
            <li class="nav-item">
                <a class="nav-link" href="./adminlist.do">
                  <img src="./img/door.png" alt="빼곰" width="25px" height="25px" />
                    <span>자유게시판관리</span></a>
            </li>
            
            <hr class="sidebar-divider">
            
            <li class="nav-item">
                <a class="nav-link" href="./adminlist2.do">
                   <img src="./img/door.png" alt="빼곰" width="25px" height="25px" />
                    <span>팬아트/자랑 게시판 관리</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                	<div class="container" style="text-align: right;">
                	<%
				    if (session.getAttribute("userid") == null) {
				    	//session영역에 저장된 속성값이 없다면 로그아웃 상태이다.
				    	//그러므로 로그인 폼이 화면에 출력되어야 한다.
				    %>
				   	<!-- <a href="../login.do"><img src="./images/login.png" alt="로그인" width="70px;" height="60px" /></a> -->
				   	<span><img src="./images/out.png" alt="나가" width="50px;" height="50px" />
				   	당신은 누구시죠...? 관리자페이지에 함부로 들어오지 마십시오!!</span>
				    <% 
				    }
				    else {
				    %>
				    <span style="font-family:HY강M; font-weight: bold;">&lt;<%= session.getAttribute("userid") %>&gt;으로 접근</span>
				    <%}%>
				    <a href="../02Normal/main.jsp">NongDamGom페이지바로가기</a>
                	</div>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                <form method="get">  
			    <table border="1" width="90%">
				    <tr>
				        <td align="center">
				            <select name="searchField">
				                <option value="userid">아이디</option>
				                <option value="name">이름</option>
				            </select>
				            <input type="text" name="searchWord" />
				            <input type="submit" value="검색하기" />
				        </td>
				    </tr>
			    </table>
		    </form>
					
		    <!-- 목록 테이블 -->
		    <table border="1" width="90%">
		        <tr>
		        	<th>번호</th>
		            <th width="10%">아이디</th>
		            <th width="10%">비밀번호</th>
		            <th width="10%">이름</th>
		            <th width="10%">성별</th>
		            <th width="10%">생일</th>
		            <th width="20%">주소</th>
		            <th width="10%">이메일</th>
		            <th width="10%">핸드폰</th>
		            <th width="10%">등록일</th>
		        </tr>
			<c:choose>
				<c:when test="${empty boardLists }">
				<!-- 리스트 컬렉션에 저장된 게시물이 없을때 출력부분 -->
					<tr>
						<td colspan="6" align="center">
							등록된 회원이 없습니다^^*
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
						<td>
						<a href="./memberview.do?userid=${row.userid }">${row.userid} </a>
						</td>
						<td >${row.pass }</td>
						<td>${row.name }</td>
						<td>${row.gender }</td>
						<td>${row.birthday }</td>
						<td>${row.address }</td>
						<td>${row.email }</td>
						<td>${row.mobile }</td>
						<td>${row.regidate }</td>
					</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</table>
			<table border="1" width="90%">
		        <tr align="center">
		            <td>
		            	${map.pagingImg }
		            </td>
		        </tr>
		    </table>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; NongDamGom </span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>NDG Admin - Main </title>
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">
<!-- 	<div class="p-5 text-white text-center" style="background-color: #B4E8E6">
		<a href="../02Normal/main.jsp"><img src="./images/simple.png" alt="기본당곰얼굴" width="70px" height="60px"/><img src="./images/logo2.png" alt="상단로고2" height="55px"/></a>
	</div> -->
	<div style="text-align: right; color: white;" class="bg-primary">
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
	
    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
                <div class="sidebar-brand-icon">
                    <img src="./img/simple.png" alt="당곰이기본얼굴" width="50px" height="50px" />
                </div>
                <div class="sidebar-brand-text mx-3">NDG Admin </div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                공지 / 소개 수정
            </div>

            <!-- 소개글 관리 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <img src="./img/door.png" alt="빼곰" width="25px" height="25px" />
                    <span>소개글 관리</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">소개합니다</h6>
                        <a class="collapse-item" href="utilities-color.jsp">인사말</a>
                        <a class="collapse-item" href="utilities-border.jsp">캐릭터소개</a>
                        <a class="collapse-item" href="utilities-animation.jsp">작가소개</a>
                        <a class="collapse-item" href="utilities-other.jsp">찾아오시는길</a>
                    </div>
                </div>
            </li>
            
            <!-- 공지사항 관리 -->
			<li class="nav-item">
                <a class="nav-link" href="charts.jsp">
                	<img src="./img/door.png" alt="빼곰" width="25px" height="25px" />
                    <span>공지사항 관리</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                주기능 관리
            </div>

            <!-- 관리자 페이지 관리 : 페이지소스 일단 그냥 둠 - 없애도 될거같음 일단 보류 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <img src="./img/door.png" alt="빼곰" width="25px" height="25px" />
                    <span>관리자페이지관리</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Login Screens:</h6>
                        <a class="collapse-item" href="login.jsp">Login</a>
                        <a class="collapse-item" href="register.jsp">Register</a>
                        <a class="collapse-item" href="forgot-password.jsp">Forgot Password</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Other Pages:</h6>
                        <a class="collapse-item" href="404.jsp">404 Page</a>
                        <a class="collapse-item" href="blank.jsp">Blank Page</a>
                    </div>
                </div>
            </li>
            
            <!-- 상품관리 -->
             <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities2"
                    aria-expanded="true" aria-controls="collapseUtilities2">
                    <img src="./img/door.png" alt="빼곰" width="25px" height="25px" />
                    <span>상품 관리</span>
                </a>
                <div id="collapseUtilities2" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">물품 목록</h6>
                        <a class="collapse-item" href="utilities-color.jsp">문구류</a>
                        <a class="collapse-item" href="utilities-border.jsp">인형</a>
                        <a class="collapse-item" href="utilities-animation.jsp">패션</a>
                        <a class="collapse-item" href="utilities-other.jsp">잡화</a>
                    </div>
                </div>
            </li>

			<!-- 회원관리 -->
			<li class="nav-item">
                <a class="nav-link" href="charts.jsp">
                	<img src="./img/door.png" alt="빼곰" width="25px" height="25px" />
                    <span>회원관리</span></a>
            </li>
            
            <!-- 게시판관리 -->
            <li class="nav-item">
                <a class="nav-link" href="charts.jsp">
                	<img src="./img/door.png" alt="빼곰" width="25px" height="25px" />	
                    <span>게시판관리</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) 이거 누르면 커졌다 작아짐 -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>
        </ul>
    </div>
    <!-- End of Sidebar -->
    
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-4 text-gray-800">Blank Page</h1>

    </div>

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그아웃 하실거면 눌러주세요.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-primary" href="login.jsp">로그아웃</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>

</body>

</html>
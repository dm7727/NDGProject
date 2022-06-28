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
    <title>NDG Admin Main</title>
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
                	<div class="container" style="text-align: center;">
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
					
                    <h2 style="color: red; font-weight: bold;">이곳은 관리자페이지</h2>
                    <h5>관리자는 admin 이다. 아니라면 나가시오.</h5> 
                    <br />
                    <p>
                    관리자 페이지에서 할 수 있는 것은 다음과 같다.<br />
                    <b>회원관리</b> : 회원명단 및 정보보기, 정보수정, 회원삭제 <br />
                    <b>자유게시판관리</b> : 게시물 보기, 게시물 삭제 <br />
                    <b>팬/자랑 게시판관리</b> : 게시물 보기, 게시물 삭제<br />
                    <br />
                    회원관리 기능은 관리자페이지에만 있으며 <br />
                    게시물은 삭제기능만 구현했다. 관리자가 맘에 안들면 삭제하지 굳이 번거롭게 고쳐줄 필요 없기 때문이다.ㅎㅎ<br />
                    어차피 회원의 정보를 다 알기 때문에 삭제를 하지 않고 수정하고 싶으면 홈페이지에서 수정할 수도 있다.
                    </p>
                    <br />
                    <!-- <a href="../02Normal/main.jsp">NongDamGom페이지바로가기</a> -->
                    
                    

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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
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
					        			<img src="../Uploads/${dto.sfile }" style="max-width: 500px" alt="" />
					        		</c:when>
					        		<c:when test="${fileType eq 'music' }">
					        			<audio src="../Uploads/${dto.sfile }" controls="controls"></audio>
					        		</c:when>
					        	</c:choose>
					        </td>
					    </tr> 
					    <tr>
					        <%-- <td>첨부파일</td>
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
					        </td> --%>
					        <c:if test="${not empty dto.ofile }">
						        <td colspan="3">다운로드수</td>
						        <td>${dto.downcount }</td>
					        </c:if>
					    </tr> 
					    <tr>
					        <td colspan="4" align="center">
					        	<%-- <c:choose>
					        		<c:when test="${dto.userid == sessionScope.userid }">
					        		<button type="button" onclick="location.href='./pass.do?mode=edit&idx=${param.idx}';">
					                수정하기
						            </button>
						            <button type="button" onclick="location.href='./pass.do?mode=delete&idx=${param.idx}';">
						                삭제하기
						            </button> --%>
						            <button type="button" onclick="location.href='./admindelete.do?idx=${param.idx}';">
						                삭제하기
						            </button>
					        <%-- 		</c:when>
					        		<c:otherwise>
					        			<h2>세션이 만료되었습니다. 다시 로그인해주세요.</h2>
					        		</c:otherwise>
					        	</c:choose> --%>
					            <button type="button" onclick="location.href='./adminlist.do';">
					                목록 바로가기
					            </button>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NDG - login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
.user_input{border:1px solid rgb(75, 75, 75);width:320px;height:27px;padding:10px;font-size:18px;}
input[type=image]{margin-top: 2px;}
</style>
<script>
function loginValdidate(form){
	//alert("로그인 폼 유효성 체크를 해주세요");
	if(form.userid.value==''){
        alert('아이디를 입력해주세요');
        frm.userid.focus();
        return false;
    }
    if (form.passwd.value == "") {
        alert("패스워드를 입력하세요.");
        form.user_pw.focus();
        return false;
    }
}
</script>
</head>
<body>
<body>
	<div class="p-5 text-white text-center" style="background-color: #B4E8E6">
		<a href="./02Normal/main.jsp"><img src="./images/simple.png" alt="기본당곰얼굴" width="70px" height="60px"/><img src="./images/logo2.png" alt="상단로고2" height="55px"/></a>
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
	  		<!-- <a href="regist.jsp" onClick=""><img src="./images/regi.png" alt="회원가입" width="100px" height="60px" /></a> -->
	  		<!-- <a href="./login.jsp"><img src="./images/login.png" alt="로그인" width="70px;" height="60px" /></a>
		    <a href="./buy.jsp"><img src="./images/buy.png" alt="장바구니" width="65px;" height="70px" /></a> -->
	</nav>
	<div class="container-fluid" style="background-color: rgb(252, 252, 249);">
		<fieldset>
    <table border="0" cellpadding="40" cellspacing="0" width="100%">
        <tr>
            <td align="center" valign="middle">
                <!-- <table border="0" cellpadding="0" cellspacing="0" width="470">
                    <tr>
                        <td align="center"><img src="./images/login_logo.gif" /></td>
                    </tr>
                </table> -->
                <!-- 폼태그여기따!!! 어디로 가는지 여기있다!!! -->
                <form name="loginFrm" action="./login.do" method="post" onsubmit="return loginValdidate(this);">
                <table width="470" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="350">
                            <input type="text" name="userid" placeholder="아이디" class="user_input" />
                        </td>
                        <!-- 로그인완료 버튼 -->
                        <td width="120" rowspan="3" align="right">
                            <input type="image" src="./images/login.png" width="150px" height="100px"/>
                        </td>
                    </tr>
                    <tr height="5">
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="password" name="pass" placeholder="****" class="user_input" />
                        </td>
                    </tr>
                </table>
                <div style="margin-top:15px;"></div>
                <div style="margin-top:15px;"></div>
                <table width="470" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                    	<!-- 회원가입페이지로 넘어감 -->
                        <td align="left">
                            <a href="./regist.do" onClick=""><img src="./images/login_member.gif" alt="아직도 회원이 아니세요?" /></a>
                        </td>
                        <!-- 아이디/비밀번호 찾는 기능 만들어야 함 -->
                        <td colspan="2">
                            <!-- <a href="#" onClick=""><img src="./images/login_idpw.gif" alt="아이디/비밀번호를 잊어버리셨어요?" /></a> -->
                        </td>
                    </tr>
                </table>
                </form>
                <div style="margin-top:30px;"></div>
            </td>
        </tr>
    </table>
</fieldset>
	</div>
	
	<div class="mt-2 p-4 text-black text-center" style="background-color: #FFFED9">
	  	<p style="font-family:Hobo BT;">Copyright &copy; NongDamGom</p>
	</div>
</body>
</html>
</body>
</html>
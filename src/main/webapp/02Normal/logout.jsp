<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//로그아웃 처리를 위한 방법
//1. 회원인증정보를 session영역에서 삭제한다.
session.removeAttribute("userid");
session.removeAttribute("pass");

//2.session영역의 모든 속성을 한꺼번에 삭제한다.
session.invalidate();

response.sendRedirect("./main.jsp");
%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>NDG - logout</title>
</head>
<body>
	
</body>
</html>
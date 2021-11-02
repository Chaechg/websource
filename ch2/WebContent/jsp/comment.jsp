<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--  jsp 주석 --%>
	<!--  html 주석 -->
<%
		//1~10까지 출력
	for (int i = 1; i < 11; i++) {
		out.print(i + "<br>"); 
		//out은 jsp가 제공하는 내장 객체이다.
	}
%>
<div>
	<a href="sendRedirect.jsp">이동</a>
	<a href="main.jsp">main</a>
</div>
</body>
</html>
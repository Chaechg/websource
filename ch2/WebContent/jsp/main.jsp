<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int age= 10;
	//이 내용을 넣자마다 footer.jsp에 빨간줄이 생긴다.
	//Duplicate local variable age
	//하나의 파일로 합쳐지 후에 클래스 파일로 변환되기 때문에, 같은 변수를 선언한 것이 되어 에러가 난다.
%>
<!-- <%@include file ="footer.jsp" %> -->
</body>
</html>
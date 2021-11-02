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
	//1~100 합계
	int total = 0;
	for(int i =1;i<=100;i++) {
		total+=i;
	}
	out.print("<h3>"+total+"</h3>");
	//태그가 많아지면 불편하다.
%>

<h3><%=total%></h3>
<!-- 위와 같이 표현할수도 있다. -->
</body>
</html>
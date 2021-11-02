<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//request 객체 : 사용자의 요청을 가지고 올 수 있다.
	//				사용자가 보낸 값도 가져온다.
	
	//sendRedirect() / forward() 사용시 현재 페이지가 보여지지 않기 때문에 필요없는 코드가 됨
/* 	String page1 = request.getParameter("page");
	String password = request.getParameter("password");
	out.print("page1 : "+page1+"<br>" );
	out.print("password : "+password+"<br>" ); */

	//jsp/forward/admin.jsp => /jsp/forward/adminPage.jsp => /jsp/forward/adminProcess.jsp

//	response.sendRedirect("adminProcess.jsp");
	//페이지 자체가 보이지 않으므로 다른 코드를 쓸 필요가 없다.
	
	
	// jsp/forward/admin.jsp => /jsp/forward/adminPage.jsp == adminProcess.jsp
	// request가 같기 때문에 adminPage.jsp request가 할 수 있는 일을
	// adminProcess.jsp도 할 수 있게 되는 것
	pageContext.forward("adminProcess.jsp");
	//forward는 주소줄과 바디에 보여지는 내용이 다르다.
%>
<!-- <h2><a href="adminProcess.jsp">adminProces</a></h2> -->
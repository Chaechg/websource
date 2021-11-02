<%@page import="user.persistence.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//join.jsp에서 사용자가 넘기는 값 가져오기
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");	
	String passwordchk = request.getParameter("passwordchk");
	String username = request.getParameter("username");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	
	//비밀번호 일치 확인 
	if(password != passwordchk){
		response.sendRedirect("/member/join.jsp");
	}else{
		response.sendRedirect("/index.jsp");
	}
		
	//넘기는 값을 데이터베이스에 입력
	UserDAO dao = new UserDAO();
	//dao.insertMember
	
	
	//


%>

<%@page import="user.persistance.MemberDAO"%>
<%@page import="user.persistance.JdbcUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//사용자의 입력값 가져오기 - 아이디랑 비밀번호
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	
	//db 작업
	Connection con = JdbcUtil.getConnection();
	MemberDAO dao = new MemberDAO(con);
	boolean deleteFlag = dao.delete(userid, password);
	
	//페이지 이동
	if(deleteFlag){
		JdbcUtil.commit(con);
		JdbcUtil.close(con);
		response.sendRedirect("allProcess.jsp");
	}else{
		JdbcUtil.rollback(con);
		JdbcUtil.close(con);
		//값을 가지고 가지 않으므로 select.jsp로 가게된다.
		response.sendRedirect("selectProcess.jsp");
		
				
	}

%>
<%@page import="user.persistance.MemberDAO"%>
<%@page import="user.persistance.JdbcUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="user.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//select.jsp 에서 넘긴 값 가져오기
	MemberDTO dto = new MemberDTO();
	dto.setUserid(request.getParameter("userid"));
	dto.setPassword(request.getParameter("password"));
	
	//db 작업
	Connection con = JdbcUtil.getConnection();
	MemberDAO dao = new MemberDAO(con);
	MemberDTO dto1 = dao.getRow(dto);
	
	JdbcUtil.close(con);
	
	//페이지 이동
	if(dto1!=null){
		request.setAttribute("dto1", dto1);
		pageContext.forward("getMember.jsp");
	}else{ //비밀번호가 틀린 경우
		response.sendRedirect("select.jsp");
	}
%>
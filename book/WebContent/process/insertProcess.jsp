<%@page import="book.persistance.BookDAO"%>
<%@page import="book.persistance.JdbcUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="book.domain.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	//insert.jsp에서 넘긴 값 가져오기
	BookDTO insertDto = new BookDTO();
	insertDto.setCode(request.getParameter("code"));
	insertDto.setTitle(request.getParameter("title"));
	insertDto.setWriter(request.getParameter("writer"));
	insertDto.setPrice(Integer.parseInt(request.getParameter("price")));
	
	//db 작업
	Connection con = JdbcUtil.getConnection();
	BookDAO dao = new BookDAO(con);
	
	boolean insertFlag = dao.insert(insertDto);
	
	//페이지 이동
	String path ="";
	if(insertFlag){
		JdbcUtil.commit(con);
		path = "/index.jsp?tab=all";
	}else{
		JdbcUtil.rollback(con);
		path = "/index.jsp";
	}
	JdbcUtil.close(con);
	response.sendRedirect(path);
%>
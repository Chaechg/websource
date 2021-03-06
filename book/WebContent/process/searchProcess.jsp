<%@page import="book.domain.BookDTO"%>
<%@page import="java.util.List"%>
<%@page import="book.persistance.BookDAO"%>
<%@page import="book.persistance.JdbcUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	//search.jsp에서 넘긴 값 가져오기
	String criteria = request.getParameter("criteria");
	String keyword = request.getParameter("keyword");
	
	//db 작업
	Connection con = JdbcUtil.getConnection();
	BookDAO dao = new BookDAO(con);
	
	List<BookDTO> searchList = dao.search(criteria, keyword);
	
	JdbcUtil.close(con);
	
	//searchList를 담음...
	request.setAttribute("list", searchList);
	
	//페이지 이동
	pageContext.forward("/searchIndex.jsp");
%>
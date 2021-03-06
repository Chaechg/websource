<%@page import="book.domain.BookDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous"
>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"
></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"
></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
	integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
	crossorigin="anonymous"
></script>
</head>
<body>
	<%
	String tab = request.getParameter("tab");

	if (tab == null) {
		tab = "all";
	}
	%>
	<script>
$(function () {
	//자동정렬할 때 단축키 쓰면 좀 전처럼 코드가 바꿔요..그래서 탭 값을 제대로 인식못했네요
	let selectTab = '<%=tab%>'; 
			$("#list-tab a[href='#" + selectTab + "']").tab('show');
		})
	</script>

	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<h1 class="display-4">BOOK / JDBC / 모델 2</h1>
			<p class="lead">도서 정보 입력/수정/삭제/조회</p>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-4">
				<div class="list-group" id="list-tab" role="tablist">
					<a class="list-group-item list-group-item-action active"
						id="list-insert-list" data-toggle="list" href="#insert" role="tab"
						aria-controls="insert"
					>도서정보입력</a>
					<a class="list-group-item list-group-item-action"
						id="list-all-list" data-toggle="list" href="#all" role="tab"
						aria-controls="all"
					>도서목록보기</a>
					<a class="list-group-item list-group-item-action"
						id="list-delete-list" data-toggle="list" href="#delete" role="tab"
						aria-controls="delete"
					>도서정보삭제</a>
					<a class="list-group-item list-group-item-action"
						id="list-modify-list" data-toggle="list" href="#modify" role="tab"
						aria-controls="modify"
					>도서정보수정</a>
					<a class="list-group-item list-group-item-action"
						id="list-search-list" data-toggle="list" href="#search" role="tab"
						aria-controls="search"
					>도서정보검색</a>
				</div>
			</div>
			<div class="col-8">
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade" id="insert" role="tabpanel"
						aria-labelledby="list-insert-list"
					><%@include file="/view/insert.jsp"%></div>
					<div class="tab-pane fade" id="all" role="tabpanel"
						aria-labelledby="list-all-list"
					>
					<%-- 	<%
						List<BookDTO> list = (List<BookDTO>) request.getAttribute("list");
						%> --%>
						
						<%--도사 전체 조회 --%>
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th scope="col">code</th>
									<th scope="col">title</th>
									<th scope="col">writer</th>
									<th scope="col">price</th>
								</tr>
							</thead>
							<tbody>
								<%-- <%
								for (BookDTO dto : list) {
								%>
								<tr>
									<th scope="row"><%=dto.getCode()%></th>
									<td><%=dto.getTitle()%></td>
									<td><%=dto.getWriter()%></td>
									<td><%=dto.getPrice()%></td>
								</tr>
								<%
								}
								%> --%>
								<c:forEach var="dto" items="${list}">
									<tr>
									<th scope="row">${dto.code}</th>
									<td>${dto.title}</td>
									<td>${dto.writer}</td>
									<td>${dto.price}</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="tab-pane fade" id="delete" role="tabpanel"
						aria-labelledby="list-delete-list"
					><%@include file="/view/delete.jsp"%></div>
					<div class="tab-pane fade" id="modify" role="tabpanel"
						aria-labelledby="list-modify-list"
					><%@include file="/view/modify.jsp"%></div>
					<div class="tab-pane fade" id="search" role="tabpanel"
						aria-labelledby="list-search-list"
					><%@include file="/view/search.jsp"%></div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$('#list-tab a[href="#all"]').click(function() {
			location.href = "/list.do";
		});
	</script>
</body>
</html>
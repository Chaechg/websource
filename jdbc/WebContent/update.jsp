<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp"%>
<form action="" method="post">
	<div class="form-group">
		<label for="userid">userid</label> <input type="text"
			class="form-control" id="userid" placeholder="아이디"
			required="required" name="userid">
	</div>
	<div class="form-group">
		<label for="password">password</label> <input type="password"
			class="form-control" id="password" placeholder="현재 비밀번호"
			required="required" name="password">
	</div>
	<div class="form-group">
		<label for="password">new password</label> <input type="password"
			class="form-control" id="password" placeholder="변경 비밀번호"
			required="required" name="password">
	</div>
	<div class="form-group">
		<label for="email">email</label> <input type="text"
			class="form-control" id="email" placeholder="이메일" required="required">
	</div>
	<button type="submit" class="btn btn-primary">Submit</button>
</form>
<%@ include file="/layout/footer.jsp"%>
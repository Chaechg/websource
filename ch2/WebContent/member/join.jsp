<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h2>Join</h2>
		<div>
			<form action="/member/joinProcess.jsp" method="post">
				<div class="form-group">
					<label for="userid">아이디</label> <input type="text"
						class="form-control" id="userid" name="userid"
						placeholder="아이디를 입력하세요">
				</div>
				<div class="form-group">
					<label for="password">비밀번호</label> <input type="password"
						class="form-control" id="password" name="password"
						placeholder="비밀번호를 입력하세요">
				</div>
				<div class="form-group">
					<label for="passwordchk">비밀번호 확인</label> <input type="password"
						class="form-control" id="passwordchk" name="passwordchk"
						placeholder="비밀번호를 다시 입력하세요">
				</div>
				<div class="form-group">
					<label for="username">이름</label> <input type="text"
						class="form-control" id="username" name="username"
						placeholder="이름을 입력하세요">
				</div>
				<div>
					<label for="gender">성별</label>
				</div>

				<div class="form-check form-check-inline">

					<input class="form-check-input" type="radio" name="gender"
						id="gender" value="male"> <label class="form-check-label">남</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="gender"
						id="gender" value="female"> <label
						class="form-check-label">여</label>
				</div>
				<div class="form-group">
					<label for="email">이메일</label> <input type="email"
						class="form-control" id="email" name="email"
						placeholder="example@gmail.com">
				</div>
				<div class="form-group form-check"></div>
				<button type="submit" class="btn btn-primary">입력</button>
				<button type="reset" class="btn btn-secondary">취소</button>
			</form>
		</div>
	</div>


</body>
</html>
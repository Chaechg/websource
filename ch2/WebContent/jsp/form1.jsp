<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div{
		margin-botton: 10px;
	}
	label{
		display: inline-block;
		width:150px; 
	}
	input {
		padding: 5px;
	}
</style>
</head>
<body>
<form action="info.jsp" method="post">
<!--form의 method를 post로 변경함으로써, 주소줄에는 내용이 표시되지 않는다. 그러나 한글 깨짐 -->
      <div>
        <label for="userid">아이디</label>
        <input type="text" name="userid" id="userid" />
      </div>
      <div>
        <label for="password">비밀번호</label>
        <input type="password" name="password" id="password" />
      </div>
      <div>
        <label for="username">이름</label>
        <input type="text" name="username" id="username" />
      </div>
      <button type="submit">전송</button>
    </form>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
      $(function () {
        $("button").click(function (e) {
          //태그가 가지고 있는 기능 막기
          //submit
          e.preventDefault();
          //input 요소 가져오기
          let userid = $("#userid");
          //비밀번호 가져오기
          let password = $("#password");
          //이름 가져오기
          let username = $("#username");

          // 폼 유효성 검증
          if (userid.val() == "") {
            alert("아이디를 확인해 주세요");
            userid.focus();
            return;
          } else if (password.val() == "") {
            alert("패스워드를 확인해 주세요");
            password.focus();
            return;
          } else if (username.val() == "") {
            alert("이름을 확인해 주세요");
            username.focus();
            return;
          }
          //폼 전송
          $("form").submit();
        });
      });
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<label for="userid">userid</label>
		<input type="text" name="userid" id="userid" />
	</div>
	<div>
		<label for="password">password</label>
		<input type="password" name="password" id="password" />
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"
></script>
<script>
$(function () {
	$("#userid").change(function () {
		//userid 중복 검사
		$.ajax({
			url:'registerProcess.jsp',
			type:'post',
			data:{
				userid:$("#userid").val()
			},
			success:function(data){
				//alert(data);
				if ($.trim(data) == 'true') { // trim : true가 들어오나 공백이 있으므로 공백을 제거
					alert("아이디는 사용이 가능합니다.")		
				}else {
					alert("아이디는 사용이 불가능합니다.")
				}
			},
			error:function(xhr,textStatus,error){
				
			}
		})
	})
})
</script>
</body>
</html>
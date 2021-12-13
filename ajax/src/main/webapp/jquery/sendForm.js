/**
 * sendForm.html 
 */
$(function(){
	$("#get").click(function(){
		// 보낼 데이터 가져오기
/*		let userid = $("#userid").val();
		let age = $("#age").val();*/
		
		let formData = $("form").serialize();
		//form 전체를 보낸다면 상기의 방식이 훨씬 더 간단하다.
		
		$.get({
			url:"sendForm.jsp",
			data:formData,
/*			data:{
				userid:userid,
				age:age
			},*/
			success:function(data){ //data에는 jsp파일의 true가 넘어온다.
				alert(data);
			}
		})
	})
	$("#post").click(function(){
		// 보낼 데이터 가져오기
/*		let userid = $("#userid").val();
		let age = $("#age").val();*/
		
		let formData = $("form").serialize();	
		
		$.post({
			url:"sendForm.jsp",
			data:formData,
/*			data:{
				userid:userid,
				age:age
			},*/
			success:function(data){
				alert(data);
			}
		})
	})
})







/*
//body 로드가 되면
window.onload = function(){
	document.getElementById("get").onclick = function(){
		
		// 보낼 데이터 가져오기
		let userid = document.getElementById("userid").value;
		let age = document.getElementById("age").value;
		
		//데이터 전송(비동기)
		let xhr = new XMLHttpRequest();
		xhr.open("get","sendForm.jsp?userid="+userid+"&age="+age);
		xhr.send();
	}
	document.getElementById("post").onclick = function(){
		// 보낼 데이터 가져오기
		let userid = document.getElementById("userid").value;
		let age = document.getElementById("age").value;
		
		//데이터 전송(비동기) 
		let xhr = new XMLHttpRequest();
		xhr.open("post","sendForm.jsp");
		//데이터 전송시 기본값 : application/x-www-form-urlencoded
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("userid="+userid+"&age="+age);
	}
}
*/
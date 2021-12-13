/**
 * getxml.html에서 메뉴 4 클릭시 동작
 */

$(function(){
	$(".container div:last-child").click(function(){
		$.get({
			url:"/data/school.xml",
			success:function(data){
				console.log(data);
				let title = $(data).find("title").text();
				let time = $(data).find("time").text();
				let teacher = $(data).find("teacher").text();
				
				let res = "<ul><li>title : "+title+"</li>";
				res += "<li>time : "+time+"</li>";
				res += "<li>teacher : "+teacher+"</li></ul>";
				
				$('#contents').html(res);
			},
			error:function(xhr,textStatus,error){
				$('#contents').html("데이터 없음");
			}
		})
	})
})

/*//메뉴4와 이벤트 연결
let last_div = document.querySelector(".container div:last-child")
					   .addEventListener('click',makeRequest);
//document.querySelector(".container div:last-child") => container div의 마지막 div를 선택
//.addEventListener('click',makeRequest) =>해당 요소에 이벤트 추가 - 클릭되면 makeRequest를 호출
		
let xhr = new XMLHttpRequest();

function makeRequest(){
	xhr.onreadystatechange = getJson;
	xhr.open("get","/data/school.xml");
	xhr.send(); //null or 비워둠
}	

//서버가 응답하는 경우 호출되는 함수
function getJson(){
	//서버가 보내준 데이터를 contents 영역에 보여주기
	let contents = document.querySelector("#contents");
	
	if(xhr.readyState == 4){
		if(xhr.status == 200){
			//xml 데이터를 가져옴
			let response = xhr.responseXML;
			console.log(response);
			
			/* xml 자체 형태로 그대로 보여줄 때
			
			let school = response.getElementsByTagName("school");
			contents.innerText = school[0].innerHTML;
			//contents.innerHTML로 하면 태그를 해석해서 보여주기 때문에 innerText로 변경
			
			let title = response.getElementsByTagName("title");
			let time = response.getElementsByTagName("time");
			let teacher = response.getElementsByTagName("teacher");
			
			let data = "<ul><li>title : "+title[0].innerHTML+"</li>";
			data += "<li>time : "+time[0].innerHTML+"</li>"
			data += "<li>teacher : "+teacher[0].innerHTML+"</li></ul>"
			
			contents.innerHTML = data;
			
			}else{
				contents.innerHTML = "가져온 데이터 없음";				
			}
		}
	}*/


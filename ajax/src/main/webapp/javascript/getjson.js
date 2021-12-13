/**
 * getjson.html에서 메뉴 4 클릭시 동작
 */

//메뉴4와 이벤트 연결
let last_div = document.querySelector(".container div:last-child")
					   .addEventListener('click',makeRequest);
//document.querySelector(".container div:last-child") => container div의 마지막 div를 선택
//.addEventListener('click',makeRequest) =>해당 요소에 이벤트 추가 - 클릭되면 makeRequest를 호출
		
let xhr = new XMLHttpRequest();

function makeRequest(){
	xhr.onreadystatechange = getJson;
	xhr.open("get","/data/data.json");
	xhr.send(); //null or 비워둠
}	

//서버가 응답하는 경우 호출되는 함수
function getJson(){
	//서버가 보내준 데이터를 contents 영역에 보여주기
	let contents = document.querySelector("#contents");
	
	if(xhr.readyState == 4){
		if(xhr.status == 200){
			//json 데이터를 자바스크립트 객체로 파싱
			let response = JSON.parse(xhr.responseText);
			
			let resText = "<ul><li>version : "+response.version+"</li>";
			resText += "<li>codename : "+response.codename+"</li></ul>";
			
			contents.innerHTML = resText;
			}else{
				contents.innerHTML = "가져온 데이터 없음";				
			}
		}
	}


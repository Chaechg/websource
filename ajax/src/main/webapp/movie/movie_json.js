/**
 * 영화진흥위원회 일일박스 오피스 오픈 api - json 데이터
 */

$(function(){
	init();
	
	$(":button").click(function(){ 
		//: type을 의미 :button => type이 button인 것을 의미
		//"button"은 button 태그를 의미함
		let url = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=";
		url += $("#txtYear").val() + $("#selMon").val() + $("#selDay").val();
		
		console.log(url);
		
		$.getJSON({
			url:url,
			success:function(data){
				console.log(data);
				
				if($(data.boxOfficeResult.dailyBoxOfficeList) === ""){
					alert('데이터가 없습니다.');
				}else{
					let resData = "";
					$(datadata.boxOfficeResult.dailyBoxOfficeList).each(function(idx,item){
						//순위
						resData += item.rank+" 위";
						
						//증감
						let rankInten = item.rankInten;
						
						if(rankInten > 0) resData += "( ▲ ";
						else if(rankInten < 0) resData += "( ▼ ";
						else resData += "(  ";						
						
						resData += rankInten+" )";
						
						//영화코드
						let movieCd = item.movieCd;					
						
						//영화이름
						let movieNm = item.movieNm;
						
						
						resData += "<a href='#' onclick='javascript:show("+movieCd+")'>"+movieNm+"</a><br>";
					})
					$("#msg").html(resData);
				}				
			}
		})
	})	// $(:button) end
})// $(function()) end

function show(movieCd){
	//영화상세정보 요청
	let url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=f5eef3421c602c6cb7ea224104795888&movieCd=";
	url += movieCd;
	
	console.log(url);
	
	$.get({
		url:url,
		success:function(data){
			console.log(data);
			
			let movieInfo = data.movieInfoResult.movieInfo;
			
			//영화 제목(한글)
			let movieNm = movieInfo.movieNm;
			//영화 제목(영어)
			let movieNmEn = movieInfo.movieNmEn;
			//상영시간
			let showTm = movieInfo.showTm;
			//감독명
			let directorNm = movieInfo.directors[0].peopleNm;
			//출연배우명
			//=> for문을 돌려서 actor의 모든 인물 출력
			let peopleNm = " ";		
			
			//출연 배우의 수
			let length = movieInfo.actors.length;
			
			$(movieInfo.actors).each(function(idx, item){ //$는 jQuery에 있는 것을 부르기 위해 사용
				if(idx == length -1){
					peopleNm += item.peopleNm;	
				}else{
					peopleNm += item.peopleNm+",";	
				}
				
			})
			//추출한 내용 보여주기
			let resData = "<ul>";
			resData += "<li>영화제목(국문) : "+movieNm+"</li>";
			resData += "<li>영화제목(영문) : "+movieNmEn+"</li>";
			resData += "<li>상영시간 : "+showTm+" 분</li>";
			resData += "<li>감독 : "+directorNm+"</li>";
			resData += "<li>출연배우 : "+peopleNm+"</li></ul>";
			
			$(".box3").html(resData);
		}
	})
} //show() end

function init(){
	//어제 날짜 추출 
	let newData = new Date();
	let year = newData.getFullYear(); //연도
	let month = newData.getMonth()+1; //월은 0부터 시작하므로 +1
	let day = newData.getDate()-1; //어제 날짜를 구하기 위해서 -1
	
	$("#txtYear").val(year);
	
	if(month < 10){
		month = "0"+month; //1~9의 경우 01~09로 option 설정하였기 때문에 
	}
	if(day < 10){
		day = "0" + day;
	}
	$("#selMon").val(month);
	$("#selDay").val(day);
}

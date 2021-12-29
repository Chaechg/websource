<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String fileName = request.getParameter("fileName");

	//out.print(fileName);
	
	//전송된 파일이 저장된 폴더로 가서 해당 파일 읽어오기
	String uploadPath = "c:\\upload\\"+fileName;
	FileInputStream fis = new FileInputStream(uploadPath);
	
	// java.lang.IllegalStateException:이 응답을 위해 getOutputStream()이 이미 호출되었습니다.라는 서버의 메세지를 해결하기 위해서
	out.clear();
	out = pageContext.pushBody();
	
	//다운로드 시 UUID 값을 떼내고 다운로드 하기(안해도 다운로드에는 문제 없음)
	// underbar(_)의 위치를 파악 => underbar(_) 이후의 값만 fileName으로 취함
	//(한글이름 파일 선택시 문제 생김)
	int pos = fileName.indexOf("_"); 
	fileName = fileName.substring(pos+1);
	
	//브라우저를 통해서 다운로드//
	//MIME 타입 중 application/octet-stream은 모든 타입을 처리할 수 있다. 즉, 모든 미디어파일을 처리할 수 있다.
	response.setContentType("application/octet-stream");
	//url에 붙은 한글은 인코딩이 자동으로 일어난다.(안녕 => %EC%95%88%EB%85%95)
	//한글이름을 가진 파일의 경우, 인코딩 된 파일을 다시 한글로 디코딩해야함
	fileName = new String(fileName.getBytes("utf-8"),"iso-8859-1");	
	//"Content-Disposition", "attachment;filename="이는 이미 정의 되어 있다.
	response.setHeader("Content-Disposition", "attachment;filename="+fileName);
	
	//읽어온 파일을 클라이언트 브라우저로 전송
	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
	int numRead = 0;
	byte[] b = new byte[4896];
	while((numRead = fis.read(b, 0, b.length))!=-1){
		bos.write(b, 0, numRead);	
	}
	bos.flush();
	bos.close();
	fis.close();
%>
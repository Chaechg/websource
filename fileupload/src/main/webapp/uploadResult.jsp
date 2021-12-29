<%@page import="java.util.UUID"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- enctype="multipart/form-data"으로 되어있는 타입은 request.getParameter로 가져올 수 없다. -->
<h1>note : <%=request.getParameter("note") %></h1>
<h1>upfile : <%=request.getParameter("upfile") %></h1>
<hr /> <!-- <hr/>은 줄 긋기  -->
<%-- commons fileupload 이용한 처리 --%>
<%
	//enctype="multipart/form-data"가 맞는지 확인 => true
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);

	if(isMultipart){
		//전송된 파일을 디스크에 저장하기 위한 객체
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		//업로드 가능 사이즈 지정(대략 2kb 정도)
		upload.setSizeMax(2000*1024);
		
		//사용자의 request 분석 및 parsing
		List<FileItem> fileItems = upload.parseRequest(request);
		//List에 note와 upfile 모두 담는다.FileItem은 apache commons에서 나옴 
		String fieldName = null, fileName=null, value=null;
		
/* 		for(FileItem item : fileItems){ //향상된 for문을 사용해도 된다.
			if(item.isFormField()){ // type = text, password, checkbox....
				fieldName = item.getFieldName();
				value = item.getString("utf-8");
				out.print("<h3>일반 데이터</h3>");
				out.print(fieldName+" : "+value+"<br>");
			}else{ // type = file
				fieldName = item.getFieldName();
				fileName = item.getName();
				long size = item.getSize();
				out.print("<h3>파일 데이터</h3>");
				out.print(fieldName+" : "+fileName+"<br>");
				out.print("파일 크기 : "+size);
		} */
		
		Iterator<FileItem> iter = fileItems.iterator(); //Iterator에 담는 방법
		//Iterator는 interface 중 하나 
		//List,Set,Map등 가지고 나오는 방식이 다르므로, 가지고 나오는 방법을 통일하기 위해서 Iterator로 통합. 
		while(iter.hasNext()){ //Itreator 안에 가지고 나올 내용이 있으면 true
			FileItem item = iter.next();
			
			if(item.isFormField()){ // type = text, password, checkbox....은 일반 데이터
				//요소명(name) fieldName으로 가져온다.
				fieldName = item.getFieldName(); 
				//요소 안에 들어있는 value 값
				value = item.getString("utf-8");
				out.print("<h3>일반 데이터</h3>");
				out.print(fieldName+" : "+value+"<br>");
			}else{ // type = filed이면 파일데이터
				//요소명
				fieldName = item.getFieldName();
				//파일명
				fileName = item.getName();
				//업로드된 파일 사이즈
				long size = item.getSize();
				
				File file = null;
				if(!fileName.isEmpty()){
					//파일 저장
					String path = "c:\\upload\\";
					
					//중복되지 않는 고유한 키 값 생성
					UUID uuid = UUID.randomUUID();
					
					//c:\\upload\\고유값_업로드파일명
					file = new File(path+uuid.toString()+"_"+fileName); 
					item.write(file);
				}
				out.print("<h3>파일 데이터</h3>");
				out.print(fieldName+" : "+fileName+"<br>");
				out.print("파일 크기 : "+size);
				
				//파일다운로드 - 다운로드 시킬 파일명 전송
				out.print("<p>");
				out.print("<a href='download.jsp?fileName="+file.getName()+"'>"+fileName+"</a>");
				out.print("</p>");
			}
		}
	}
%>
</body>
</html>
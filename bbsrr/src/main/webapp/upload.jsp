<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.oreilly.servlet.*,com.oreilly.servlet.multipart.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<body>
<%
	String dir = "D:/myjava/bbs/src/main/webapp/upload";
	int max = 10*1024*1024;
	
	try{
		MultipartRequest m = new MultipartRequest(request, dir, max, "UTF-8", new DefaultFileRenamePolicy());
		String file1 = m.getFilesystemName("file1");
		String ofile1 = m.getOriginalFileName("file1");
		String file2 = m.getFilesystemName("file2");
		String ofile2 = m.getOriginalFileName("file2");
		
		if(file1 != null){
%>
		업로드파일 1 : <a href="upload/<%=file1 %>"><%=ofile1 %></a><br><br>
<%			
		}
		if(file2 != null){
%>
		업로드파일 2 : <a href="upload/<%=file2 %>"><%=ofile2 %></a><br><br>
<%			
		}
	} catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>
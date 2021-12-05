<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*, java.io.*, bbs.DBClass" %>
<%@ page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*" %>

<%
	request.setCharacterEncoding("utf-8");
	// String dir = application.getRealPath("/upload");
	String dir = "D:/fullstack prac/bbsrr/src/main/webapp/upload";
	int max = 20 * 1024 * 1024;

	try {
		MultipartRequest mr = new MultipartRequest(request, dir, max, "UTF-8", new DefaultFileRenamePolicy());
		String num = mr.getParameter("num");
		String username = mr.getParameter("username");
		String userpass = mr.getParameter("userpass");
		String subject = mr.getParameter("subject");
		String content = mr.getParameter("content");
		String udate = mr.getParameter("udate");
		String uip = mr.getParameter("uip");
		String sec = mr.getParameter("sec");
		
		String file1 = "";
		String file2 = "";
		String file1Extend = "";
		String file2Extend = "";
		String ofile1 = "";
		String ofile2 = "";
		
		file1 = mr.getFilesystemName("file1");
		file2 = mr.getFilesystemName("file2");
		
		if(file1 != null){
			file1Extend = file1.substring(file1.lastIndexOf(".") + 1);
			ofile1 = mr.getOriginalFileName("file1");
		}
		if(file2 != null){
			file2Extend = file2.substring(file2.lastIndexOf(".")+1);
			ofile2 = mr.getOriginalFileName("file2");
		}
		
	String key = "username = '" + username + "', ";
		   key += "userpass = '" + userpass + "', ";
		   key += "subject = '" + subject + "',";
		   key += "content = '" + content + "',";
		   key += "udate = '" + udate + "',";
		   key += "uip = '" + uip + "',";
		   key += "sec = '" + sec + "'";
	
	String where = " num = '" + num + "'";

	Connection conn = DBClass.getMYSQLConnection();
	DBClass.setUpdate2("bbs01", key, where, conn);
%>
<script>
	alert("저장되었습니다.");
	location.href="../view.jsp?num=<%=num%>";
</script>
<%
}catch(Exception e){
	e.printStackTrace(new PrintWriter(out));
}
%>
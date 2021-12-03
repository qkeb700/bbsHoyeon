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
		String username = mr.getParameter("username");
		String userpass = mr.getParameter("userpass");
		String subject = mr.getParameter("subject");
		String content = mr.getParameter("content");
		String wdate = mr.getParameter("wdate");
		String udate = mr.getParameter("udate");
		String uip = mr.getParameter("uip");
		String sec = mr.getParameter("sec");
		String category = "1";
		category = mr.getParameter("category");
		
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
		
	String[] key = {"category", "username", "userpass", "subject", "content", "nfilename1", "ofilename1", "fileext1", "nfilename2", "ofilename2", "fileext2", "wdate", "udate", "uip", "sec"};
	String[] val = {category, username, userpass, subject, content, file1, ofile1, file1Extend, file2, ofile2, file2Extend, wdate, udate, uip, sec};

	Connection conn = DBClass.getMYSQLConnection();
	DBClass.setInsert("bbs01", key, val, conn);
%>
<script>
	alert("저장되었습니다.");
	location.href="../index.jsp";
</script>
<%
}catch(Exception e){
	e.printStackTrace(new PrintWriter(out));
}
%>
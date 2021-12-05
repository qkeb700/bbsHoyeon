<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import = "java.sql.*, bbs.DBClass" %>

<%
	String username = request.getParameter("username");
	String useremail = request.getParameter("useremail");
	String userid = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int ok = 0;
	String query = "select userid from member where username = ? and useremail = ?";
	try{
		Connection conn = DBClass.getMYSQLConnection();
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, username);
		pstmt.setString(2, useremail);
		rs = pstmt.executeQuery();
		if(rs.next()){
			userid = rs.getString("userid");	
		}
		rs.close();
		pstmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	if(userid == null){
		userid = "";
	}
%>
{"userid": "<%=userid %>", "username" : "<%=username %>", "useremail" : "<%=useremail %>"}
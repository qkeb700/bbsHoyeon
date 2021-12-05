<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, bbs.DBClass" %>    
<% 
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	String useremail2 = request.getParameter("useremail2");
	String userpass = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String query = "select userpass from member where userid = ? and useremail = ?";
	
	try{
		Connection conn = DBClass.getMYSQLConnection();
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, userid);
		pstmt.setString(2, useremail2);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			userpass = rs.getString("userpass");
		}
		rs.close();
		pstmt.close();
		conn.close();
	} catch(Exception e){
		e.printStackTrace();
	}
	if(userpass == null){
		userpass = "";
	}
%>
{"userpass": "<%=userpass%>", "userid": "<%=userid %>", "useremail2":"<%=useremail2 %>"}
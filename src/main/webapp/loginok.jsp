<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import = "java.sql.*, bbs.DBClass" %>

<%
	String userid = request.getParameter("userid");
	String userpass = request.getParameter("userpass");
	String dbUserpass = null;
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int ok = 0;
	String query = "select userpass from member where userid = ?";
	try{
		Connection conn = DBClass.getMYSQLConnection();
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, userid);
		rs = pstmt.executeQuery();
		if(rs.next()){
			ok = 1;
			dbUserpass = rs.getString("userpass");
		}
		rs.close();
		pstmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<%
	if(ok == 1) {
		if(userpass.equals(dbUserpass)){
			session.setAttribute("userid", userid);
%>
		<script>alert("<%=userid%> 님 환엽합니다."); location.href="index.jsp";</script>	
<%				
		} else {
%>
		<script>alert("비밀번호가 틀립니다. 다시 확인해 주세요.");history.back();</script>					
<%			
		}
	} else {
%>
		<script>alert("<%=userid%>인 아이디는 존재하지 않습니다.");history.back();</script>
<%				
	}
%>


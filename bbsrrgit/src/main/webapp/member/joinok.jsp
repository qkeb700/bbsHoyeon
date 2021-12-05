<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import ="java.sql.*, bbs.DBClass" %>
<jsp:useBean id="mem" class="bbs.MemberDTO" scope="page"/>
<jsp:setProperty name="mem" property="*"/>

<%
	String[] key = {"userid" , "userpass", "username", "useremail", "tel", "gender", "geo", "wdate", "udate", "level"};
	String[] value = {
			mem.getUserid(),
			mem.getUserpass(),
			mem.getUsername(),
			mem.getUseremail(),
			mem.getTel(),
			mem.getGender(),
			mem.getGeo(),
			mem.getWdate(),
			mem.getUdate(),
			mem.getLevel()
			};
	
	Connection conn = DBClass.getMYSQLConnection();
	DBClass.setInsert("member", key, value, conn);
	
%>
<script>
alert("회원가입을 완료했습니다.");
location.href="../login.jsp";
</script>
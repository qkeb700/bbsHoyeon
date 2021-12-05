<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.DBClass, java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
String bbsnum = "", username = "", userpass = "", memo = "", wdate = "", uip = "";

bbsnum=request.getParameter("bbsnum");

username=request.getParameter("username");
username=username.replaceAll("'", "`");

userpass=request.getParameter("userpass");
userpass=userpass.replaceAll("'", "`");

memo=request.getParameter("memo");
memo = memo.replaceAll("'", "`");

wdate=request.getParameter("wdate");
uip=request.getParameter("uip");

String[] key = { "bbsnum", "username", "userpass", "memo", "wdate", "uip" };
String[] val = {
		bbsnum,
		username,
		userpass,
		memo,
		wdate,
		uip
};
Connection conn = DBClass.getMYSQLConnection();
DBClass.setInsert(memo, key, val, conn);
%>
<script>
alert("저장했습니다.");
location.href="../view.jsp?num=<%=bbsnum%>";
</script>

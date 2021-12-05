<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%
	request.setAttribute("id", "Lees");
	session.setAttribute("id2", "Parks");
	application.setAttribute("id3", "Moons");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container{
	width:800px;
	padding:40px;
	margin:10px auto;
}
ul{
	list-style:none;
	margin:0;
	padding:0;
}
li{
	padding:10px;
}
label{
	margin-right:30px;
}
.text-center{
	text-align:center;
}
input[type=text]{
	width:100%;
	padding:8px;
}
</style>
</head>
<body>
<%
	Cookie sabre = new Cookie("aa", "bb");
	response.addCookie(sabre);

	String id = (String)request.getAttribute("id");
%>
<p>ID : <%=id %></p>
<p>ID : ${requestScope.id }</p>
<p>ID2 : ${sessionScope.id2}</p>
<p>ID3 : ${applicationScope.id3 }</p>

<div class="container">
	<form action="test2.jsp" name="form" method="post">
		<ul class="form-list">
			<li><label for="">이름</label><input type="text" name="username" /></li>
			<li><label for="">전화번호</label><input type="text" name="usertel" /></li>
			<li><text-center>
				<input type="submit" value="전 송" />
			</text-center></li>
		</ul>
	</form>
</div>

<p> 호스트명 : ${header.host }</p>
<p> 사용브라우저 : ${header["user-agent"] }</p>
<p> 사용언어 : ${header["accept-language"] }</p>
</body>
</html>
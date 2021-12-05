<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("AllPage", "305");
	request.setAttribute("list", "15");
	request.setAttribute("pagelist", "10");
	
	int Allpage = Integer.parseInt((String)request.getAttribute("AllPage"));
	int list= Integer.parseInt((String)request.getAttribute("list"));
	int pglist= Integer.parseInt((String)request.getAttribute("pagelist"));
	int pg = 0;
	
	String page = request.getParameter("page");
	
	if(page != null){
		pg = Integer.parseInt(page);
	}else{
		pg = 1;
	}
	
	int totalPages;
	
	int start_num = 0;
	int end_num = 0;
	
	String pagelist = (String)request.getAttribute("pagelist");
	int plist = Integer.parseInt(pagelist);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul{list-style:none; display:flex; margin:0; padding:0;}
li{padding:5px; border:1px solid #999; margin:2px;}
</style>
</head>
<body>
<div class="pg">
	<%=start_num %>
	<%=end_num %>
</div>
<ul>
<% for(int i = 1; i <= plist; i++){ %>
	<li><a href="test4.jsp?page=<%=i%>"><%=i %></a></li>
<%} %>	
</ul>
</body>
</html>
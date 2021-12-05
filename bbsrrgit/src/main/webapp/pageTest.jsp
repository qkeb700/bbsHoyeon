<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.Paging" %>
<%
	Paging pg = new Paging();
	int cpg = 1;
	if(request.getParameter("cpage") != null){
		cpg = Integer.parseInt(request.getParameter("cpage"));
	}
	pg.setTotalCount(765);
	pg.setDisplayRow(15);
	pg.setDisplayPage(20);
	pg.setPage(cpg);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1><%=pg.getPage() %></h1>
<p>
	시작 : <%=pg.getBeginPage() %>
	끝 : <%=pg.getEndPage() %>
	페이지
</p>
<%
	if(pg.isPrev()){
		out.println("<a href='pageTest.jsp?cpage='><<</a>");
	}

	for(int i = 1; i <= pg.getDisplayPage(); i++){
		
%>
<a href="pageTest.jsp?cpage=<%=i%>"><%=i %></a>
<%
	}
	if(pg.isNext()){
		out.println("<a href='pageTest.jsp?cpage='>>></a>");
	}
%>
</body>
</html>